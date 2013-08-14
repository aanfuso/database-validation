module DatabaseValidation
  module ModelAdditions
    def limit_for(attr)
      attr = attr.to_s
      columns_hash[attr].limit
    end

    def validate_limit_of(*args)
      args.each do |attr|
        validate_attr(attr)
      end
    end

    def validate_all
      columns_hash.keys.each do |attr|
        validate_attr(attr)
      end
    end

    private
      def validate_attr(attr)
        validates attr, length: { maximum: limit_for(attr) } if limit_for(attr) != nil
      end
  end
end
