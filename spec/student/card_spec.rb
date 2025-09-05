describe Card do
  it 'creates cards with valid suits and ranks' do
    [
      ['Hearts', 'A'],
      ['Diamonds', 'K'],
      ['Clubs', '10']
    ].each do |suit, rank|
      card = Card.new(suit, rank)
      expect(card.suit).to eq(suit)
      expect(card.rank).to eq(rank)
    end
  end

  it 'identifies if a card is a face card or not' do
    [
      ['Hearts', 'J', true],
      ['Diamonds', 'Q', true],
      ['Clubs', 'K', true],
      ['Hearts', 'A', false],
      ['Diamonds', '2', false],
      ['Clubs', '10', false]
    ].each do |suit, rank, expected|
      card = Card.new(suit, rank)
      expect(card.face_card?).to be expected
    end
  end

  it 'identifies if a card is an ace or not' do
    [
      ['Clubs', 'A', true],
      ['Spades', 'A', true],  
      ['Clubs', 'J', false],
      ['Spades', '2', false],  
    ].each do |suit, rank, expected|
      card = Card.new(suit, rank)
      expect(card.ace?).to be expected
    end
  end

  it 'calculates a cards value' do
    [
      ['Diamonds', 'Q', 10],
      ['Hearts', '2', 2],
      ['Diamonds', '3', 3],
      ['Clubs', '4', 4],
      ['Spades', '5', 5],
      ['Hearts', '6', 6],
      ['Diamonds', '7', 7],
      ['Clubs', '8', 8],
      ['Spades', '9', 9],
      ['Hearts', '10', 10]
    ].each do |suit, rank, expected|
      card = Card.new(suit, rank)
      expect(card.value).to eq(expected)
    end
  end

  it 'formats card string correctly' do
    [
      ['Diamonds', 'Q', 10],
      ['Hearts', '2', 2],
      ['Diamonds', '3', 3],
      ['Clubs', '4', 4],
      ['Spades', '5', 5],
      ['Hearts', '6', 6],
      ['Diamonds', '7', 7],
      ['Clubs', '8', 8],
      ['Spades', '9', 9],
      ['Hearts', '10', 10]
    ].each do |suit, rank|
      card = Card.new(suit, rank)
      expect(card.to_s).to eq("#{rank} of #{suit}")
    end
  end
end
