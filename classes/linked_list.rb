require_relative "node"

class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  public

  def append(value)
    if head.nil?
      @head = Node.new(value)
      @tail = @head
    else
      @tail.next_node = Node.new(value)
      @tail = @tail.next_node
    end
    @size += 1
  end

  def prepend(value)
    return append(value) if head.nil?
    @head = Node.new(value, @head)
    @size += 1
  end

  def at(index)
    return nil if index >= size
    node = @head
    index.times do
      node = node.next_node
    end
    return node
  end

  def pop
    @tail = at(size - 2)
    @tail.next_node = nil
    @size -= 1
  end

  def contains?(value, node = @head)
    return true if node.value == value
    return nil if node == @tail
    contains?(value, node.next_node)
  end

  def find(value, node = @head, count = 0)
    return count if node.value == value
    return nil if node == @tail
    find(value, node.next_node, count + 1)
  end

  def to_s
    node = @head
    until node.nil?
      print "( #{node.value} ) -> " 
      node = node.next_node
    end
    print "nil\n"
  end

  def insert_at(value, index)
    return prepend(value) if index == 0
    node = at(index - 1)
    after_new_node = node.next_node
    node.next_node = Node.new(value, after_new_node)
  end

  def remove_at(index)
    return pop if index == size
    if index == 0
      node = @head.next_node
      @head.next_node = nil
      @head = node
    else
      node = at(index - 1)
      new_node = node.next_node.next_node
      node.next_node = new_node
    end
  end
end