# rubocop:disable Layout/LineLength

require_relative '../enumarable.rb'

describe Enumerable do
  let(:array) { [1, 2, 3, 4, 5] }
  let(:string) { %w[surf skate run] }
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
end

# rubocop:enable Layout/LineLength
