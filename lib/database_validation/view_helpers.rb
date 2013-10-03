module DatabaseValidation
  module ViewHelpers
    class ActionView::Helpers::FormBuilder
      def text_field_with_maxlength(method, options = {})
        options[:maxlength] ||= @object.class.limit_for(method) unless @options[:skip_validations]
        text_field_without_maxlength(method, options.merge(maxlength: options[:maxlength]))
      end
      alias_method_chain :text_field, :maxlength
    end
  end
end
