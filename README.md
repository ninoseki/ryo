# Ryo

Ryo is a yet another recon tool powered by Ruby.

*Note*: I'm working on this just because for fun and study purposes.

## Concepts

- JSON all the way.
  - No pretty output / report, just a JSON.

## Features & TODO

- [x] Directory & File brute force
- [x] Subdomain discovery
  - By using [DNSDumpster](https://dnsdumpster.com/) and [FindSubdomains](https://findsubdomains.com/)
- [x] Website's technology detection
  - By using [SimpleWhatWeb](https://github.com/ninoseki/SimpleWhatWeb)
- [ ] Port scanning
- [ ] Threading support

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ryo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ryo

## Usage

TODO: Write usage instructions here

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

