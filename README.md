# gtm_rails

Simply embed Google Tag Manager container snippet into Rails application.

## Installation

Add these lines to your application's Gemfile:

```
gem 'gtm_rails'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install gtm_rails
```

## Configuration

Create `config/google_tag_manager.yml` in your Rails application.

```yaml
staging:
  foo: GTM-YourGtmId1
  bar: GTM-YourGtmId2
  baz: GTM-YourGtmId3
production:
  foo: GTM-YourGtmId4
  bar: GTM-YourGtmId5
  baz: GTM-YourGtmId6
```

The above is a sample. `foo`, `bar`, `baz` are arbitrary label names, and replacing GTM-XXXX with your container ID.

In view, use as follows. The argument is a label name specified in `config/google_tag_manager.yml`.

```ruby
<%= google_tag_manager(:foo) %>
```

Google Tag Manager container snippet will be expanded based on `Rails.env` and label name. If there is no match, a blank string is returned.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

gtm_rails is released under the [MIT License](http://www.opensource.org/licenses/MIT).
