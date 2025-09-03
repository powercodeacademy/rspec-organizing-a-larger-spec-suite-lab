# frozen_string_literal: true
require_relative 'shared_examples'

RSpec.shared_examples "a fresh deck" do
  it "starts with 52 cards" do
    expect(deck.size).to eq(52)
  end
end

RSpec.shared_examples "a valid card" do
  it "has a suit and rank" do
    expect(card.suit).to be_a(String)
    expect(card.rank).to be_a(String)
  end
end
