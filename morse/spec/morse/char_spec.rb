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
end
