class Stack

  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
    el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end

end


class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
    el
  end

  def dequeue
    @queue.pop
  end

  def show
    @queue.dup
  end

end

class Map

  def initialize
    @map = []
  end

  def assign(key, value)
    key_matched = @map.select { |arr| arr[0] == key }
    if key_matched.empty?
      @map << [key, value]
    else
      idx = @map.index(key_matched[0])
      @map[idx] = [key, value]
    end
  end

  def lookup(key)
    key_matched = @map.select { |arr| arr[0] == key }
    key_matched.empty? ? nil : key_matched.first
  end

  def remove(key)
    @map.delete(lookup(key))
  end

  def show
    copy = []
    @map.each { |arr| copy << arr.dup }
    copy
  end

end
