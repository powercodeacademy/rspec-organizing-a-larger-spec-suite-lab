# frozen_string_literal: true

describe Deck do
  it 'creates a deck with 52 cards' do
    deck = Deck.new
    expect(deck.size).to eq(52)
  end

  it 'creates another deck with 52 cards' do
    deck = Deck.new
    expect(deck.size).to eq(52)
  end

  it 'creates a full deck that is not empty' do
    deck = Deck.new
    expect(deck.empty?).to be false
  end

  it 'creates another full deck that is not empty' do
    deck = Deck.new
    expect(deck.empty?).to be false
  end

  it 'has all four suits in new deck' do
    deck = Deck.new
    suits = deck.cards.map(&:suit).uniq.sort
    expect(suits).to eq(['Clubs', 'Diamonds', 'Hearts', 'Spades'])
  end

  it 'verifies all four suits exist in another new deck' do
    deck = Deck.new
    suits = deck.cards.map(&:suit).uniq.sort
    expect(suits).to eq(['Clubs', 'Diamonds', 'Hearts', 'Spades'])
  end

  it 'has all thirteen ranks in new deck' do
    deck = Deck.new
    ranks = deck.cards.map(&:rank).uniq.sort_by { |rank| Card::RANKS.index(rank) }
    expect(ranks).to eq(['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'])
  end

  it 'verifies all thirteen ranks exist in another new deck' do
    deck = Deck.new
    ranks = deck.cards.map(&:rank).uniq.sort_by { |rank| Card::RANKS.index(rank) }
    expect(ranks).to eq(['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'])
  end

  it 'can draw a card from the deck' do
    deck = Deck.new
    card = deck.draw
    expect(card).to be_a(Card)
  end

  it 'can draw another card from the deck' do
    deck = Deck.new
    card = deck.draw
    expect(card).to be_a(Card)
  end

  it 'reduces deck size by 1 after drawing' do
    deck = Deck.new
    original_size = deck.size
    deck.draw
    expect(deck.size).to eq(original_size - 1)
  end

  it 'reduces deck size correctly after drawing a card' do
    deck = Deck.new
    original_size = deck.size
    deck.draw
    expect(deck.size).to eq(original_size - 1)
  end

  it 'reduces deck size by 2 after drawing twice' do
    deck = Deck.new
    original_size = deck.size
    deck.draw
    deck.draw
    expect(deck.size).to eq(original_size - 2)
  end

  it 'properly decreases size after drawing multiple cards' do
    deck = Deck.new
    original_size = deck.size
    deck.draw
    deck.draw
    expect(deck.size).to eq(original_size - 2)
  end

  it 'can draw 3 cards and reduce size by 3' do
    deck = Deck.new
    original_size = deck.size
    deck.draw
    deck.draw
    deck.draw
    expect(deck.size).to eq(original_size - 3)
  end

  it 'correctly handles drawing 3 cards' do
    deck = Deck.new
    original_size = deck.size
    deck.draw
    deck.draw
    deck.draw
    expect(deck.size).to eq(original_size - 3)
  end

  it 'can draw 5 cards and reduce size by 5' do
    deck = Deck.new
    original_size = deck.size
    5.times { deck.draw }
    expect(deck.size).to eq(original_size - 5)
  end

  it 'properly handles drawing 5 cards' do
    deck = Deck.new
    original_size = deck.size
    5.times { deck.draw }
    expect(deck.size).to eq(original_size - 5)
  end

  it 'can draw 10 cards and reduce size by 10' do
    deck = Deck.new
    original_size = deck.size
    10.times { deck.draw }
    expect(deck.size).to eq(original_size - 10)
  end

  it 'correctly manages drawing 10 cards' do
    deck = Deck.new
    original_size = deck.size
    10.times { deck.draw }
    expect(deck.size).to eq(original_size - 10)
  end

  it 'becomes empty after drawing all cards' do
    deck = Deck.new
    52.times { deck.draw }
    expect(deck.empty?).to be true
  end

  it 'is empty after drawing all 52 cards' do
    deck = Deck.new
    52.times { deck.draw }
    expect(deck.empty?).to be true
  end

  it 'has size 0 when empty' do
    deck = Deck.new
    52.times { deck.draw }
    expect(deck.size).to eq(0)
  end

  it 'reports size as 0 when all cards drawn' do
    deck = Deck.new
    52.times { deck.draw }
    expect(deck.size).to eq(0)
  end

  it 'returns nil when drawing from empty deck' do
    deck = Deck.new
    52.times { deck.draw }
    expect(deck.draw).to be_nil
  end

  it 'gives nil when trying to draw from empty deck' do
    deck = Deck.new
    52.times { deck.draw }
    expect(deck.draw).to be_nil
  end

  it 'can shuffle the deck' do
    deck = Deck.new
    original_order = deck.cards.dup
    deck.shuffle!
    # Very unlikely to be in same order after shuffle
    expect(deck.cards).not_to eq(original_order)
  end

  it 'shuffles and maintains deck size' do
    deck = Deck.new
    original_size = deck.size
    deck.shuffle!
    expect(deck.size).to eq(original_size)
  end

  it 'keeps all cards after shuffling' do
    deck = Deck.new
    original_cards = deck.cards.dup
    deck.shuffle!
    expect(deck.cards.sort_by(&:to_s)).to eq(original_cards.sort_by(&:to_s))
  end

  it 'maintains all cards when shuffled' do
    deck = Deck.new
    original_cards = deck.cards.dup
    deck.shuffle!
    expect(deck.cards.sort_by(&:to_s)).to eq(original_cards.sort_by(&:to_s))
  end

  it 'can draw from shuffled deck' do
    deck = Deck.new
    deck.shuffle!
    card = deck.draw
    expect(card).to be_a(Card)
  end

  it 'draws cards properly from shuffled deck' do
    deck = Deck.new
    deck.shuffle!
    card = deck.draw
    expect(card).to be_a(Card)
  end

  it 'shuffled deck still reduces size when drawing' do
    deck = Deck.new
    deck.shuffle!
    original_size = deck.size
    deck.draw
    expect(deck.size).to eq(original_size - 1)
  end

  it 'shuffled deck decreases size correctly' do
    deck = Deck.new
    deck.shuffle!
    original_size = deck.size
    deck.draw
    expect(deck.size).to eq(original_size - 1)
  end

  it 'can shuffle multiple times' do
    deck = Deck.new
    deck.shuffle!
    deck.shuffle!
    deck.shuffle!
    expect(deck.size).to eq(52)
  end

  it 'maintains size after multiple shuffles' do
    deck = Deck.new
    deck.shuffle!
    deck.shuffle!
    deck.shuffle!
    expect(deck.size).to eq(52)
  end

  it 'can be completely emptied by drawing' do
    deck = Deck.new
    cards_drawn = []
    while !deck.empty?
      cards_drawn << deck.draw
    end
    expect(cards_drawn.length).to eq(52)
  end

  it 'draws exactly 52 unique cards' do
    deck = Deck.new
    cards_drawn = []
    while !deck.empty?
      cards_drawn << deck.draw
    end
    expect(cards_drawn.length).to eq(52)
    expect(cards_drawn.uniq.length).to eq(52)
  end

  it 'has hearts cards in full deck' do
    deck = Deck.new
    hearts_cards = deck.cards.select { |card| card.suit == 'Hearts' }
    expect(hearts_cards.length).to eq(13)
  end

  it 'contains 13 hearts cards' do
    deck = Deck.new
    hearts_cards = deck.cards.select { |card| card.suit == 'Hearts' }
    expect(hearts_cards.length).to eq(13)
  end

  it 'has diamonds cards in full deck' do
    deck = Deck.new
    diamonds_cards = deck.cards.select { |card| card.suit == 'Diamonds' }
    expect(diamonds_cards.length).to eq(13)
  end

  it 'contains 13 diamonds cards' do
    deck = Deck.new
    diamonds_cards = deck.cards.select { |card| card.suit == 'Diamonds' }
    expect(diamonds_cards.length).to eq(13)
  end

  it 'has clubs cards in full deck' do
    deck = Deck.new
    clubs_cards = deck.cards.select { |card| card.suit == 'Clubs' }
    expect(clubs_cards.length).to eq(13)
  end

  it 'contains 13 clubs cards' do
    deck = Deck.new
    clubs_cards = deck.cards.select { |card| card.suit == 'Clubs' }
    expect(clubs_cards.length).to eq(13)
  end

  it 'has spades cards in full deck' do
    deck = Deck.new
    spades_cards = deck.cards.select { |card| card.suit == 'Spades' }
    expect(spades_cards.length).to eq(13)
  end

  it 'contains 13 spades cards' do
    deck = Deck.new
    spades_cards = deck.cards.select { |card| card.suit == 'Spades' }
    expect(spades_cards.length).to eq(13)
  end
end
