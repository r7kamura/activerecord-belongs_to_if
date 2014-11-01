module ActiveRecord
  module MayBelongTo
    module ClassMethods
      def may_belong_to(name, scope = nil, options = {})
        Reflection.add_reflection(
          self,
          name,
          ActiveRecord::Associations::Builder::MayBelongTo.build(self, name, scope, options),
        )
      end
    end
  end
end
