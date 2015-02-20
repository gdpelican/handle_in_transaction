# HandleInTransaction

HandleInTransaction is a simple helper method to allow your ruby methods to occur within a transaction.

```
class Pelican < ActiveRecord::Base
  def squawk
    # many database calls!
  end
  handle_in_transaction :squawk
end
```

is equivalent to writing

```
class Pelican < ActiveRecord::Base
  def squawk
    Pelican.transaction do
      # many database calls!
    end
  end
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'handle_in_transaction'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install handle_in_transaction

## Usage

You'll now be able to use the `handle_in_transaction` helper in your models.

```
def squawk
  # many database calls!
end
handle_in_transaction :squawk
```

to explicitly call a function without a transaction:

```
self.squawk_without_transaction
```

## Contributing

1. Fork it ( https://github.com/gdpelican/handle_in_transaction/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
