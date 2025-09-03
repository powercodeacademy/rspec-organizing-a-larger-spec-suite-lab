# frozen_string_literal: true

describe Deck do
  let(:deck) { Deck.new }

  it "starts with 52 cards" do
    expect(deck.size).to eq(52)
  end

  context "when empty" do
     it "has no cards" do
       52.times { deck.draw }
       expect(deck.empty?).to be true
     end
   end
end
