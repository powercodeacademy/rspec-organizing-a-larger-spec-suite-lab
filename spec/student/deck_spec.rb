# spec/student/deck_spec.rb
describe(Deck) do
  let(:deck) { Deck.new }

  describe("new deck created") do
    it { expect(deck.size).to eq(52) }
  end

  describe("#empty?") do
    it "false when fresh" do
      expect(deck.empty?).to eq(false)
    end

    it "true after clearing" do
      deck.cards.clear
      expect(deck.empty?).to eq(true)
    end
  end

  it_behaves_like "a stack-like deck"
end
