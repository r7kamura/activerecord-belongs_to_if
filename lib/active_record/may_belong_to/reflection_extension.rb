module ActiveRecord
  module MayBelongTo
    module ReflectionExtension
      def create(macro, name, scope, options, ar)
        if macro == :may_belong_to
          ActiveRecord::MayBelongTo::AssociationReflection.new(macro, name, scope, options, ar)
        else
          super
        end
      end
    end
  end
end
