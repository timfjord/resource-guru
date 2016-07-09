require 'byebug'

module Morse
  class Text
    attr_reader :str

    def initialize(str)
      @str = str
    end

    def size
      @size ||= @str.size
    end

    def to_a
      @arr ||= begin
        res = []

        0.upto size - 1 do |idx|
          el = Char.new str[idx]
          nxt = idx + 1 < size && Char.new(str[idx + 1])
          last = res.last

          next if el.word_separator? && last && last.word_separator?

          res.push el

          if !el.word_separator? && nxt && !nxt.word_separator?
            res.push Char.new('')
          end
        end

        res
      end
    end

    def encoded
      @encoded ||= to_a.map(&:encoded).join
    end

    def obfuscated
      @obfuscated ||= to_a.map(&:obfuscated).join
    end
  end
end
