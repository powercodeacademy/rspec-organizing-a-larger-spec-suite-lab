# frozen_string_literal: true
require_relative 'shared_examples_spec'

describe(Deck) do
  subject { Deck.new } 

  it_behaves_like "a printable object"

  context("when initialized") do 
    it "has 52 cards" do 
      expect(subject.size).to eq(52) 
    end
  end

  it "can draw a card" do 
    card = subject.draw 
    expect(card.to_s).to be_a(String) 
  end
end
