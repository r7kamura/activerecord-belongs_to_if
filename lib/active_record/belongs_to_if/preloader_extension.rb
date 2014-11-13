module ActiveRecord
  module BelongsToIf
    module PreloaderExtension
      # @note Overriden to use :if condition.
      def owners
        super.select do |owner|
          case if_condition
          when Proc
            owner.instance_exec(&if_condition)
          when String, Symbol
            owner.send(if_condition)
          else
            true
          end
        end
      end

      # @note Overridden to set loaded flag to all records.
      def preload(*)
        super.tap do
          @owners.each do |owner|
            owner.association(reflection.name).loaded!
          end
        end
      end

      private

      # @return [Proc, String, Symbol, nil] The value :if option passed to belongs_to.
      def if_condition
        reflection.options[:if]
      end
    end
  end
end
