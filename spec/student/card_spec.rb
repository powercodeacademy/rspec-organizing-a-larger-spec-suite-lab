describe(Card) do
  let(:card) { Card.new("Hearts", "7") }

  describe "#initialize" do
    context "when initialized with valid attributes" do
      it 'has the correct suit' do
        expect(card.suit).to eq("Hearts")
      end

      it 'has the correct rank' do
        expect(card.rank).to eq("7")
      end
    end

    context "with invalid suit" do
      let(:build_call) { -> { Card.new("Harts", "K") } }
      it_behaves_like "rejects invalid input"
    end

    context "with invalid rank" do
      let(:build_call) { -> { Card.new("Diamonds", "king") } }
      it_behaves_like "rejects invalid input"
    end
  end

  describe "#ace?" do
    it 'returns true for A' do
      ace = Card.new("Hearts", "A")
      expect(ace.ace?).to eq(true)
    end

    it 'returns false for non-A' do
      expect(card.ace?).to eq(false)
    end
  end
end
