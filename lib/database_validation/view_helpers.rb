module DatabaseValidation
  module ViewHelpers
    def maxlength_for(object, attr)
      object.class.limit_of(attr)
    end
  end
end
