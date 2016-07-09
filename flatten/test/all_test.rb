$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'flatten/recursion'
require 'flatten/eval'
require 'minitest/autorun'

[Flatten::Recursion, Flatten::Eval].each do |refinement|
  # using class_eval here for dynamic refinement usage
  Class.new(Minitest::Test).class_eval <<-CODE, __FILE__, __LINE__ + 1
    using #{refinement}

    def test_flatten
      assert_equal [],           [].flatten
      assert_equal [1, 2, 3, 4], [1, [2, [3]], 4].flatten
      assert_equal [1, 2, 3, 4], [[1,2,[3]],4].flatten
      assert_equal [1],          [[1]].flatten
      assert_equal [1, 2],       [[1,2]].flatten
      assert_equal [1, 4],       [[[[[[[1]]]]]],4].flatten
    end
  CODE
end
