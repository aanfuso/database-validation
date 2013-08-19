# Database Validation

Is a simple way to add Active Record Validations to models and views through the limits established in your database.

## Installation

Add this line to your application's Gemfile:

    gem 'database_validations'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install database_validations

## Usage

### Models Validation

Add this method to all the models that you want to add validations to
all its attributes.

    class SomeModel < ActiveRecord::Base
      validate_limits

      # your associations
      # your validations
      # your methods
    end

Or you can pass, as an option, an array with the attributes you want to
be skipped for validations OR the few you want to validate.

    validate_limits only: :email
    or
    validate_limits only: [:email, :credit_card]

    validate_limits except: :email
    or
    validate_limits except: [:email, :credit_card]

### Views Validation

Call maxlength_for helper method to validate the length of an attribute.

    form_for @object do |f|
      f.text_field :attribute, maxlength: maxlength_for(@object, :attribute)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
