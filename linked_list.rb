require_relative "linked_list_node"
class LinkedList
	def initialize(value = nil)
		@head = LinkedListNode.new(value, nil)
	end
	def addition(value)
		if @head.value.nil?
			@head = LinkedListNode.new(value, nil)
		else
			current_node = @head
			while current_node.next_node
				current_node = current_node.next_node
			end
			current_node.next_node = LinkedListNode.new(value, nil)
		end
	end
	def find(value)
		current_node = @head
		return false if current_node.next_node.nil?
		return current_node if current_node.value == value
		while (current_node = current_node.next_node)
			return current_node if current_node.value == value
		end
	end
	def deletion(value)
		current_node = @head
		return if current_node.nil?
		if current_node.value == value
			@head = current_node.next_node
		else
			while (current_node.next_node) && (current_node.next_node.value != value)
				current_node = current_node.next_node
			end
			current_node.next_node = current_node.next_node.next_node
		end
	end
	def print_list
		current_node = @head
		puts current_node.value
		while (current_node = current_node.next_node)
			puts current_node.value
		end
	end
	def modified_print(str)
		current_node = @head
		return if current_node.nil?
		str = str + "#{current_node.value}"
		while (current_node = current_node.next_node)
			str = str + "," if str.present?
			str += "#{current_node.value}"
		end
		str
	end	
	def reverse
		previous = nil
		current = @head
		while current
			next_node = current.next_node
			current.next_node = previous
			previous = current
			current = next_node
		end
		@head = previous
	end
end
