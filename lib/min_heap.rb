class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def add(key, value = key)
    @store << HeapNode.new(key, value)
    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def remove()
    # min heap always remove the smallest element
    return nil if @store.empty?
    # swap it with the last node, so we can just pop off the last node in the heap
    swap(0, @store.length - 1)
    result = @store.pop
    
    heap_down(0) unless @store.empty?
    return result.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: O(1)
  # Space complexity: O(1)
  def empty?
    return @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: O(1)
  # Space complexity: O(log n)
  def heap_up(index)
    return if index == 0 # root node
    # compare the new node with its parent
    # if out of order, swap
    parent = (index - 1) / 2
    if @store[index].key < @store[parent].key
      swap(index, parent)
      heap_up(parent)
    end
    return
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    # will stop when it reached the leave node

    return if index == @store.length 
    left_child = 2 * index + 1
    right_child = 2 * index + 2
    # compare to the smallest child for min heap
    if right_child < @store.length
      if @store[left_child].key > @store[right_child].key
        smallest_child = right_child
      else
        smallest_child = left_child
      end

      if @store[index].key > @store[smallest_child].key
        swap(index, smallest_child)
        heap_down(smallest_child)
      end
    elsif left_child < @store.length
      if @store[index].key > @store[left_child].key
        swap(index, left_child)
      end
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end