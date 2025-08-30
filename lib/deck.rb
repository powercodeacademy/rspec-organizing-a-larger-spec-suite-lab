# frozen_string_literal: true

require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
    @cards = Card::SUITS.product(Card::RANKS).map { |suit, rank| Card.new(suit, rank) }
    shuffle!
  end

  def shuffle!
    @cards.shuffle!
  end

  def draw
    @cards.pop
  end

  def size
    @cards.size
  end

  def empty?
    @cards.empty?
  end
end
