require 'rspec'
require 'poker'

describe Card do
  subject(:card) { Card.new(:hearts,7) }
  describe "#initialize" do
    it "should set the card" do
      card.suit = :hearts
      card.value = 7
      expect(card.suit).to eq(:hearts)
      expect(card.value).to eq(7)
    end
  end
end

describe Hand do
  let(:hand1) { Hand.new([Card.new(:hearts,12), Card.new(:spades,11), Card.new(:hearts,7), Card.new(:diamonds,7), Card.new(:diamonds,7)]) }
  let(:hand2) { Hand.new([Card.new(:hearts,12), Card.new(:hearts,10), Card.new(:hearts,11), Card.new(:hearts,13), Card.new(:hearts,14)]) }
  let(:hand3) { Hand.new([Card.new(:hearts,6), Card.new(:hearts,2), Card.new(:hearts,7), Card.new(:hearts,5), Card.new(:hearts,8)]) }

  describe "#initialize" do
    it "should initialize with" do
      expect(hand1.cards.size).to eq(5)
      expect(hand1.cards[0]).to be_a(Card)
    end
  end

  describe "#calculate_strength" do
    it "should give a value to strength" do
      hand1.strength_calculate
      hand2.strength_calculate
      hand3.strength_calculate
      expect(hand1.strength).to_not be nil
      expect(hand1.strength).to eq(6)
      expect(hand2.strength).to eq(0)
      expect(hand3.strength).to eq(4)
    end
  end
end

describe Player do
  subject(:player) { Player.new('hiro', 100) }
  describe "#initialize" do
    it "should start player with $100" do
      expect(player.wallet).to eq(100)
    end
  end
end

describe Deck do
  subject(:deck) { Deck.create }
  let(:player) { Player.new('hiro', 100) }
  describe "#initialize" do
    it "should create the deck" do
      expect(deck.all_cards.count { |card| card.color == :red }).to eq(26)
      expect(deck.all_cards.count { |card| card.type == :spade }).to eq(13)
      expect(deck.all_cards.length).to eq(52)
    end
  end
  describe "#distribute" do
    deck.distribute(player)
    it "should distribute the cards to the players" do
      expect(deck.all_cards.length).to eq(47)
      expect(player.hand).to_not be nil
    end
  end
end

describe Game do
  subject(:game) {Game.new(0,"Hiro","Devansh","Sam","Joe")}
  let(:deck) {Deck.create}
  let(:player) {double("player")}

  describe "#initialize" do
    it "should create a deck and pot" do
      expect(game.pot).to eq(0)
      expect(game.deck).to be_a(Deck)
      expect(game.players.size).to eq(4)
    end
  end

  describe "#game_over?" do
    it "should know when the game is over" do
      game.players[0].wallet = 400
      (1..3).each do |i|
        game.players[i].wallet = 0
      end
      expect(game.game_over?).to be true
    end
  end

  describe "#take_turn" do
    it "should add to the pot the amount the player bets" do
      allow(:player).to receive(:bet).and_return(20)
      game.take_turn(player)
      expect(game.pot + player.bet).to eq(20)
    end
  end
end
