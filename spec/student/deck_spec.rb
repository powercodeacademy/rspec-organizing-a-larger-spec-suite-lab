# frozen_string_literal: true
require_relative 'shared_examples'

describe Deck do
  subject(:deck) { Deck.new }
  let(:card) { Card.new("Spade", "A") }

  it_behaves_like "a fresh deck"

  context ("when empty") do
     it "has no cards" do
       52.times { deck.draw }
       expect(deck.empty?).to be true
     end
   end

   it "starts with 52 cards" do
    expect(deck.size).to eq(52)
  end
end
