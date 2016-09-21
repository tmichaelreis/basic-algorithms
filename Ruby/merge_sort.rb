require 'benchmark'

def merge_sort(array)
  size = array.size
  return array if size == 1
  midpoint = size/2
  left = array[0, midpoint]
  right = array[midpoint, size]

  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  sorted = []
  until left.empty? || right.empty?
    if left.first <= right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end

  sorted.concat(left).concat(right)
end

def test
  random_arrays = []

  10.times do
    random_arrays << rand_array
  end

  random_arrays.each do |arr|
    if arr.sort == merge_sort(arr)
      puts "Passed"
    else
      puts "Failed"
    end
  end
end

def rand_array
  Array.new(100000){ rand(1..9) }
end

test

test_array = rand_array
Benchmark.bm(10) do |x|
  x.report("sort:") { test_array.sort }
  x.report("mergesort:") { merge_sort(test_array) }
end
