# frozen_string_literal: true
require_relative 'shared_examples_spec'

describe(Card) do
  subject { Card.new("Hearts", "A") }

  it_behaves_like "a printable object"

  context("card is an ace") do 
    it "has a rank of 'A'" do 
      expect(subject.ace?).to be(true)
    end

    it "has a value of 11" do 
      expect(subject.value).to be(11) 
    end
  end
end
