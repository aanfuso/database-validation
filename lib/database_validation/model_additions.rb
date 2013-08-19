module DatabaseValidation
  module ModelAdditions
    def limit_for(attr)
      columns_hash.with_indifferent_access[attr].limit
    end

    def validate_limits(options = {})
      columns = columns_hash.with_indifferent_access.except!(:id)

      case true
      when options[:only].present?
        columns = columns.extract!(*options[:only])
      when options[:except].present?
        columns = columns.except!(*options[:except])
      end

      columns.keys.each do |attr|
        validate_attr(attr)
      end
    end

    private
      def validate_attr(attr)
        validates attr, length: { maximum: limit_for(attr) } if limit_for(attr) != nil
      end
  end
end
