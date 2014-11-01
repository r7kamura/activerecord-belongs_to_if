module ActiveRecord
  module BelongsToIf
    module BuilderExtension
      def valid_options
        super + [:if]
      end
    end
  end
end
