# frozen_string_literal: true

RSpec.shared_examples "a valid card" do
  it "has a suit and rank" do
    expect(card.suit).to be_a(String)
    expect(card.rank).to be_a(String)
  end
end

describe Card do
  subject(:deck) { Deck.new }
  let(:card) { Card.new("Spades", "A") }

  it_behaves_like "a valid card"

  context ("has cards") do
    it "has an Ace of Spade in the deck" do
      matching_card = deck.cards.map { |c| [c.suit, c.rank] }
      expect(matching_card).to include(["Spades", "A"])
    end
  end
end
