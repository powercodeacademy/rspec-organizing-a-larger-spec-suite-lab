# frozen_string_literal: true

describe Card do
  let(:suit) {"Diamonds"}
  let(:rank) { "A" }
  subject(:card) { Card.new(suit, rank) }

  shared_examples "a valid card" do |suit, rank|
  it "created suit and rank" do
    card = Card.new(suit, rank)
    expect(card.suit).to eq(suit)
    expect(card.rank).to eq(rank)
  end
end

  it_behaves_like 'a valid card', 'Hearts', 'A'
  it_behaves_like 'a valid card', 'Diamonds', 'K'
  it_behaves_like 'a valid card', 'Clubs', '10'

context('invalid suit or rank ') do
  it 'raises error for invalid suit' do
    expect { Card.new('InvalidSuit', 'A') }.to raise_error(ArgumentError, 'Invalid suit')
  end

  it 'raises error for another invalid suit' do
    expect { Card.new('NotASuit', 'K') }.to raise_error(ArgumentError, 'Invalid suit')
  end

  it 'raises error for invalid rank' do
    expect { Card.new('Hearts', 'InvalidRank') }.to raise_error(ArgumentError, 'Invalid rank')
  end

  it 'raises error for another invalid rank' do
    expect { Card.new('Spades', 'NotARank') }.to raise_error(ArgumentError, 'Invalid rank')
  end
end

  it 'identifies jack as face card' do
    card = Card.new('Hearts', 'J')
    expect(card.face_card?).to be true
  end

  it 'identifies queen as face card' do
    card = Card.new('Diamonds', 'Q')
    expect(card.face_card?).to be true
  end

  it 'identifies king as face card' do
    card = Card.new('Clubs', 'K')
    expect(card.face_card?).to be true
  end

  it 'identifies jack of spades as face card' do
    card = Card.new('Spades', 'J')
    expect(card.face_card?).to be true
  end

  it 'identifies queen of hearts as face card' do
    card = Card.new('Hearts', 'Q')
    expect(card.face_card?).to be true
  end

  it 'identifies king of diamonds as face card' do
    card = Card.new('Diamonds', 'K')
    expect(card.face_card?).to be true
  end

  it 'identifies ace as not a face card' do
    card = Card.new('Hearts', 'A')
    expect(card.face_card?).to be false
  end

  it 'identifies 2 as not a face card' do
    card = Card.new('Diamonds', '2')
    expect(card.face_card?).to be false
  end

  it 'identifies 10 as not a face card' do
    card = Card.new('Clubs', '10')
    expect(card.face_card?).to be false
  end

  it 'identifies ace of hearts as ace' do
    card = Card.new('Hearts', 'A')
    expect(card.ace?).to be true
  end

  it 'identifies ace of diamonds as ace' do
    card = Card.new('Diamonds', 'A')
    expect(card.ace?).to be true
  end

  it 'identifies ace of clubs as ace' do
    card = Card.new('Clubs', 'A')
    expect(card.ace?).to be true
  end

  it 'identifies ace of spades as ace' do
    card = Card.new('Spades', 'A')
    expect(card.ace?).to be true
  end

  it 'identifies king as not an ace' do
    card = Card.new('Hearts', 'K')
    expect(card.ace?).to be false
  end

  it 'identifies queen as not an ace' do
    card = Card.new('Diamonds', 'Q')
    expect(card.ace?).to be false
  end

  it 'identifies jack as not an ace' do
    card = Card.new('Clubs', 'J')
    expect(card.ace?).to be false
  end

  it 'identifies 2 as not an ace' do
    card = Card.new('Spades', '2')
    expect(card.ace?).to be false
  end

  it 'calculates ace value as 11' do
    card = Card.new('Hearts', 'A')
    expect(card.value).to eq(11)
  end

  it 'calculates ace of diamonds value as 11' do
    card = Card.new('Diamonds', 'A')
    expect(card.value).to eq(11)
  end

  it 'calculates ace of clubs value as 11' do
    card = Card.new('Clubs', 'A')
    expect(card.value).to eq(11)
  end

  it 'calculates ace of spades value as 11' do
    card = Card.new('Spades', 'A')
    expect(card.value).to eq(11)
  end

  it 'calculates jack value as 10' do
    card = Card.new('Hearts', 'J')
    expect(card.value).to eq(10)
  end

  it 'calculates queen value as 10' do
    card = Card.new('Diamonds', 'Q')
    expect(card.value).to eq(10)
  end

  it 'calculates king value as 10' do
    card = Card.new('Clubs', 'K')
    expect(card.value).to eq(10)
  end

  it 'calculates jack of spades value as 10' do
    card = Card.new('Spades', 'J')
    expect(card.value).to eq(10)
  end

  it 'calculates queen of hearts value as 10' do
    card = Card.new('Hearts', 'Q')
    expect(card.value).to eq(10)
  end

  it 'calculates king of diamonds value as 10' do
    card = Card.new('Diamonds', 'K')
    expect(card.value).to eq(10)
  end

  it 'calculates 2 value as 2' do
    card = Card.new('Hearts', '2')
    expect(card.value).to eq(2)
  end

  it 'calculates 3 value as 3' do
    card = Card.new('Diamonds', '3')
    expect(card.value).to eq(3)
  end

  it 'calculates 4 value as 4' do
    card = Card.new('Clubs', '4')
    expect(card.value).to eq(4)
  end

  it 'calculates 5 value as 5' do
    card = Card.new('Spades', '5')
    expect(card.value).to eq(5)
  end

  it 'calculates 6 value as 6' do
    card = Card.new('Hearts', '6')
    expect(card.value).to eq(6)
  end

  it 'calculates 7 value as 7' do
    card = Card.new('Diamonds', '7')
    expect(card.value).to eq(7)
  end

  it 'calculates 8 value as 8' do
    card = Card.new('Clubs', '8')
    expect(card.value).to eq(8)
  end

  it 'calculates 9 value as 9' do
    card = Card.new('Spades', '9')
    expect(card.value).to eq(9)
  end

  it 'calculates 10 value as 10' do
    card = Card.new('Hearts', '10')
    expect(card.value).to eq(10)
  end

  it 'formats ace of hearts string correctly' do
    card = Card.new('Hearts', 'A')
    expect(card.to_s).to eq('A of Hearts')
  end

  it 'formats king of diamonds string correctly' do
    card = Card.new('Diamonds', 'K')
    expect(card.to_s).to eq('K of Diamonds')
  end

  it 'formats queen of clubs string correctly' do
    card = Card.new('Clubs', 'Q')
    expect(card.to_s).to eq('Q of Clubs')
  end

  it 'formats jack of spades string correctly' do
    card = Card.new('Spades', 'J')
    expect(card.to_s).to eq('J of Spades')
  end

  it 'formats 10 of hearts string correctly' do
    card = Card.new('Hearts', '10')
    expect(card.to_s).to eq('10 of Hearts')
  end

  it 'formats 2 of diamonds string correctly' do
    card = Card.new('Diamonds', '2')
    expect(card.to_s).to eq('2 of Diamonds')
  end

  it 'formats 3 of clubs string correctly' do
    card = Card.new('Clubs', '3')
    expect(card.to_s).to eq('3 of Clubs')
  end

  it 'formats 9 of spades string correctly' do
    card = Card.new('Spades', '9')
    expect(card.to_s).to eq('9 of Spades')
  end
end
