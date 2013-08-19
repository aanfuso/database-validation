module DatabaseValidation
  module ViewHelpers
    def maxlength_for(object, attr)
      object.class.limit_for(attr)
    end
  end
end
