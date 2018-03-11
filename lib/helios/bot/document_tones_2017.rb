module Helios
  module Bot
    class DocumentTones_2017 < DocumentTones
      attr_reader :tones, :raw

      def initialize(document_tone)
        @raw = document_tone["document_tone"]
        @tones = []
        build_tones(document_tone)
      end

      def build_tones(document_tone)
        document_tone["document_tone"]["tones"].each do |tone|
          @tones << Helios::Bot::Tone.new(tone)
        end
      end
    end # class DocumentTones
  end # module Bot
end # module Helios
