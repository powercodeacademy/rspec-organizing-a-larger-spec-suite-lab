describe Deck do
  let(:deck) { Deck.new }

  context 'when there is a full deck' do
    it 'creates a full deck of 52 cards that is not empty multiple times' do
      2.times do
        expect(deck.size).to eq(52)
        expect(deck.empty?).to be false
      end
    end

    it 'has all four suits in new deck multiple times' do
      2.times do
        suits = deck.cards.map(&:suit).uniq.sort
        expect(suits).to eq(['Clubs', 'Diamonds', 'Hearts', 'Spades'])
      end
    end

    it 'has all thirteen ranks in new deck multiple times' do
      2.times do
        ranks = deck.cards.map(&:rank).uniq.sort_by { |rank| Card::RANKS.index(rank) }
        expect(ranks).to eq(['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'])
      end
    end
  end

  context 'when a card is removed from the deck' do
    it 'can draw a card from the deck multiple times' do
        2.times do
          card = deck.draw
          expect(card).to be_a(Card)
        end
    end

    it 'reduces deck size after drawing multiple cards' do
      [1, 2, 3, 5, 10].each do |n|

        original_size = deck.size
        n.times {deck.draw}
        expect(deck.size).to eq(original_size - n)
      end
    end
  end

  context "when all 52 cards from the deck have been drawn" do
    before(:each) do
      52.times { deck.draw }
    end
    it 'is empty after drawing all 52 cards' do
      expect(deck.empty?).to be true
      expect(deck.size).to eq(0)
    end

    it 'returns nil when drawing from empty deck' do
      expect(deck.draw).to be_nil
    end
  end

  context "when shuffling the deck" do 
    it 'can shuffle the deck' do
      original_order = deck.cards.dup
      deck.shuffle!
      # Very unlikely to be in same order after shuffle
      expect(deck.cards).not_to eq(original_order)
    end

    it 'shuffles and maintains deck size' do
      original_size = deck.size
      deck.shuffle!
      expect(deck.size).to eq(original_size)
    end

    it 'maintains all cards when shuffled' do
      original_cards = deck.cards.dup
      deck.shuffle!
      expect(deck.cards.sort_by(&:to_s)).to eq(original_cards.sort_by(&:to_s))
    end

    it 'can draw from shuffled deck' do
      deck.shuffle!
      card = deck.draw
      expect(card).to be_a(Card)
    end

    it 'shuffled deck reduces size when drawing' do
      deck.shuffle!
      original_size = deck.size
      deck.draw
      expect(deck.size).to eq(original_size - 1)
    end

    it 'maintains size after multiple shuffles' do
      3.times do
        deck.shuffle!
        expect(deck.size).to eq(52)
      end
    end
  end

  context 'when the deck is completely drawn' do
    let(:cards_drawn) do
      drawn = []
      while !deck.empty?
        drawn << deck.draw
      end
      drawn
    end

    it 'can be completely emptied by drawing' do
      expect(cards_drawn.length).to eq(52)
    end

    it 'draws exactly 52 unique cards' do
      expect(cards_drawn.uniq.length).to eq(52)
    end
  end

  context 'when deck is full' do
    it 'contains 13 cards of each suit' do
      ['Hearts', 'Diamonds', 'Clubs', 'Spades'].each do |suit|
        cards = deck.cards.select { |card| card.suit == suit }
        expect(cards.length).to eq(13), "Expected 13 cards of #{suit}, got #{cards.length}"
      end
    end
  end
end
