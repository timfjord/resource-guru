require 'minitest/autorun'

module RecursionFlatten
  refine Array do
    def flatten
      inject [] do |memo, item|
        if item.is_a? Array
          memo + item.flatten
        else
          memo << item
        end
      end
    end
  end
end

# This approach may not work when array contains complex objects.
# Was tested only with integers.
module EvalFlatten
  refine Array do
    def flatten
      eval "[#{inspect.gsub(/[\[\]]/, '')}]"
    end
  end
end

[RecursionFlatten, EvalFlatten].each do |refinement|
  # using class_eval here for dynamic refinement usage
  Class.new(Minitest::Test).class_eval <<-CODE, __FILE__, __LINE__ + 1
    using #{refinement}

    def test_flatten
      assert_equal [],           [].flatten
      assert_equal [1, 2, 3, 4], [[1,2,[3]],4].flatten
      assert_equal [1],          [[1]].flatten
      assert_equal [1, 2],       [[1,2]].flatten
      assert_equal [1, 4],       [[[[[[[1]]]]]],4].flatten
    end
  CODE
end
