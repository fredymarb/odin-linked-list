require_relative "lib/linked_list"

list = LinkedList.new
list.append("dog")
list.append("cat")
list.append("parrot")
list.append("hamster")
list.append("snake")
list.append("turtle")

list.remove_at(3)

puts list.size
puts list
