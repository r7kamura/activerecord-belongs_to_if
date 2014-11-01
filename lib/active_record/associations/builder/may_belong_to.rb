module ActiveRecord
  module Associations
    module Builder
      class MayBelongTo < SingularAssociation
        def self.valid_dependent_options
          []
        end

        def macro
          :may_belong_to
        end

        def valid_options
          [:class_name, :if, :foreign_key, :primary_key]
        end
      end
    end
  end
end
