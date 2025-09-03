# frozen_string_literal: true

describe Card do
  subject(:deck) { Deck.new }
  let(:card) { Card.new("Spades", "A") }

  context ("has cards") do
    it "has an Ace of Spade in the deck" do
    matching_card = deck.cards.map { |c| [c.suit, c.rank] }
      expect(matching_card).to include(["Spades", "A"])
    end
  end
end
