class LRUCache

  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    @cache.length
  end

  def add(el)
    if @cache.include?(el)
      idx = @cache.index(el)
      @cache.slice!(idx)
    elsif @cache.length >= @size
      @cache.shift
    end
    @cache << el
  end

  def show
    p @cache
    nil
  end

end
