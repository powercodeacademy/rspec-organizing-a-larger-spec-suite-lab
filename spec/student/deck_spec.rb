# frozen_string_literal: true

RSpec.shared_examples "a valid card" do
  it "starts with 52 cards" do
    expect(deck.size).to eq(52)
  end
end

describe Deck do
  subject(:deck) { Deck.new }
  let(:card) { Card.new("Spade", "A") }

  it "starts with 52 cards" do
    expect(deck.size).to eq(52)
  end

  context ("when empty") do
     it "has no cards" do
       52.times { deck.draw }
       expect(deck.empty?).to be true
     end
   end
end
