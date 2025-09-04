# frozen_string_literal: true

describe Deck do
  subject { Deck.new}

  it 'creates a deck with 52 cards' do
    expect(subject.size).to eq(52)
  end

  it 'creates another deck with 52 cards' do
    expect(subject.size).to eq(52)
  end

  it 'creates a full deck that is not empty' do
    expect(subject.empty?).to be false
  end

  it 'creates another full deck that is not empty' do
    expect(subject.empty?).to be false
  end

  it 'has all four suits in new deck' do
    suits = subject.cards.map(&:suit).uniq.sort
    expect(suits).to eq(['Clubs', 'Diamonds', 'Hearts', 'Spades'])
  end

  it 'verifies all four suits exist in another new deck' do
    suits = subject.cards.map(&:suit).uniq.sort
    expect(suits).to eq(['Clubs', 'Diamonds', 'Hearts', 'Spades'])
  end

  it 'has all thirteen ranks in new deck' do
    ranks = subject.cards.map(&:rank).uniq.sort_by { |rank| Card::RANKS.index(rank) }
    expect(ranks).to eq(['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'])
  end

  it 'verifies all thirteen ranks exist in another new deck' do
    ranks = subject.cards.map(&:rank).uniq.sort_by { |rank| Card::RANKS.index(rank) }
    expect(ranks).to eq(['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'])
  end

  it 'can draw a card from the deck' do
    card = subject.draw
    expect(card).to be_a(Card)
  end

  it 'can draw another card from the deck' do
    card = subject.draw
    expect(card).to be_a(Card)
  end

  it 'reduces deck size by 1 after drawing' do
    original_size = subject.size
    subject.draw
    expect(subject.size).to eq(original_size - 1)
  end

  it 'reduces deck size correctly after drawing a card' do
    original_size = subject.size
    subject.draw
    expect(subject.size).to eq(original_size - 1)
  end

  it 'reduces deck size by 2 after drawing twice' do
    original_size = subject.size
    subject.draw
    subject.draw
    expect(subject.size).to eq(original_size - 2)
  end

  it 'properly decreases size after drawing multiple cards' do
    original_size = subject.size
    subject.draw
    subject.draw
    expect(subject.size).to eq(original_size - 2)
  end

  it 'can draw 3 cards and reduce size by 3' do
    original_size = subject.size
    subject.draw
    subject.draw
    subject.draw
    expect(subject.size).to eq(original_size - 3)
  end

  it 'correctly handles drawing 3 cards' do
    original_size = subject.size
    subject.draw
    subject.draw
    subject.draw
    expect(subject.size).to eq(original_size - 3)
  end

  it 'can draw 5 cards and reduce size by 5' do
    original_size = subject.size
    5.times { subject.draw }
    expect(subject.size).to eq(original_size - 5)
  end

  it 'properly handles drawing 5 cards' do
    original_size = subject.size
    5.times { subject.draw }
    expect(subject.size).to eq(original_size - 5)
  end

  it 'can draw 10 cards and reduce size by 10' do
    original_size = subject.size
    10.times { subject.draw }
    expect(subject.size).to eq(original_size - 10)
  end

  it 'correctly manages drawing 10 cards' do
    original_size = subject.size
    10.times { subject.draw }
    expect(subject.size).to eq(original_size - 10)
  end

  it 'becomes empty after drawing all cards' do
    52.times { subject.draw }
    expect(subject.empty?).to be true
  end

  it 'is empty after drawing all 52 cards' do
    52.times { subject.draw }
    expect(subject.empty?).to be true
  end

  it 'has size 0 when empty' do
    52.times { subject.draw }
    expect(subject.size).to eq(0)
  end

  it 'reports size as 0 when all cards drawn' do
    52.times { subject.draw }
    expect(subject.size).to eq(0)
  end

  it 'returns nil when drawing from empty deck' do
    52.times { subject.draw }
    expect(subject.draw).to be_nil
  end

  it 'gives nil when trying to draw from empty deck' do
    52.times { subject.draw }
    expect(subject.draw).to be_nil
  end

  it 'can shuffle the deck' do
    original_order = subject.cards.dup
    subject.shuffle!
    # Very unlikely to be in same order after shuffle
    expect(subject.cards).not_to eq(original_order)
  end

  it 'shuffles and maintains deck size' do
    original_size = subject.size
    subject.shuffle!
    expect(subject.size).to eq(original_size)
  end

  it 'keeps all cards after shuffling' do
    original_cards = subject.cards.dup
    subject.shuffle!
    expect(subject.cards.sort_by(&:to_s)).to eq(original_cards.sort_by(&:to_s))
  end

  it 'maintains all cards when shuffled' do
    original_cards = subject.cards.dup
    subject.shuffle!
    expect(subject.cards.sort_by(&:to_s)).to eq(original_cards.sort_by(&:to_s))
  end

  it 'can draw from shuffled deck' do
    subject.shuffle!
    card = subject.draw
    expect(card).to be_a(Card)
  end

  it 'draws cards properly from shuffled deck' do
    subject.shuffle!
    card = subject.draw
    expect(card).to be_a(Card)
  end

  it 'shuffled deck still reduces size when drawing' do
    subject.shuffle!
    original_size = subject.size
    subject.draw
    expect(subject.size).to eq(original_size - 1)
  end

  it 'shuffled deck decreases size correctly' do
    subject.shuffle!
    original_size = subject.size
    subject.draw
    expect(subject.size).to eq(original_size - 1)
  end

  it 'can shuffle multiple times' do
    subject.shuffle!
    subject.shuffle!
    subject.shuffle!
    expect(subject.size).to eq(52)
  end

  it 'maintains size after multiple shuffles' do
    subject.shuffle!
    subject.shuffle!
    subject.shuffle!
    expect(subject.size).to eq(52)
  end

  it 'can be completely emptied by drawing' do
    cards_drawn = []
    while !subject.empty?
      cards_drawn << subject.draw
    end
    expect(cards_drawn.length).to eq(52)
  end

  it 'draws exactly 52 unique cards' do
    cards_drawn = []
    while !subject.empty?
      cards_drawn << subject.draw
    end
    expect(cards_drawn.length).to eq(52)
    expect(cards_drawn.uniq.length).to eq(52)
  end

  it 'has hearts cards in full deck' do
    hearts_cards = subject.cards.select { |card| card.suit == 'Hearts' }
    expect(hearts_cards.length).to eq(13)
  end

  it 'contains 13 hearts cards' do
    hearts_cards = subject.cards.select { |card| card.suit == 'Hearts' }
    expect(hearts_cards.length).to eq(13)
  end

  it 'has diamonds cards in full deck' do
    diamonds_cards = subject.cards.select { |card| card.suit == 'Diamonds' }
    expect(diamonds_cards.length).to eq(13)
  end

  it 'contains 13 diamonds cards' do
    diamonds_cards = subject.cards.select { |card| card.suit == 'Diamonds' }
    expect(diamonds_cards.length).to eq(13)
  end

  it 'has clubs cards in full deck' do
    clubs_cards = subject.cards.select { |card| card.suit == 'Clubs' }
    expect(clubs_cards.length).to eq(13)
  end

  it 'contains 13 clubs cards' do
    clubs_cards = subject.cards.select { |card| card.suit == 'Clubs' }
    expect(clubs_cards.length).to eq(13)
  end

  it 'has spades cards in full deck' do
    spades_cards = subject.cards.select { |card| card.suit == 'Spades' }
    expect(spades_cards.length).to eq(13)
  end

  it 'contains 13 spades cards' do
    spades_cards = subject.cards.select { |card| card.suit == 'Spades' }
    expect(spades_cards.length).to eq(13)
  end
end
