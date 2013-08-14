# Database Validation

Is a simple way to add validations for models and views through the limits established in your database.

## Installation

Add this line to your application's Gemfile:

    gem 'database_validations'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install database_validations

## Usage

Add this method to validate model you want to add validations for all attributes

    validate_limits

Or, you can pass each attribute you want to validate.

    validate_limit_of :email, :credit_card


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
