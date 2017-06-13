require "tdd_prac"
require "rspec"
describe Array do

  describe "#my_uniq" do
    array = [1, 2, 1, 3, 3]
    new_array = array.my_uniq
    it "should return a unique array" do
      expect(new_array).to eq([1, 2, 3])
    end

    it "original array should not equal new array" do
      expect(new_array).to_not be(array)
    end
  end

  describe "#two_sum" do
    let(:array1) { [-1, 0, 2, -2, 1] }
    let(:answer1) { [[0,4],[2,3]] }
    let(:array2) { [] }
    let(:answer2) { [] }

    it "should be sorted smaller index before bigger index" do
      expect(array1.two_sum.sort).to eq(array1.two_sum)
      expect(array2.two_sum.sort).to eq(array2.two_sum)
    end

    it 'should have pairs sorted dictionary wise' do
      expect(array1.two_sum.all? { |x, y| x <= y }).to be true
      expect(array2.two_sum.all? { |x, y| x <= y }).to be true
    end

    it 'should return expected value' do
      expect(array1.two_sum).to eq(answer1)
      expect(array2.two_sum).to eq(answer2)
    end
  end

  describe "#my_transpose" do
    subject(:array1) {
    [[0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ] }
    it "should convert rows to columns" do
      expect(array1.my_transpose).to eq(array1.transpose)
    end
  end

  describe "#stock_picker" do
    let(:array1) {[3,1,5,10,3,15,32]}
    let(:array2) {[4,10,53,293,104,322,21]}
    it "should return an array of the best [buy_day,sell_day] of stock" do
      expect(array1.stock_picker).to eq([1,6])
      expect(array2.stock_picker).to eq([0,5])
    end
  end
end


describe TowersOfHanoi do
  subject(:game) {TowersOfHanoi.new}
  describe "#initialize" do
    it "should initialize with towers" do
      expect(game.towers).to eq([[1,2,3],[],[]])
    end
  end

  describe "#won?" do
    it "should check if the player has won" do
      game.towers = [[],[1,2,3],[]]
      win1 = game.won?
      game.towers = [[],[],[1,2,3]]
      win2 = game.won?
      expect(win1).to be true
      expect(win2).to be true
    end

  end
end
