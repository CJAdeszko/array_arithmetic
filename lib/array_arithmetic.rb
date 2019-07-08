require "array_arithmetic/version"

module ArrayArithmetic
  class Error < StandardError; end

  #Adds the values of corresponding indices of two arrays
  def add(arr_one, arr_two)
    raise ArgumentError, 'First argument is not an array' unless arr_one.is_a? Array

    result = []

    arr_two = arr_two.class != Array ? make_array(arr_two) : arr_two

    if arr_one.length != arr_two.length
      length_matched_arrays = update_array_length(arr_one, arr_two)

      length_matched_arrays[0].each_with_index do |value, index|
        result << value + length_matched_arrays[1][index]
      end
    else
      arr_one.each_with_index do |value, index|
        result << value + arr_two[index]
      end
    end

    return result
  end


  #Subtracts the values of corresponding indices of two arrays
  def subtract(arr_one, arr_two)
    raise ArgumentError, 'First argument is not an array' unless arr_one.is_a? Array

    result = []

    arr_two = arr_two.class != Array ? make_array(arr_two) : arr_two

    if arr_one.length != arr_two.length
      length_matched_arrays = update_array_length(arr_one, arr_two)

      length_matched_arrays[0].each_with_index do |value, index|
        result << value - length_matched_arrays[1][index]
      end
    else
      arr_one.each_with_index do |value, index|
        result << value - arr_two[index]
      end
    end

    return result
  end


  #Multiplies the values of corresponding indices of two arrays
  def multiply(arr_one, arr_two)
    raise ArgumentError, 'First argument is not an array' unless arr_one.is_a? Array

    result = []

    arr_two = arr_two.class != Array ? make_array(arr_two) : arr_two

    if arr_one.length != arr_two.length
      length_matched_arrays = update_array_length(arr_one, arr_two)

      length_matched_arrays[0].each_with_index do |value, index|
        result << value * length_matched_arrays[1][index]
      end
    else
      arr_one.each_with_index do |value, index|
        result << value * arr_two[index]
      end
    end

    return result
  end


  #Divides the values of corresponding indices of two arrays
  #Returns values as a float
  def divide(arr_one, arr_two, sig_dig=2)
    raise ArgumentError, 'First argument is not an array' unless arr_one.is_a? Array

    result = []

    arr_two = arr_two.class != Array ? make_array(arr_two) : arr_two

    if arr_one.length != arr_two.length
      length_matched_arrays = update_array_length(arr_one, arr_two)

      length_matched_arrays[0].each_with_index do |value, index|
        if length_matched_arrays[1][index] == 0
          result << "Divide by 0 error"
        else
          result << (value.to_f / length_matched_arrays[1][index]).round(sig_dig)
        end
      end
    else
      arr_one.each_with_index do |value, index|
        if arr_two[index] == 0
          result << "Divide by 0 error"
        else
          result << (value.to_f / arr_two[index]).round(sig_dig)
        end
      end
    end

    return result
  end


  #Calculates the remainder of corresponding inidices of two arrays
  def remainder(arr_one, arr_two, sig_dig=2)
    raise ArgumentError, 'First argument is not an array' unless arr_one.is_a? Array

    result = []

    arr_two = arr_two.class != Array ? make_array(arr_two) : arr_two

    if arr_one.length != arr_two.length
      length_matched_arrays = update_array_length(arr_one, arr_two)

      length_matched_arrays[0].each_with_index do |value, index|
        if length_matched_arrays[1][index] == 0
          result << "Divide by 0 error"
        else
          result << (value.to_f % length_matched_arrays[1][index]).round(sig_dig)
        end
      end
    else
      arr_one.each_with_index do |value, index|
        if arr_two[index] == 0
          result << "Divide by 0 error"
        else
          result << (value.to_f % arr_two[index]).round(sig_dig)
        end
      end
    end

    return result
  end


  #Raises the values of arr_one to the power of the value at corresponding indices in arr_two
  def exponent(arr_one, arr_two)
    raise ArgumentError, 'First argument is not an array' unless arr_one.is_a? Array

    result = []

    arr_two = arr_two.class != Array ? make_array(arr_two) : arr_two

    if arr_one.length != arr_two.length
      length_matched_arrays = update_array_length(arr_one, arr_two)

      length_matched_arrays[0].each_with_index do |value, index|
        result << value ** length_matched_arrays[1][index]
      end
    else
      arr_one.each_with_index do |value, index|
        result << value ** arr_two[index]
      end
    end

    return result
  end


  #Squares the values of an array
  def square(array)
    return exponent(array, 2)
  end


  #Returns the square root of each value of an array
  def square_root(array)
    return exponent(array, 0.5)
  end
end


private

#Return an argument as an array for use with arithmetic methods
def make_array(arg)
  return [arg]
end

#Takes in two arrays of unequal length passed to the arithmetic method
#Recycles values from the shorter array
#Returns an array containing two arrays of equal length
def update_array_length(arr_one, arr_two)
  if arr_one.length < arr_two.length
    adjusted_arr_one = []
    arr_two.each_with_index do |value, index|
      if arr_one.length == 1
        adjusted_arr_one << arr_one[0]
      elsif index >= arr_one.length
        if index >= arr_one.length * 2
          adjusted_arr_one << arr_one[index % arr_one.length]
        else
          adjusted_arr_one << arr_one[index - arr_one.length]
        end
      else
        adjusted_arr_one << arr_one[index]
      end
    end
    return adjusted_arr_one, arr_two
  elsif arr_one.length > arr_two.length
    adjusted_arr_two = []
    arr_one.each_with_index do |value, index|
      if arr_two.length == 1
        adjusted_arr_two << arr_two[0]
      elsif index >= arr_two.length
        if index >= arr_two.length * 2
          adjusted_arr_two << arr_two[index % arr_two.length]
        else
          adjusted_arr_two << arr_two[index - arr_two.length]
        end
      else
        adjusted_arr_two << arr_two[index]
      end
    end
    return arr_one, adjusted_arr_two
  end
end
