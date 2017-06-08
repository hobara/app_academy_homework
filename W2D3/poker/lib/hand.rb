require_relative 'card.rb'

class Hand

  attr_accessor :cards, :strength
  def initialize(cards)
    @cards = cards
    @strength = nil
  end

  def strength_calculate
    @strength = calculate_strength
  end

  def calculate_strength
    suit_hash = Hash.new(0)
    value_hash = Hash.new(0)
    @cards.each do |card|
      value_hash[card.value] += 1
      suit_hash[card.suit] += 1
    end
    a = [:royal_flush, :straight_flush, :four_of_a_kind, :full_house, :flush,
      :straight, :three_of_a_kind, :two_pair, :pair, :high_card]
    a.each_with_index do |hand, idx|
      case hand
      when :royal_flush
        next if value_hash.any? { |k, _| k < 10 }
        next if !all_suit?(suit_hash)
        next if !increasing_hash?(value_hash)
        return idx
      when :straight_flush
        next if !all_suit?(suit_hash)
        next if !increasing_hash?(value_hash)
        return idx
      when :four_of_a_kind
        return idx if value_hash.any? { |_, v| v == 4 }
      when :full_house
        return idx if value_hash.any? { |_, v| v == 3 } && value_hash.any? { |_, v| v == 2 }
      when :flush
        return idx if all_suit?(suit_hash)
      when :straight
        return idx if increasing_hash?(value_hash)
      when :three_of_a_kind
        return idx if value_hash.any? { |_, v| v == 3 }
      when  :two_pair
        return idx if value_hash.values.count(2) == 2
      when :pair
        return idx if value_hash.any? { |_, v| v == 2 }
      when :high_card
        return idx
      end
    end
  end

  def increasing_hash?(hash)
    array = hash.keys.sort
    array[0..-2].each_with_index do |_, idx|
      return false if array[idx+1] - array[idx] != 1
    end
    true
  end

  def all_suit?(hash)
    hash.any? { |_, v| v == 5 }
  end

end
