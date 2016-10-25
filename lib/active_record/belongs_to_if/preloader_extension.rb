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

      # @note Override to change `records_by_owner` so that empty array is used.
      def associated_records_by_owner(preloader)
        # Each record may have multiple owners, and vice-versa
        records_by_owner = Hash.new do |hash, key|
          hash[key] = []
        end

        # To keep compatibility with Rails > 4
        if ::ActiveRecord::VERSION::MAJOR > 4
          records = load_records
          records_by_owner = Hash.new do |hash, key|
            hash[key] = []
          end
          owners.each_with_object(records_by_owner) do |owner, result|
            result[owner] = records[convert_key(owner[owner_key_name])] || []
          end
        else
          owners_map = owners_by_key
          owner_keys = owners_map.keys.compact


          if owner_keys.any?
            # Some databases impose a limit on the number of ids in a list (in Oracle it's 1000)
            # Make several smaller queries if necessary or make one query if the adapter supports it
            sliced  = owner_keys.each_slice(klass.connection.in_clause_length || owner_keys.size)

            records = load_slices sliced
            records.each do |record, owner_key|
              owners_map[owner_key].each do |owner|
                records_by_owner[owner] << record
              end
            end
          end

          records_by_owner
        end
      end

      # @return [Proc, String, Symbol, nil] The value :if option passed to belongs_to.
      def if_condition
        reflection.options[:if]
      end
    end
  end
end
