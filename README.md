# Ryo

[![Build Status](https://travis-ci.org/ninoseki/ryo.svg?branch=master)](https://travis-ci.org/ninoseki/ryo)
[![Maintainability](https://api.codeclimate.com/v1/badges/7e5f124034cd51768567/maintainability)](https://codeclimate.com/github/ninoseki/ryo/maintainability)
[![Coverage Status](https://coveralls.io/repos/github/ninoseki/ryo/badge.svg)](https://coveralls.io/github/ninoseki/ryo)

Ryo is a yet another website recon tool powered by Ruby.

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

```sh
$ gem install ryo
```

## Usage

```sh
$ ryo
Commands:
  ryo all URL         # Run all discovery plugins against a given URL
  ryo dir URL         # Discover directories and files belong to a given URL
  ryo help [COMMAND]  # Describe available commands or one specific command
  ryo subdomain URL   # Discover subdomains of a given URL
  ryo tech URL        # Discover used technolgies of a given URL
```

```sh
# use Webrick as a local http server
# $ ruby -rwebrick -e 'WEBrick::HTTPServer.new(:DocumentRoot => "./", :Port => 8000).start'
$ ryo all http://localhost:8000 | jq .
{
  "dir": [
    "http://localhost:8000/.git/",
    "http://localhost:8000/.git/branches/",
    "http://localhost:8000/.git/COMMIT_EDITMSG",
    "http://localhost:8000/.git/config",
    "http://localhost:8000/.git/description",
    "http://localhost:8000/.git/FETCH_HEAD",
    "http://localhost:8000/.git/HEAD",
    "http://localhost:8000/.git/hooks/",
    "http://localhost:8000/.git/index",
    "http://localhost:8000/.git/info/",
    "http://localhost:8000/.git/info/exclude",
    "http://localhost:8000/.git/logs/",
    "http://localhost:8000/.git/logs/HEAD",
    "http://localhost:8000/.git/logs/refs/heads/master",
    "http://localhost:8000/.git/logs/refs/remotes/origin/HEAD",
    "http://localhost:8000/.git/objects/",
    "http://localhost:8000/.git/packed-refs",
    "http://localhost:8000/.git/refs/",
    "http://localhost:8000/.git/refs/heads/master",
    "http://localhost:8000/.git/refs/remotes/origin/HEAD",
    "http://localhost:8000/.gitignore",
    "http://localhost:8000/.gitignore/",
    "http://localhost:8000/.travis.yml",
    "http://localhost:8000/Bin/",
    "http://localhost:8000/bin/",
    "http://localhost:8000/Gemfile",
    "http://localhost:8000/Gemfile.lock",
    "http://localhost:8000/LICENSE",
    "http://localhost:8000/Rakefile",
    "http://localhost:8000/README.md",
    "http://localhost:8000/readme.md"
  ],
  "subdomain": [],
  "tech": {
    "HTTPServer": [
      {
        "name": "server string",
        "string": "WEBrick/1.4.2 (Ruby/2.5.1/2018-03-29)",
        "certainty": 100
      }
    ],
    "Ruby": [
      {
        "regexp": [
          "Ruby"
        ],
        "search": "headers[server]",
        "certainty": 100
      },
      {
        "regexp": [
          "WEBrick"
        ],
        "search": "headers[server]",
        "certainty": 100
      }
    ],
    "Title": [
      {
        "name": "page title",
        "string": "Index of /",
        "certainty": 100
      }
    ]
  }
}
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
