RSpec.describe ArrayArithmetic do
  include ArrayArithmetic

  it "has a version number" do
    expect(ArrayArithmetic::VERSION).not_to be nil
  end

  describe "add" do
    it "adds the corresponding indices of two arrays" do
      arr_one = [1, 2, 3, 4, 5]
      arr_two = [9, 8, 7, 6, 5]
      result = [10, 10, 10, 10, 10]
      expect(add(arr_one, arr_two)).to eq(result)
    end

    it "raises an error if the first argument is not an array" do
      arr_two = [9, 8, 7, 6, 5]
      expect{add(5, arr_two)}.to raise_error(ArgumentError, 'First argument is not an array')
    end
  end

  describe "subtract" do
    it "subtracts the corresponding indices of two arrays" do
      arr_one = [1, 2, 3, 4, 5]
      arr_two = [9, 8, 7, 6, 5]
      result = [-8, -6, -4, -2, 0]
      expect(subtract(arr_one, arr_two)).to eq(result)
    end

    it "raises an error if the first argument is not an array" do
      arr_two = [9, 8, 7, 6, 5]
      expect{subtract(5, arr_two)}.to raise_error(ArgumentError, 'First argument is not an array')
    end
  end

  describe "multiply" do
    it "multiplies the corresponding indices of two arrays" do
      arr_one = [1, 2, 3, 4, 5]
      arr_two = [9, 8, 7, 6, 5]
      result = [9, 16, 21, 24, 25]
      expect(multiply(arr_one, arr_two)).to eq(result)
    end

    it "raises an error if the first argument is not an array" do
      arr_two = [9, 8, 7, 6, 5]
      expect{multiply(5, arr_two)}.to raise_error(ArgumentError, 'First argument is not an array')
    end
  end

  describe "divide" do
    it "divides the corresponding indices of two arrays and returns values as a float" do
      arr_one = [1, 2, 3, 4, 5]
      arr_two = [2, 3, 4, 5, 6]
      result = [0.50, 0.67, 0.75, 0.80, 0.83]
      expect(divide(arr_one, arr_two, 2)).to eq(result)
    end

    it "raises an error if the first argument is not an array" do
      arr_two = [9, 8, 7, 6, 5]
      expect{divide(5, arr_two)}.to raise_error(ArgumentError, 'First argument is not an array')
    end
  end

  describe "remainder" do
    it "returns the remainder of corresponding indices of two arrays" do
      arr_one = [10, 9, 8, 7, 6]
      arr_two = [1, 2, 3, 4, 5]
      result = [0, 1, 2, 3, 1]
      expect(remainder(arr_one, arr_two)).to eq(result)
    end

    it "raises an error if the first argument is not an array" do
      arr_two = [9, 8, 7, 6, 5]
      expect{remainder(5, arr_two)}.to raise_error(ArgumentError, 'First argument is not an array')
    end
  end

  describe "exponent" do
    it "raises the values of the first array to the power provided" do
      arr_one = [2, 3, 4, 5, 6]
      result = [8, 27, 64, 125, 216]
      expect(exponent(arr_one, 3)).to eq(result)
    end

    it "raises the values of the first array to the power of the corresponding indices of the second array" do
      arr_one = [2, 3, 4, 5, 6]
      arr_two = [1, 2, 3, 4, 5]
      result = [2, 9, 64, 625, 7776]
      expect(exponent(arr_one, arr_two)).to eq(result)
    end

    it "raises an error if the first argument is not an array" do
      arr_two = [9, 8, 7, 6, 5]
      expect{exponent(5, arr_two)}.to raise_error(ArgumentError, 'First argument is not an array')
    end
  end

  describe "square" do
    it "returns the values of the array raised to the second power" do
      arr_one = [2, 3, 4, 5, 6]
      result = [4, 9, 16, 25, 36]
      expect(square(arr_one)).to eq(result)
    end
  end

  describe "square_root" do
    it "returns the squareroot of the values of the array" do
      arr_one = [4, 9, 16, 25, 36]
      result = [2, 3, 4, 5, 6]
      expect(square_root(arr_one)).to eq(result)
    end
  end
end
