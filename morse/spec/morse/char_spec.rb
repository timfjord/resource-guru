require 'spec_helper'

describe Morse::Char do
  describe '#upcased' do
    it 'should generate upcased version if passed char' do
      expect(Morse::Char.new('a').upcased).to eql 'A'
      expect(Morse::Char.new('A').upcased).to eql 'A'
      expect(Morse::Char.new('0').upcased).to eql '0'
      expect(Morse::Char.new(',').upcased).to eql ','
    end
  end

  describe '#encoded' do
    it 'should raise error on unknown characters' do
      expect{Morse::Char.new('_').encoded}.to raise_error Morse::InvalidChar
    end

    it 'should encode valid characters' do
      expect(Morse::Char.new('A').encoded).to eql '.-'
      expect(Morse::Char.new('a').encoded).to eql '.-'
    end
  end

  describe '#obfuscated' do
    it 'should generate obfuscated version of encoded char' do
      expect(Morse::Char.new('S').obfuscated).to eql '3'
      expect(Morse::Char.new('s').obfuscated).to eql '3'
      expect(Morse::Char.new('Q').obfuscated).to eql 'B1A'
      expect(Morse::Char.new('q').obfuscated).to eql 'B1A'
      expect(Morse::Char.new('F').obfuscated).to eql '2A1'
      expect(Morse::Char.new('f').obfuscated).to eql '2A1'
    end

    it 'should return encoded version for letter separator' do
      expect(Morse::Char.new('').obfuscated).to eql '|'
    end

    it 'should return encoded version for word separator' do
      expect(Morse::Char.new(' ').obfuscated).to eql '/'
    end
  end

  describe '#==' do
    it 'should compare by upcased value' do
      expect(Morse::Char.new('S')).to eq Morse::Char.new('S')
      expect(Morse::Char.new('S')).to eq Morse::Char.new('s')
    end
  end

  describe '#letter_separator?' do
    it 'should detect if char is letter_separator' do
      expect(Morse::Char.new('S')).not_to be_letter_separator
      expect(Morse::Char.new('')).to be_letter_separator
    end
  end

  describe '#word_separator?' do
    it 'should detect if char is word_separator' do
      expect(Morse::Char.new('S')).not_to be_word_separator
      expect(Morse::Char.new(' ')).to be_word_separator
    end
  end
end
