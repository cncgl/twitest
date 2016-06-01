# Twitest

[![Dependency Status](https://gemnasium.com/badges/github.com/cncgl/twitest.svg)](https://gemnasium.com/github.com/cncgl/twitest)
[![Gem Version](https://badge.fury.io/rb/twitest.svg)](https://badge.fury.io/rb/twitest)

Estimate twitter engagement by Machine Learning.

## Setup
Create Indico account at [https://indico.io/](https://indico.io/).
API Key set enviroment variable ``INDICO_API_KEY``.

Create Microsoft Translator account [https://datamarket.azure.com/dataset/1899a118-d202-492c-aa16-ba21c33c06cb](https://datamarket.azure.com/dataset/1899a118-d202-492c-aa16-ba21c33c06cb).
Client ID and Client Secret set environment variable ``CLIENT_ID`` and ``CLIENT_SECRET``.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'twitest'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install twitest

## Usage
It's OK even if SENTENSE in Japanese. 

    $ twitest <SENTENSE>

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cncgl/twitest.

## License

[MIT](LICENSE)
