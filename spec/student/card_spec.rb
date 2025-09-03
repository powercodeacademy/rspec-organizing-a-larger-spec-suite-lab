# frozen_string_literal: true

describe(Card) do
  context("card is an ace") do 
    subject { Card.new("Hearts", "A") }

    it "has a rank of 'A'" do 
      expect(subject.ace?).to be(true)
    end

    it "has a value of 11" do 
      expect(subject.value).to be(11) 
    end
  end
end
