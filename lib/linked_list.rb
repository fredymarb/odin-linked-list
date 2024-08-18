require_relative "node"

class LinkedList
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

  def append(value)
    new_node = Node.new(value)
    current_node = @head

    @size += 1
    return @head = new_node if @head.nil?

    current_node = current_node.next until current_node.next.nil?
    current_node.next = new_node
  end
end

list = LinkedList.new
puts list
list.append(10)
list.append(20)
list.append(30)
puts list
