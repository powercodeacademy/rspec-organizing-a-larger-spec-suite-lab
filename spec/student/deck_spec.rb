# frozen_string_literal: true

describe(Deck) do
  subject(:deck) { Deck.new } 

  context("when initialized") do 
    it "has 52 cards" do 
      expect(deck.size).to eq(52) 
    end
  end
end
