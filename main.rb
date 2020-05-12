require_relative "./classes/linked_list"

a = LinkedList.new
a.to_s
a.prepend(2)
a.append(3)
a.append(4)
a.append(5)
a.prepend(1)
# p a.at(3)
p a.head
p a.tail
p a.contains?(3)
p a.find(3)
puts "size: #{a.size}"
a.remove_at(0)
a.to_s
p a.at(3).value