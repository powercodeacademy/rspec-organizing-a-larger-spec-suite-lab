# frozen_string_literal: true

require_relative '../../lib/card'

describe Card do
  subject(:example_card) { Card.new('Hearts', '7') }

  it 'stores suit on initialize' do
    c = Card.new('Diamonds', '3')
    expect(c.suit).to eq('Diamonds')
  end

  it 'stores rank on initialize' do
    c = Card.new('Diamonds', '3')
    expect(c.rank).to eq('3')
  end

  it 'raises for invalid suit' do
    expect { Card.new('Stars', '3') }.to raise_error(ArgumentError)
  end

  it 'raises for invalid rank' do
    expect { Card.new('Hearts', '14') }.to raise_error(ArgumentError)
  end

  it 'returns integer value for numeric rank' do
    c = Card.new('Clubs', '8')
    expect(c.value).to eq(8)
  end

  it 'treats "10" as 10' do
    c = Card.new('Spades', '10')
    expect(c.value).to eq(10)
  end

  it 'treats J as 10' do
    c = Card.new('Clubs', 'J')
    expect(c.value).to eq(10)
  end

  it 'treats Q as 10' do
    c = Card.new('Hearts', 'Q')
    expect(c.value).to eq(10)
  end

  it 'treats K as 10' do
    c = Card.new('Diamonds', 'K')
    expect(c.value).to eq(10)
  end

  it 'treats A as 11' do
    c = Card.new('Spades', 'A')
    expect(c.value).to eq(11)
  end

  it 'face_card? is false for numeric ranks' do
    c = Card.new('Hearts', '9')
    expect(c.face_card?).to be(false)
  end

  it 'face_card? is true for J' do
    c = Card.new('Hearts', 'J')
    expect(c.face_card?).to be(true)
  end

  it 'ace? is true for A' do
    c = Card.new('Clubs', 'A')
    expect(c.ace?).to be(true)
  end

  it 'ace? is false for non-ace' do
    c = Card.new('Clubs', '2')
    expect(c.ace?).to be(false)
  end

  it 'to_s formats as "<rank> of <suit>"' do
    c = Card.new('Diamonds', 'Q')
    expect(c.to_s).to eq('Q of Diamonds')
  end
end
