require 'rspec'
require 'lru_cache'


describe LRUCache do
  subject(:cache_one) { LRUCache.new(5) }
  describe "#initialize" do
    it "should initialize a cache as an empty array" do
      expect(cache_one.cache).to eq([])
    end
    it "should set the size of cache" do
      expect(cache_one.size).to eq(5)
    end
  end

  describe "#add" do
    subject(:cache_two) { LRUCache.new(5) }
    it "should add the element" do
      cache_two.add("I walk the line")
      expect(cache_two.cache).to eq(["I walk the line"])
    end
    it "shoud update the same element when its added" do
      cache_two.add("I walk the line")
      cache_two.add(5)
      cache_two.add([1, 2, 3])
      cache_two.add(5)
      expect(cache_two.cache).to eq(["I walk the line", [1, 2, 3], 5])
    end

  end

end
