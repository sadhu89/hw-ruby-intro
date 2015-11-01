# When done, submit this entire file to the autograder.

# Part 1
=begin
Define a method sum(array) that takes an array of integers as an argument and returns the sum of its elements. 
For an empty array it should return zero.
=end
def sum arr
  # YOUR CODE HERE
  return 0 if arr.empty?
  arr.inject(:+)
end

=begin
Define a method max_2_sum(array) which takes an array of integers as an argument
and returns the sum of its two largest elements. For an empty array it should 
return zero. For an array with just one element, it should return that element.
=end

def max_2_sum arr
  # YOUR CODE HERE
  return 0 if arr.empty?
  return arr[0] if arr.size==1
  arr.sort!
  arr[-2] + arr[-1]
end


=begin
Define a method sum_to_n?(array, n) that takes an array of integers and an 
additional integer, n, as arguments and returns true if any two elements in the
array of integers sum to n. An empty array should sum to zero by definition.
=end

def sum_to_n? arr, n
  # YOUR CODE HERE
  arr=arr.select{|e| e<=n}
  arr.each_with_index do |a,i|
    arr[i+1..(arr.length-1)].each do |b|
      return true if a+b==n
    end
  end
  false
end

# Part 2
=begin
Define a method hello(name) that takes a string representing a name and returns
the string "Hello, " concatenated with the name.
=end
def hello(name)
  # YOUR CODE HERE
  "Hello, #{name}"
end

=begin
Define a method starts_with_consonant?(s) that takes a string and returns true 
if it starts with a consonant and false otherwise. (For our purposes, a 
consonant is any letter other than A, E, I, O, U.) NOTE: be sure it works 
for both upper and lower case and for nonletters!
=end
def starts_with_consonant? s
  # YOUR CODE HERE
  /^[A-Z]/i===s && /^[^AEIOU]/i===s
  #s =~ /^[a-z]/i and s !~ /^[aeiou]/i www.rublar.com
  # %asdfa or &asdfasd or %^^
  
  # we have 2 regexs here can we do it with one?
  # eg /^[a-z]&^[^AEIOU]??
  #  -->&<--
end

=begin
Define a method binary_multiple_of_4?(s) that takes a string and returns 
true if the string represents a binary number that is a multiple of 4. NOTE: 
be sure it returns false if the string is not a valid binary number!
=end

def binary_multiple_of_4? s
  # YOUR CODE HERE
  return false if s=~/[^01]/
  return true if s=='0'
  return true if s[-1]=='0' && s[-2]=='0'
  false
  
end

# Part 3
=begin
Define a class BookInStock which represents a book with an ISBN number, isbn, 
and price of the book as a floating-point number, price, as attributes.

The constructor should accept the ISBN number (a string, since in real life 
ISBN numbers can begin with zero and can include hyphens) as the first argument 
and price as second argument, and should raise ArgumentError (one of Ruby's 
built-in exception types) if the ISBN number is the empty string or if the 
price is less than or equal to zero. Include the proper getters and setters 
for these attributes.

Include a method price_as_string that returns the price of the book formatted 
with a leading dollar sign and two decimal places, that is, a price of 20 
should format as "$20.00" and a price of 33.8 should format as "$33.80".
=end

class BookInStock
# YOUR CODE HERE
  attr_accessor :price, :isbn
  
  def initialize (isbn, price)
    if(isbn == "" || price <=0)
      raise ArgumentError, 'Invalid Input' 
    end
    @price=price
    @isbn=isbn
  end
  
  def price_as_string
    format("$%.2f", @price)
  end
end