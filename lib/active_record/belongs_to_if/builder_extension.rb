module ActiveRecord
  module BelongsToIf
    module BuilderExtension
      # To keep compatibility with Rails > 4
      def valid_options
        super + [:if]
      end

      module ClassMethods
        def valid_options(options)
          super + [:if]
        end
      end

      def self.prepended(base)
        class << base
          prepend ClassMethods
        end
      end
    end
  end
end
