# frozen_string_literal: true

module Coloring
  module Str
    class Character
      COLORS =%w(black red green yellow blue pink light_blue white rainbow).freeze

      def initialize
        @rainbow_index = 0
        @color = 'white'
      end

      def input(str)
        print "#{send(color)}#{str}"
      end

      def delete
        print "\e[D"
        print " "
        print "\e[D"
      end

      def change_color(color:)
        return unless COLORS.include?(color.to_s)

        @color = color.to_s
      end

      private

      attr_reader :rainbow_index, :color

      def black; "\e[30m"; end
      def red; "\e[31m"; end
      def green; "\e[32m"; end
      def yellow; "\e[33m"; end
      def blue; "\e[34m"; end
      def pink; "\e[35m"; end
      def light_blue; "\e[36m"; end
      def white; "\e[37m"; end

      def rainbow
        num = rainbow_index % 7 + 1

        @rainbow_index += 1

        "\e[3#{num}m"
      end
    end
  end
end
