# Should find
adj_matrix = [
  [0, 0, 1, 0, 0, 0],
  [0, 0, 1, 0, 0, 1],
  [0, 0, 0, 1, 0, 0],
  [0, 0, 0, 0, 1, 1],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0]
]

# Should not find
cyclic_matrix = [
  [0, 0, 1, 0, 0, 0],
  [0, 0, 1, 0, 0, 1],
  [1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 1, 1],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0]
]

def simple_breadth_first_search(matrix, initial_node, final_node)
  node_queue = [initial_node]
  visited = []

  loop do
    puts node_queue
    current_node = node_queue.pop
    return false if current_node.nil?
    return true if current_node == final_node

    visited << current_node

    child_nodes = (0..matrix.length - 1).to_a.select do |i|
      matrix[current_node][i] == 1 && !(visited.include? i)
    end

    node_queue = child_nodes + node_queue
  end
end

puts simple_breadth_first_search(adj_matrix, 0, 4)
puts simple_breadth_first_search(cyclic_matrix, 0, 4)
