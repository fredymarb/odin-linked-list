require_relative "node"

class LinkedList
  attr_reader :size

  def initialize
    @head = nil
    @size = 0
  end

  def to_s
    string = ""
    current_node = @head

    until current_node.nil?
      string << "#{current_node.value} -> "
      current_node = current_node.next
    end

    string << "nil"
  end

  # add node to the end of the list
  def append(value)
    new_node = Node.new(value)
    current_node = @head

    @size += 1
    return @head = new_node if @head.nil?

    current_node = current_node.next until current_node.next.nil?
    current_node.next = new_node
  end

  # add node to the start of the list
  def prepend(value)
    new_node = Node.new(value)

    new_node.next = @head
    @head = new_node

    @size += 1
  end
end

list = LinkedList.new
puts list
list.prepend(10)
list.prepend(20)
list.prepend(30)
puts list
