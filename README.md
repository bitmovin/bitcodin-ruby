# [![bitcodin](http://www.bitcodin.com/wp-content/uploads/2014/10/bitcodin-small.gif)](http://www.bitcodin.com)
[![build status](https://travis-ci.org/bitmovin/bitcodin-ruby.svg?branch=master)](https://travis-ci.org/bitmovin/bitcodin-ruby.svg?branch=master)
[![Coverage Status](https://coveralls.io/repos/bitmovin/bitcodin-ruby/badge.svg?branch=master)](https://coveralls.io/r/bitmovin/bitcodin-ruby?branch=master)

The bitcodin API for Ruby is a seamless integration with the [bitcodin cloud transcoding system](http://www.bitcodin.com). It enables the generation of MPEG-DASH and HLS content in just some minutes.

# Getting started
The main interaction with bitcodin will be handled through the BitcodinApi class. Therefore instantiate an object with your API key, which can be found in the settings of your bitcodin user account, as shown in the figure below.

![APIKey](http://www.bitcodin.com/wp-content/uploads/2015/06/api_key.png)
