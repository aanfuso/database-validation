module DatabaseValidation
  module ModelAdditions
    # Avoids adding LengthValidator to boolean, date or datetime attributes.
    AVAILABLE_TYPES = [:string, :text, :integer, :decimal, :float]

    def limit_for(attr)
      columns_hash.with_indifferent_access[attr].limit if column_belongs?(attr)
    end

    def type_for(attr)
      columns_hash.with_indifferent_access[attr].type if column_belongs?(attr)
    end

    def valid_limit?(attr)
      limit_for(attr) != nil
    end

    def valid_type?(attr)
      AVAILABLE_TYPES.include?(type_for(attr))
    end

    def column_belongs?(attr)
      column_names.map(&:to_sym).include?(attr)
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
        validates attr, length: { maximum: limit_for(attr) }
      end
  end
end
