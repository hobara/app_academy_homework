require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name:"Luna") }
  subject(:smoothie) { Dessert.new("smoothie", 3, chef)}
  let(:bad_smoothie) { Dessert.new("smoothie", "bad", chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(smoothie.type).to eq("smoothie")
    end

    it "sets a quantity" do
      expect(smoothie.quantity).to eq(3)
    end

    it "starts ingredients as an empty array" do
      expect(smoothie.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {bad_smoothie}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      smoothie.add_ingredient("banana")
      expect(smoothie.ingredients).to eq(["banana"])
    end
  end

  describe "#mix!" do
    before(:each) do
      smoothie.add_ingredient("banana")
      smoothie.add_ingredient("blueberry")
      smoothie.add_ingredient("milk")
      smoothie.mix!
    end
    it "shuffles the ingredient array" do
      expect(smoothie.ingredients).to_not eq(["banana", "blueberry", "milk"])
      expect(smoothie.ingredients.sort).to eq(["banana", "blueberry", "milk"])
    end
  end

  describe "#eat" do
    context "when there are enough quantity" do
      it "subtracts an amount from the quantity" do
        smoothie.eat(1)
        expect(smoothie.quantity).to eq(2)
      end
    end
    context "when there are not enough quantity" do
      it "raises an error if the amount is greater than the quantity" do
        expect { smoothie.eat(5) }.to raise_error("not enough left!")
      end
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Luna the Great Baker")
      expect(smoothie.serve).to eq("Chef Luna the Great Baker has made 3 smoothies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(smoothie)
      smoothie.make_more
    end
  end
end
