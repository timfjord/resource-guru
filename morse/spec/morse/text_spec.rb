require 'spec_helper'

RSpec.describe Morse::Text do
  describe '#to_a' do
    it 'should return array with letter and word deviders' do
      text = Morse::Text.new 'I AM IN TROUBLE'
      arr = text.to_a

      expect(arr[0]).to eq Morse::Char.new('I')
      expect(arr[1]).to eq Morse::Char.new(' ')
      expect(arr[2]).to eq Morse::Char.new('A')
      expect(arr[3]).to eq Morse::Char.new('')
      expect(arr[4]).to eq Morse::Char.new('M')
      expect(arr[5]).to eq Morse::Char.new(' ')
      expect(arr[6]).to eq Morse::Char.new('I')
      expect(arr[7]).to eq Morse::Char.new('')
      expect(arr[8]).to eq Morse::Char.new('N')
      expect(arr[9]).to eq Morse::Char.new(' ')
      expect(arr[10]).to eq Morse::Char.new('T')
      expect(arr[11]).to eq Morse::Char.new('')
      expect(arr[12]).to eq Morse::Char.new('R')
      expect(arr[13]).to eq Morse::Char.new('')
      expect(arr[14]).to eq Morse::Char.new('O')
      expect(arr[15]).to eq Morse::Char.new('')
      expect(arr[16]).to eq Morse::Char.new('U')
      expect(arr[17]).to eq Morse::Char.new('')
      expect(arr[18]).to eq Morse::Char.new('B')
      expect(arr[19]).to eq Morse::Char.new('')
      expect(arr[20]).to eq Morse::Char.new('L')
      expect(arr[21]).to eq Morse::Char.new('')
      expect(arr[22]).to eq Morse::Char.new('E')
    end

    it 'should replace consecutive spaces with only one word separator' do
      text = Morse::Text.new 'I   AM'
      arr = text.to_a

      expect(arr[0]).to eq Morse::Char.new('I')
      expect(arr[1]).to eq Morse::Char.new(' ')
      expect(arr[2]).to eq Morse::Char.new('A')
      expect(arr[3]).to eq Morse::Char.new('')
      expect(arr[4]).to eq Morse::Char.new('M')
    end
  end

  describe '#encoded' do
    it 'should generate encoded text' do
      text = Morse::Text.new 'I AM IN TROUBLE'

      expect(text.encoded).to eql '../.-|--/..|-./-|.-.|---|..-|-...|.-..|.'
    end
  end

  describe '#obfuscated' do
    it 'should generate obfuscated text' do
      text = Morse::Text.new('I AM IN TROUBLE')

      expect(text.obfuscated).to eql '2/1A|B/2|A1/A|1A1|C|2A|A3|1A2|1'
    end
  end
end
