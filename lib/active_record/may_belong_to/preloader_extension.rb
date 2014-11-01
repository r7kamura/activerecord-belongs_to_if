module ActiveRecord
  module MayBelongTo
    module PreloaderExtension
      def preloader_for(reflection, *)
        origin = super
        case
        when origin
          origin
        when reflection.macro == :may_belong_to
          ActiveRecord::Associations::Preloader::MayBelongTo
        end
      end
    end
  end
end
