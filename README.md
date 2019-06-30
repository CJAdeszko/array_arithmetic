# Array_Arithmetic

[![Build Status](https://travis-ci.com/CJAdeszko/array_arithmetic.svg?branch=master)](https://travis-ci.com/CJAdeszko/array_arithmetic)

Array_Arithmetic provides users the ability to perform common math functions on entire arrays in Ruby. This gem provides methods for the following math functions:

  - Addition
  - Subtraction
  - Multiplication
  - Division
  - Remainders
  - Exponents
  - Square
  - Square root

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'array_arithmetic'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install array_arithmetic

## Usage

The `array_arithmetic` gem provides the following methods for use:

  - add()
  - subtract()
  - multiply()
  - divide()
  - remainder()
  - exponent()
  - square()
  - square_root()

To use a method within your code, simply include the module at the top of the file:

```ruby
include ArrayArithmetic
```

Then, you are able to call methods as follows:

```ruby
arr_one = [1, 2, 3, 4, 5]
arr_two = [9, 8, 7, 6, 5]

add(arr_one, arr_two)
#returns [10, 10, 10, 10, 10]

subtract(arr_one, arr_two)
#returns [-8, -6, -4, -2, 0]

multiply(arr_one, arr_two)
#returns [9, 16, 21, 24, 25]

exponent(arr_one, arr_two)
#returns [1, 256, 2187, 4096, 3125]
```

Note that both the `divide` and `remainder` methods return values as a float, and have an optional third argument `sig_dig`, which defaults to 2. If desired, an integer can be passed as a third argument to the method to change the number of significant digits the method returns:

```ruby
arr_one = [1, 2, 3, 4, 5]
arr_two = [9, 8, 7, 6, 5]

divide(arr_one, arr_two)
#returns [0.11, 0.25, 0.43, 0.67, 1.0]

divide(arr_one, arr_two, 4)
#returns [0.1111, 0.25, 0.4286, 0.6667, 1.0]

remainder(arr_one, arr_two)
#returns [1.0, 2.0, 3.0, 4.0, 0.0]

remainder(arr_one, 0.405, 4)
#returns [0.19, 0.38, 0.165, 0.355, 0.14]
```

Note that both the `square` and `square_root` methods take in only one array as an argument.

```ruby  
arr_one = [1, 2, 3, 4, 5]
arr_two = [9, 8, 7, 6, 5]

square(arr_one)
#returns [1, 4, 9, 16, 25]

square_root(arr_two)
#returns [3.0, 2.8284271247461903, 2.6457513110645907, 2.449489742783178, 2.23606797749979]
```

If arrays of unequal length are passed into any method, the values of shorter of the two arrays are recycled so that an array matching the length of the longer array is returned:

```ruby
arr_one = [1, 2, 3, 4, 5]
arr_two = [9, 8, 7, 6, 5, 4, 3, 2, 1]

#arr_one values are recycled making arr_one = [1, 2, 3, 4, 5, 1, 2, 3, 4]

add(arr_one, arr_two)
#returns [10, 10, 10, 10, 10, 5, 5, 5, 5]
```

Additionally, note that the first argument passed to any of the methods MUST be an array, otherwise, the method will raise an error. However, the second argument can be either an array or a single number which will be used in the methods calculations:

```ruby
arr_one = [1, 2, 3, 4, 5]

multiply(arr_one, 5)
#returns [5, 10, 15, 20, 25]

divide(arr_one, 0.5)
#returns [2.0, 4.0, 6.0, 8.0, 10.0]
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/CJAdeszko/array_arithmetic.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
