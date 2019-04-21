# frozen_string_literal: true

module Coloring
  module Str
    class Editor
      def start
        # NOTE clear a display
        print "\e[1;1H"
        print "\e[J"

        while char = STDIN.getch
          # NOTE exit with Ctrl-C
          exit if char == "\u0003"

          # NOTE move a cursor
          if char == "\e" && STDIN.getch == "["
            char = STDIN.getch

            direction =
              case char
              when 'A', 'B', 'C', 'D'
                char
              else
                nil
              end

            print "\e[#{direction}" if direction
          # NOTE delete a word
          elsif char == "\u007F"
            character.delete
          # NOTE change a word's color
          elsif char == ':'
            input = STDIN.gets.chomp

            character.change_color(color: input)
          # NOTE write words
          else
            character.input(char)
          end
        end
      end

      private

      def character
        @character ||= Character.new
      end
    end
  end
end

