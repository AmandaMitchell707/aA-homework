require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:cookies) { Dessert.new("cookies", 49, "Anthony Bourdain")}

  describe "#initialize" do
    it "sets a type" do
      expect(cookies.type).to eq("cookies")
    end

    it "sets a quantity" do
      expect(cookies.quantity).to eq(49)
    end

    it "starts ingredients as an empty array" do
      expect(cookies.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("brownies", "fudge", "Rachel Ray") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) do
      cookies.add_ingredient("chocolate chips")
    end

      it "adds an ingredient to the ingredients array" do
        expect(cookies.ingredients).to eq(["chocolate chips"])
      end
  end

  describe "#mix!" do
    before(:each) do
      cookies.add_ingredient("chocolate chips")
      cookies.add_ingredient("oatmeal")
      cookies.add_ingredient("sugar")
      cookies.add_ingredient("butter")
    end

    it "shuffles the ingredient array" do
      answers = []

      10.times do
        cookies.mix!
        answers << cookies.ingredients.join
      end

      expect(answers.uniq.length).to be > 1
    end
  end

  describe "#eat" do
    before(:each) do
      cookies.eat(20)
    end

    it "subtracts an amount from the quantity" do
      expect(cookies.quantity).to eq(29)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cookies.eat(500) }.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
