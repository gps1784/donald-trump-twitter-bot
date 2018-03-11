module Helios
  module Bot
    class SentenceTones
      attr_reader :id, :text, :tones, :raw

      def self.build_tones(sentences_tone)
        arr = []
        sentences_tone["sentences_tone"].each do |sentence_tone|
          arr << new(sentence_tone)
        end
        return arr
      end

      def initialize(sentence_tone)
        @raw   = sentence_tone
        @id    = sentence_tone["sentence_id"]
        @text  = sentence_tone["text"]
        @tones = []
        build_tones(sentence_tone)
      end

      def build_tones(sentence_tone)
        sentence_tone["tones"].each do |tone|
          @tones << Helios::Bot::Tone.new(tone)
        end
      end
    end # class SentenceTones
  end # module Bot
end # module Helios
