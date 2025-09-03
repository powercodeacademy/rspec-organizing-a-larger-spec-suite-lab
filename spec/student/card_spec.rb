# frozen_string_literal: true

describe(Card) do
  let(:card) { Card.new("Hearts", "7") }

  describe("#initialize") do
    context("when initialized with valid attributes") do
      it "creates a card" do
        expect(card.suit).to eq("Hearts")
        expect(card.rank).to eq("7")
      end
    end

    context("when initialized with invalid attributes") do
      it "raises an error if suit is invalid" do
        expect { Card.new("Harts", "K") }
          .to raise_error(ArgumentError, /Invalid suit/)
      end

      it "raises an error if rank is invalid" do
        expect { Card.new("Diamonds", "king") }
          .to raise_error(ArgumentError, /Invalid rank/)
      end
    end
  end
end
