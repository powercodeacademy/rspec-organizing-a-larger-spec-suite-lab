# frozen_string_literal: true

class Card
  attr_reader :suit, :rank

  SUITS = %w[Hearts Diamonds Clubs Spades].freeze
  RANKS = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

  def initialize(suit, rank)
    raise ArgumentError, 'Invalid suit' unless SUITS.include?(suit)
    raise ArgumentError, 'Invalid rank' unless RANKS.include?(rank)

    @suit = suit
    @rank = rank
  end

  def face_card?
    %w[J Q K].include?(@rank)
  end

  def ace?
    @rank == 'A'
  end

  def value
    return 11 if ace?
    return 10 if face_card?

    @rank.to_i
  end

  def to_s
    "#{@rank} of #{@suit}"
  end
end
