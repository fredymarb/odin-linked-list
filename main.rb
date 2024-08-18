require_relative "lib/linked_list"

list = LinkedList.new
list.append("dog")
list.append("cat")
list.append("parrot")
list.append("hamster")
list.append("snake")
list.append("turtle")

list.insert_at("Marko!!", 6)
p list.size

puts list
