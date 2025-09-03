# spec/student/deck_spec.rb
# frozen_string_literal: true

require_relative '../../lib/deck'
require_relative '../../lib/card'

describe Deck do
  subject(:deck) { Deck.new }

  it 'starts with 52 cards' do
    d = Deck.new
    expect(d.size).to eq(52)
  end

  it 'contains only Card instances' do
    d = Deck.new
    expect(d.cards.all? { |c| c.is_a?(Card) }).to be(true)
  end

  it 'is not empty on creation' do
    d = Deck.new
    expect(d.empty?).to be(false)
  end

  it 'shuffle! does not change the number of cards' do
    d = Deck.new
    count = d.size
    d.shuffle!
    expect(d.size).to eq(count)
  end

  it 'draw returns a Card' do
    d = Deck.new
    c = d.draw
    expect(c).to be_a(Card)
  end

  it 'draw reduces the size by one' do
    d = Deck.new
    before = d.size
    d.draw
    expect(d.size).to eq(before - 1)
  end

  it 'empty? becomes true after drawing all cards' do
    d = Deck.new
    52.times { d.draw }
    expect(d.empty?).to be(true)
  end

  it 'empty? is false when cards remain' do
    d = Deck.new
    51.times { d.draw }
    expect(d.empty?).to be(false)
  end
end
