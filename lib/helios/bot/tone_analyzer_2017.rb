module Helios
  module Bot
    class ToneAnalyzer_2017 < ToneAnalyzer
      def self.tone(text, options = {})
        response = self.post("/tone", body: { text: text }.to_json,
                             headers: { "Content-Type" => "application/json" },
                             query: default_tone_options.merge(options))

        parsed_response = JSON.parse(response.body)
        new(parsed_response)
      end # self.tone

      attr_reader :document_tone, :sentences_tone, :raw

      def initialize(parsed_response)
        @raw            = parsed_response
        @document_tone  = Helios::Bot::DocumentTones_2017.new(parsed_response)
        @sentences_tone = Helios::Bot::SentenceTones.build_tones(parsed_response)
      end # initialize

      private

      def self.default_tone_options
        {
          version: "2017-09-21"
        }
      end # self.default_tone_options
    end # class ToneAnalyzer
  end # module Bot
end # module Helios
