module Flatten
  module Recursion
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
end
