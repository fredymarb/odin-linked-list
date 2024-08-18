require_relative "node"

class LinkedList
  # returns total number of nodes in the list
  attr_reader :size

  def initialize
    @head = nil
    @size = 0
  end

  def to_s
    string = ""
    current_node = @head

    until current_node.nil?
      string << "( #{current_node.value} ) -> "
      current_node = current_node.next
    end

    string << "nil"
  end

  # add a new node to the end of the list
  def append(value)
    new_node = Node.new(value)
    current_node = @head

    @size += 1
    return @head = new_node if @head.nil?

    current_node = current_node.next until current_node.next.nil?
    current_node.next = new_node
  end

  # add a new node to the start of the list
  def prepend(value)
    new_node = Node.new(value)

    new_node.next = @head
    @head = new_node

    @size += 1
  end

  # returns the first node in the list
  def head
    return nil if @head.nil?

    @head.value
  end

  # returns the last node of the list
  def tail
    return nil if @head.nil?

    current_node = @head
    current_node = current_node.next until current_node.next.nil?
    current_node.value
  end

  # returns the node at the given index
  def at(index)
    raise StandardError, "List is empty" if size.zero?
    raise IndexError, "Index: #{index} is out of range" if index.negative? || index > size - 1

    current_node = @head

    index.times do
      current_node = current_node.next
    end

    current_node.value
  end

  # removes the last element from the list
  def pop
    return nil if @size.zero?

    if @size == 1
      @head = nil
    else
      current_node = @head

      current_node = current_node.next unless current_node.next.next.nil?
      current_node.next = nil
    end

    @size -= 1
    nil
  end

  # returns true if the passed in value is in
  # the list otherwise returns false.
  def contains?(value)
    current_node = @head
    until current_node.nil?
      return true if current_node.value == value

      current_node = current_node.next
    end

    false
  end

  # returns the index of the node containing value,
  # or nil if not found.
  def find(value)
    current_node = @head
    index = 0

    until current_node.nil?
      return index if value == current_node.value

      current_node = current_node.next
      index += 1
    end

    nil
  end
end
