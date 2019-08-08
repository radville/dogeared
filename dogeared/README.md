# DogEared

DogEared is a gem that scrapes the New York Times Best Sellers lists and suggests books to read from that list. The books are separated by genre and can be browsed by new books this week, or by all books in a genre. Books details are given, as well as a link to purchase the book.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dogeared'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dogeared

## Usage

Enter ./bin/dogeared to execute the file in the terminal, then follow the prompts.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/radville/dogeared.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
