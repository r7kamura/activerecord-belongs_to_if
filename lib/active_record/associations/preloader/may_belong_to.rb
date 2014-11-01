module ActiveRecord
  module Associations
    class Preloader
      class MayBelongTo < BelongsTo
        # @note Override.
        def owners
          @owners.select do |owner|
            owner.instance_exec(&reflection.options[:if])
          end
        end
      end
    end
  end
end
