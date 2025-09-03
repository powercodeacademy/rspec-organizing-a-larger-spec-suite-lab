RSpec.shared_examples "a printable object" do 
  it "can be converted into a string" do 
    expect(subject.to_s).to be_a(String) 
  end

  it "is not an empty string" do 
    expect(subject.to_s).not_to be_empty 
  end
end

describe(Card) do 
  it_behaves_like "a printable object" do 
    subject { Card.new("Hearts", "A") }
  end
end

describe(Deck) do 
  it_behaves_like "a printable object" do 
    subject { Deck.new }
  end
end
