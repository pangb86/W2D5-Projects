require 'byebug'

class Node
  include Enumerable
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    current_node = @head.next
    #next_node = current_node.next
    while current_node != @tail

      if current_node.key == key
        return current_node.val

      end
      current_node = current_node.next
    end
    nil
  end

  def include?(key)
    current_node = @head.next
    #next_node = current_node.next
    while current_node != @tail
      if current_node.key == key
        return true
      end
      current_node = current_node.next
    end
    false
  end

  def append(key, val)
    new_node = Node.new(key,val)
    if empty?
      @head.next = new_node
    end
      previous_node = @tail.prev
      new_node.next = @tail
      new_node.prev = previous_node
      @tail.prev = new_node
      previous_node.next = new_node
  end



  def update(key, val)
    current_node = @head.next
    #next_node = current_node.next
    while current_node != @tail
      if current_node.key == key
        current_node.key = key
        current_node.val = val
        break
      end
      current_node = current_node.next
    end
  end

  def remove(key)
    current_node = @head.next
    #next_node = current_node.next
    while current_node != @tail
      if current_node.key == key
        previous_node = current_node.prev
        next_node = current_node.next
        previous_node.next = current_node.next
        next_node.prev = current_node.prev
      end
      current_node = current_node.next
    end
  end

  def each(&prc)

    current_node = @head.next
    while current_node != @tail
      prc.call(current_node)
      current_node = current_node.next
    end

  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
