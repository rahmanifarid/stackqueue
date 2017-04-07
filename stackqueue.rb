class MyQueue

  def initialize
    @store = []
  end

  def enqueue(element)
    @store << element
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end
end


class MyStack
  def initialize
    @store = []
    @max_stack = []
  end

  def push(element)
    @store << element
    if @max_stack.empty? || element >= max
      @max_stack.push(element)
    end
  end

  def pop
    el = @store.pop
    @max_stack.pop if el == max
    el
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def max
    @max_stack.last
  end

  def empty?
    @store.empty?
  end

end

class StackQueue
  def initialize
    @main_stack = MyStack.new
    @temp_stack = MyStack.new
  end

  def enqueue(element)
    return @temp_stack.push(element) if empty?

    until @main_stack.empty?
      @temp_stack.push(@main_stack.pop)
    end

    @main_stack.push(element)

    until @temp_stack.size == 1
      @main_stack.push(@temp_stack.pop)
    end
  end

  def dequeue


    el = @temp_stack.pop
    @temp_stack.push(@main_stack.pop) unless @main_stack.empty?
    el
  end

  def size
    @main_stack.size
  end

  def empty?
    @temp_stack.empty?
  end

end
