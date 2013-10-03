# Database Validation
[![Code Climate](https://codeclimate.com/github/eventioz/database-validation.png)](https://codeclimate.com/github/eventioz/database-validation)

Is a simple way to add Active Record Validations to models and views through the limits established in your database.

## Installation

Add this line to your application's Gemfile:

    gem 'database-validation'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install database-validation

## Usage

### Models Validation

Add this method to all the models that you want to add validations to
all its attributes.

    class SomeModel < ActiveRecord::Base
      validate_limits

      # your stuff
    end

Or you can pass, as an option, an array with the attributes you want to
be skipped for validations OR the few you want to validate.

    validate_limits only: [:email]

or

    validate_limits except: [:email, :credit_card]

### Views Validation

  form_for **must** have an associated object.

    <%= form_for @object do |f| %>

  form_for automatically adds *maxlength* option with the value
corresponding to the limit of the column in the database to all its text_fields.

  However, you can overwrite *maxlength* option with any value you want
or...

  Add *skip_validations* option to your form and set it to true to prevent gem from adding validations.

    <%= form_for @object, skip_validations: true do |f| %>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
