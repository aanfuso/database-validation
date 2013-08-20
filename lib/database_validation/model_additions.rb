module DatabaseValidation
  module ModelAdditions
    # Avoids adding LengthValidator to boolean, date or datetime attributes.
    AVAILABLE_TYPES = [:string, :text, :integer, :decimal, :float]

    def limit_of(attr)
      columns_hash.with_indifferent_access[attr].limit
    end

    def type_of(attr)
      columns_hash.with_indifferent_access[attr].type
    end

    def valid_limit?(attr)
      limit_of(attr) != nil
    end

    def valid_type?(attr)
      AVAILABLE_TYPES.include?(type_of(attr))
    end

    def validate_limits(options = {})
      columns = content_columns.map(&:name).map(&:to_sym)

      case true
      when options[:only].present?
        columns &= [*options[:only]]
      when options[:except].present?
        columns -= [*options[:except]]
      end

      columns.each do |column|
        validate_attr(column) if valid_limit?(column) && valid_type?(column)
      end
    end

    private
      def validate_attr(attr)
        validates attr, length: { maximum: limit_of(attr) }
      end
  end
end
