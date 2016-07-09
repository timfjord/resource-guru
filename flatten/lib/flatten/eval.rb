# This approach may not work when array contains complex objects.
# Was tested only with integers.
module Flatten
  module Eval
    refine Array do
      def flatten
        eval "[#{inspect.gsub(/[\[\]]/, '')}]"
      end
    end
  end
end
