# Ryo

[![Build Status](https://travis-ci.org/ninoseki/ryo.svg?branch=master)](https://travis-ci.org/ninoseki/ryo)
[![Maintainability](https://api.codeclimate.com/v1/badges/7e5f124034cd51768567/maintainability)](https://codeclimate.com/github/ninoseki/ryo/maintainability)
[![Coverage Status](https://coveralls.io/repos/github/ninoseki/ryo/badge.svg)](https://coveralls.io/github/ninoseki/ryo)

Ryo is a yet another website recon tool powered by Ruby.

*Note*: I'm working on this just because for fun and study purposes.

## Concept

- JSON all the way.
  - No pretty output / report, just a JSON.

## Features & ToDo list

- [x] Directory & File brute force
- [x] DNS dig
  -  By using [Google Public DNS](https://developers.google.com/speed/public-dns/)
- [x] Shodan search
- [x] Subdomain discovery
  - By using [DNSDumpster](https://dnsdumpster.com/) and [FindSubdomains](https://findsubdomains.com/)
- [x] SSL certificate lookup
  - By using [CertDB](https://certdb.com/)
- [x] Website's technology detection
  - By using [SimpleWhatWeb](https://github.com/ninoseki/SimpleWhatWeb)
- [x] Whois
  - By using [DomainBigData](https://domainbigdata.com/)
- [x] Website history
  - By using [urlscan.io](https://urlscan.io)
- [x] Threading support
- [ ] Port scanning

## Installation

```sh
$ gem install ryo
```

## Usage

```sh
$ ryo
Commands:
  ryo all URL         # Run all discovery plugins against a given URL
  ryo cert URL        # Discover an SSL certificate belongs to a given URL
  ryo dir URL         # Discover directories and files belong to a given URL
  ryo discover URL    # Run discovery plugin(s) against a given URL
  ryo dns URL         # Discover DNS records of a given URL
  ryo help [COMMAND]  # Describe available commands or one specific command
  ryo shodan URL      # Discover Shodan information of a given URL
  ryo subdomain URL   # Discover subdomains of a given URL
  ryo tech URL        # Discover used technolgies of a given URL
  ryo urlscan URL     # Discover urlscan.io scan results of a given URL
  ryo whois URL       # Discover whois information of a given URL
```

In order to use Shodan search, please set your Shodan API key as `SHODAN_API_KEY` environment variable.

**Example:**

```sh
# start Webrick HTTP server
# $ ruby -rwebrick -e 'WEBrick::HTTPServer.new(:DocumentRoot => "./", :Port => 8000).start'
$ ryo all http://localhost:8000 | jq .
```

**Output:**

```json
{
  "cert": {
    "error": "N/A"
  },
  "dir": [],
  "dns": {
    "A": {
      "Status": 3,
      "TC": false,
      "RD": true,
      "RA": true,
      "AD": true,
      "CD": false,
      "Question": [
        {
          "name": "127.0.0.1.",
          "type": 1
        }
      ],
      "Authority": [
        {
          "name": ".",
          "type": 6,
          "TTL": 48909,
          "data": "a.root-servers.net. nstld.verisign-grs.com. 2018101001 1800 900 604800 86400"
        }
      ]
    },
    "AAAA": {
      "Status": 3,
      "TC": false,
      "RD": true,
      "RA": true,
      "AD": true,
      "CD": false,
      "Question": [
        {
          "name": "127.0.0.1.",
          "type": 28
        }
      ],
      "Authority": [
        {
          "name": ".",
          "type": 6,
          "TTL": 53205,
          "data": "a.root-servers.net. nstld.verisign-grs.com. 2018101001 1800 900 604800 86400"
        }
      ]
    },
    "CNAME": {
      "Status": 3,
      "TC": false,
      "RD": true,
      "RA": true,
      "AD": true,
      "CD": false,
      "Question": [
        {
          "name": "127.0.0.1.",
          "type": 5
        }
      ],
      "Authority": [
        {
          "name": ".",
          "type": 6,
          "TTL": 86391,
          "data": "a.root-servers.net. nstld.verisign-grs.com. 2018101101 1800 900 604800 86400"
        }
      ]
    },
    "MX": {
      "Status": 3,
      "TC": false,
      "RD": true,
      "RA": true,
      "AD": true,
      "CD": false,
      "Question": [
        {
          "name": "127.0.0.1.",
          "type": 15
        }
      ],
      "Authority": [
        {
          "name": ".",
          "type": 6,
          "TTL": 86398,
          "data": "a.root-servers.net. nstld.verisign-grs.com. 2018101101 1800 900 604800 86400"
        }
      ]
    },
    "NS": {
      "Status": 3,
      "TC": false,
      "RD": true,
      "RA": true,
      "AD": true,
      "CD": false,
      "Question": [
        {
          "name": "127.0.0.1.",
          "type": 2
        }
      ],
      "Authority": [
        {
          "name": ".",
          "type": 6,
          "TTL": 47564,
          "data": "a.root-servers.net. nstld.verisign-grs.com. 2018101001 1800 900 604800 86400"
        }
      ]
    },
    "SOA": {
      "Status": 3,
      "TC": false,
      "RD": true,
      "RA": true,
      "AD": true,
      "CD": false,
      "Question": [
        {
          "name": "127.0.0.1.",
          "type": 6
        }
      ],
      "Authority": [
        {
          "name": ".",
          "type": 6,
          "TTL": 63738,
          "data": "a.root-servers.net. nstld.verisign-grs.com. 2018101100 1800 900 604800 86400"
        }
      ]
    },
    "TXT": {
      "Status": 3,
      "TC": false,
      "RD": true,
      "RA": true,
      "AD": true,
      "CD": false,
      "Question": [
        {
          "name": "127.0.0.1.",
          "type": 16
        }
      ],
      "Authority": [
        {
          "name": ".",
          "type": 6,
          "TTL": 86398,
          "data": "a.root-servers.net. nstld.verisign-grs.com. 2018101101 1800 900 604800 86400"
        }
      ]
    }
  },
  "shodan": {
    "error": "Invalid IP"
  },
  "subdomain": [
    {
      "domain": "127.0.0.1",
      "ip": "N/A"
    },
    {
      "domain": "develop.127.0.0.1",
      "ip": "N/A"
    },
    {
      "domain": "loja01.127.0.0.1",
      "ip": "N/A"
    },
    {
      "domain": "www.127.0.0.1",
      "ip": "N/A"
    }
  ],
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
  },
  "urlscan": {
    "results": [
      {
        "task": {
          "visibility": "public",
          "method": "api",
          "time": "2018-09-12T19:15:09.391Z",
          "source": "api",
          "url": "http://price-wise.net"
        },
        "stats": {
          "uniqIPs": 6,
          "consoleMsgs": 0,
          "dataLength": 401944,
          "encodedDataLength": 155968,
          "requests": 8
        },
        "page": {
          "country": "US",
          "server": "nginx/1.10.2",
          "city": "Dallas",
          "domain": "price-wise.net",
          "ip": "159.65.190.189",
          "asnname": "DIGITALOCEAN-ASN - DigitalOcean, LLC, US",
          "asn": "AS14061",
          "url": "http://price-wise.net/",
          "ptr": ""
        },
        "uniq_countries": 1,
        "_id": "120e5b5d-4d3e-4c63-ba0f-cf3e5ceb4219",
        "result": "https://urlscan.io/api/v1/result/120e5b5d-4d3e-4c63-ba0f-cf3e5ceb4219"
      }
    ],
    "total": 1
  },
  "whois": {
    "globa_stats": {},
    "registrant": {}
  }
}
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
