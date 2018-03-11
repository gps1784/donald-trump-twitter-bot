module MarkovsImporter

  def increment_markov_from_score(markov, score)
    score[:frequency] = 1
    score.each_pair do |tone, points|
      score[tone] = points + markov.read_attribute(tone)
    end
    return score
  end # increment_markov_from_score

  def calculate_score_from_tones(tones)
    defaults = Hash.new(0)
    tones.each do |tone|
      defaults[tone.id] =
        case
        when tone.score > 0.75
          2
        when tone.score > 0.5
          1
        else
          0
        end
    end
    return defaults
  end # calculate_score_from_tones

  def import_from_twitter
    tweets = TrumpTweet.oldest.unparsed.popular.limit(20)
    if tweets.length == 0
      STDERR.puts "There are no unparsed tweets downloaded to process. Aborting."
      return
    end
    while( tweets.length > 0 ) do
      ids = tweets.pluck(:id)
      TrumpTweet.where(id: ids).update_all(parsed: true)
      # hand 20 tweets off to Watson via Helios
      # get back the sentence analysis
      response = Helios::Bot::ToneAnalyzer_2017.tone( tweets.map(&:text).join("\n") )
      # walk the sentence, from beginning to end
      # each beginning node should be:
      #   Markov.new(current: nil, next: string)
      # each end of a sentence should be:
      #   Markov.new(current: string, next: nil)
      # NOTE: periods should be removed,
      #       only used at the end of a sentence
      response.sentences_tone.each do |sentence_tone|
        sentence_arr = sentence_tone.text.split
        break if sentence_arr.length == 0
        mc           = Markov.find_or_create_by(current: nil, next: sentence_arr[0])
        scores       = calculate_score_from_tones(sentence_tone.tones)
        updates_hash = increment_markov_from_score(mc, scores)
        mc.update(updates_hash)

        sentence_tone.text.split.each_cons(2) do |current_str, next_str|
          mc           = Markov.find_or_create_by(current: current_str, next: next_str)
          scores       = calculate_score_from_tones(sentence_tone.tones)
          updates_hash = increment_markov_from_score(mc, scores)
          mc.update(updates_hash)
        end # each word pair

        mc           = Markov.find_or_create_by(current: sentence_arr[-1], next: nil)
        scores       = calculate_score_from_tones(sentence_tone.tones)
        updates_hash = increment_markov_from_score(mc, scores)
        mc.update(updates_hash)

      end # sentence_tone
      # queue up more tweets
      tweets = TrumpTweet.oldest.unparsed.popular.limit(20)
    end # while
  end # import_from_twitter
end # module MarkovsImporter
