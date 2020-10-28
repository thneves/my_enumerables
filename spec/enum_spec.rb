# rubocop:disable Layout/LineLength

require_relative '../enumarable.rb'

describe Enumerable do
  let(:array) { [1, 2, 3, 4, 5] }
  let(:array_mix) { [1, '2', 3, true] }
  let(:string) { %w[surf skate run skate] }
  let(:hash) { { 'one' => 1, 'two' => 2, 'three' => 3 } }
  let(:range) { (1..4) }

  describe '#my_each' do
    context 'iteration through items of argument given' do
      it { expect(array.my_each { |item| p item }).to eql(array.each { |item| p item }) }
      it { expect(hash.my_each { |k, v| p "#{k} and #{v}" }).to eql(hash.each { |k, v| p "#{k} and #{v}" }) }
      it { expect(range.my_each { |num| puts num }).to eql(range.each { |num| puts num }) }
    end

    context 'return to_enum(Enumator) if no block is given' do
      it { expect(range.my_each).to be_an(Enumerator) }
      it { expect(array.my_each).to be_an(Enumerator) }
      it { expect(hash.my_each).to be_an(Enumerator) }
    end
  end

  describe '#my_each_with_index' do
    context 'iteration through item and index of argument given' do
      it { expect(array.my_each_with_index { |item, index| puts "#{item}, index #{index}" }).to eql(array.my_each_with_index { |item, index| puts "#{item}, index #{index}" }) }
      it { expect(range.my_each_with_index { |item, index| puts "#{item}, index #{index}" }).to eql(range.my_each_with_index { |item, index| puts "#{item}, index #{index}" }) }
      it { expect(hash.my_each_with_index { |item, index| puts "#{item}, index #{index}" }).to eql(hash.my_each_with_index { |item, index| puts "#{item}, index #{index}" }) }
    end

    context 'return to_enum(Enumator) if no block is given' do
      it { expect(range.my_each_with_index).to be_an(Enumerator) }
      it { expect(array.my_each_with_index).to be_an(Enumerator) }
      it { expect(hash.my_each_with_index).to be_an(Enumerator) }
    end
  end

  describe '#my_select' do
    context 'returns only numbers bigger than 2' do
      it { expect(array.my_select { |n| n > 2 }).to eql(array.select { |n| n > 2 }) }
      it { expect(range.my_select { |n| n > 2 }).to eql(range.select { |n| n > 2 }) }
      # it { expect(hash.my_select { |n, v| v > 2 }).to eql(hash.select { |n, v| v > 2 }) } LATER
    end

    context 'return to_enum(Enumator) if no block is given' do
      it { expect(range.my_select).to be_an(Enumerator) }
      it { expect(array.my_select).to be_an(Enumerator) }
      it { expect(hash.my_select).to be_an(Enumerator) }
    end
  end

  describe '#my_all' do
    it 'returns true if all elements are numbers' do
      expect(array.my_all?(Numeric)).to eql(true)
    end

    it 'returns false if not all elements are numbers' do
      expect(array_mix.my_all?(Numeric)).to eql(false)
    end

    it 'returns true if all elements are strings' do
      expect(string.my_all?(String)).to eql(string.all?(String))
    end

    it 'returns false if not all elements are string' do
      expect(array_mix.my_all?(String)).to eql(false)
    end

    context 'returns true if no block is given' do
      it { expect(array.my_all?).to eql(true) }
      it { expect(hash.my_all?).to eql(true) }
      it { expect(range.my_all?).to eql(true) }
    end
  end

  describe '#my_any?' do
    it 'return true if at least one item is a number' do
      expect(array_mix.my_any?(Numeric)).to eql(array_mix.any?(Numeric))
    end

    it 'return false if none of the items is a number' do
      expect(string.my_any?(Numeric)).to eql(false)
    end

    it 'return true if at least one item is a string' do
      expect(array_mix.my_any?(String)).to eql(true)
    end

    it 'returns true if no block is given' do
      expect(range.my_any?).to eql(true)
    end
  end

  describe '#my_none?' do
    it 'return true if none of the items are strings' do
      expect(array.my_none?(String)).to eql(true)
    end

    it 'returns false if one of the items are strings' do
      expect(string.my_none?(String)).to eql(false)
    end
  end

  # WORK LATER IN THIS METHOD

  describe '#my_count' do
    context 'return the number of items in the argument given' do
      it { expect(array.my_count).to eql(5) }
      it { expect(array.my_count).to eql(array.count) }
      it { expect(array_mix.my_count).to eql(4) }
      it { expect(string.my_count).to eql(4) }
    end

    it 'returns 0 when item not found' do
      expect(string.count('football')).to eql(0)
    end

    it 'return the number of items found' do
      expect(string.count('skate')).to eql(2)
    end
  end

  describe '#my_map' do
    context 'returns numbers doubled' do
      it { expect(array.my_map { |n| n * 2 }).to eql(array.map { |n| n * 2 }) }
      it { expect(array.my_map { |n| n * 2 }).to eql([2, 4, 6, 8, 10]) }
    end

    context 'add text to string' do
      it { expect(string.my_map { |word| "I love #{word}"}).to eql(string.map { |word| "I love #{word}"}) }
    end

    context 'return to_enum(Enumator) if no block is given' do
      it { expect(range.my_map).to be_an(Enumerator) }
      it { expect(array.my_map).to be_an(Enumerator) }
      it { expect(hash.my_map).to be_an(Enumerator) }
    end
  end

end

# rubocop:enable Layout/LineLength
