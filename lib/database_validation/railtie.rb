module DatabaseValidation
  class Railtie < Rails::Railtie
    initializer 'database-validations' do
      ActiveSupport.on_load :active_record do
        extend ModelAdditions
      end

      ActiveSupport.on_load :action_view do
        include ViewHelpers
      end
    end
  end
end
