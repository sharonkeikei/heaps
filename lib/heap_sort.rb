

# This method uses a heap to sort an array.
# Time Complexity:  O(n log n)
# Space Complexity: O(n)
def heapsort(list)
  heap = MinHeap.new
  
  list.each do |num|
    heap.add(num)
  end

  result = []
  i = 0
  while i < list.length
    result << heap.remove()
    i += 1
  end

  return result
end