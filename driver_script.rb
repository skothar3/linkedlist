require_relative 'linked_list'
require_relative 'node'

new_list = LinkedList.new

new_list.append(0)
new_list.append(1)
new_list.append(2)
new_list.prepend(3)

new_list.pop
new_list.pop
new_list.pop
new_list.pop
new_list.pop

new_list.append(0)
new_list.append(1)
new_list.append(2)
new_list.prepend(3)

p new_list.to_s
p new_list.size
new_list.insert_at(6,2)
p new_list.size
p new_list.to_s
new_list.remove_at(2)
p new_list.size
p new_list.to_s