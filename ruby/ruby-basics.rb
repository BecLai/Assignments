##
# Implement any sorting algorithm.
# Bonus: keep it concise
#
def sort(array)
if array.size==1
  return 
half = array.length/2
leftArray = []
rightArray = []
for i in  0..half:
    leftArray.push(array[i])
for j in half..array.size:
    rightArray.push(array[j])

q = merge(sort(leftArray),sort(rightArray))
return q

  

end

def merge(arrayLeft, arrayRight)
  answer = []
  lIndex = 0
  rIndex = 0
  while lIndex < arrayLeft.size and rIndex <arrayRight.size
      if arrayLeft[lIndex] < arrayRight[rIndex]
          answer.push(arrayLeft[lIndex])
        lIndex+=1
      else
          answer.push(arrayRight[rIndex])
          rIndex +=1 
   
  
return answer
end

##
# Longest Collatz sequence
#
def euler14(n)
  cache = {1=> 1}
  #collatz number and length of sequence
  2.upto(n) do |i|
    collatz(n, cache)
  end
  cache.values.max
end


def collatz(n, cache)
  unless cache.include?n
    collatz_next = 
      if n.even?
        n/2
      else
        3*n+1
      end
    cache[n] = 1 + collatz(collatz_next, cache)
   end
  cache[n]
end

##
# Return a random permutation of the elements.
#
def shuffle(array)
size = array.length
  while size >=0
    swapInd = Random.rand(size)
    last = array.last
    array[-1] = array[swapInd]
    array[swapInd] = last
    size = size-1
  end
  array
end

##
# Perform a Rot13 transformation on a string.
#
def rot13(string)

end

def query_classes(data, criteria)

end
