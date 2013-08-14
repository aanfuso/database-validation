module DatabaseValidation
  module ViewHelpers
    def max(object, attr)
      attr = attr.to_s
      object.class.limit_for(attr)
    end
  end
end
