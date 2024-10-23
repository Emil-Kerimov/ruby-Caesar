# frozen_string_literal: true

require_relative "Caesar_gem/version"

module CaesarGem
  class Error < StandardError; end
  class Caesar
    # Константи сиволів латинського алфавіта + кирилиці
    LATIN_UPPER_A = 'A'.ord
    LATIN_UPPER_Z = 'Z'.ord
    LATIN_LOWER_A = 'a'.ord
    LATIN_LOWER_Z = 'z'.ord
    CYRILLIC_UPPER_A = 'А'.ord
    CYRILLIC_UPPER_YA = 'Я'.ord
    CYRILLIC_LOWER_A = 'а'.ord
    CYRILLIC_LOWER_YA = 'я'.ord

    def self.encrypt(text, shift)
      text.chars.map do |char|
        if char.match?(/[A-Za-z]/)
          base = char.ord <= LATIN_UPPER_Z ? LATIN_UPPER_A : LATIN_LOWER_A
          ((char.ord - base + shift) % 26 + base).chr
        else
          char
        end
      end.join
    end

    def self.decrypt(text, shift)
      encrypt(text, -shift)
    end
  end

end
