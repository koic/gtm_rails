# gtm_rails [![Build Status](https://travis-ci.org/koic/gtm_rails.svg)](https://travis-ci.org/koic/gtm_rails) [![Gem Version](https://badge.fury.io/rb/gtm_rails.svg)](http://badge.fury.io/rb/gtm_rails) [![git.legal](https://git.legal/projects/3929/badge.svg "Number of libraries approved")](https://git.legal/projects/3929)

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

In view, use two helper methods.

1. `google_tag_manager_script_tag(label_name)`
2. `google_tag_manager_noscript_tag(label_name)`

These method arguments are a label name specified in `config/google_tag_manager.yml`.

First, following method as close to the opening `<head>` tag as possible on every page of your website.

```erb
<%= google_tag_manager_script_tag(:foo) %>
```

Google Tag Manager container snippet will be expanded based on `Rails.env` and label name. If there is no match, a blank string is returned.

```html
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-YourGtmId1');</script>
<!-- End Google Tag Manager -->
```

Second, following method immediately after the opening `<body>` tag on every page of your website.

```erb
<%= google_tag_manager_noscript_tag(:foo) %>
```

Google Tag Manager container snippet will be expanded based on `Rails.env` and label name. If there is no match, a blank string is returned.

```html
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-YourGtmId1"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
```

For more detailed GTM please click here to [read more](https://developers.google.com/tag-manager/quickstart).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

gtm_rails is released under the [MIT License](http://www.opensource.org/licenses/MIT).
