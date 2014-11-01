module ActiveRecord
  module MayBelongTo
    class AssociationReflection < ActiveRecord::Reflection::AssociationReflection
      def association_class
        ActiveRecord::Associations::BelongsToAssociation
      end
    end
  end
end
