# [![bitmovin](https://cloudfront-prod.bitmovin.com/wp-content/themes/Bitmovin-V-0.1/images/logo3.png)](http://www.bitmovin.com)
[![build status](https://travis-ci.org/bitmovin/bitcodin-ruby.svg?branch=master)](https://travis-ci.org/bitmovin/bitcodin-ruby)
[![Coverage Status](https://coveralls.io/repos/bitmovin/bitcodin-ruby/badge.svg?branch=master)](https://coveralls.io/r/bitmovin/bitcodin-ruby?branch=master)

The bitcodin API for Ruby is a seamless integration with the [bitmovin cloud transcoding system](http://www.bitmovin.com). It enables the generation of MPEG-DASH and HLS content in just some minutes.

# Preparations

Before you can use the bitcodin-ruby API wrapper, you have to install two ruby gems by executing the following command:

```bash
gem install rest-client coveralls 
```
Go into the folder, which helds the repo you cloned and execute the following commands to install the bitmovin gem:

```bash
gem build bitcodin.gemspec
gem install bitcodin-<version>.gem
```

Be sure to replace 'version' with the appropriate <version> in the filename.

# Getting started
The main interaction with bitcodin will be handled through the BitcodinApi class. Therefore instantiate an object with your API key, which can be found in the settings of your bitcodin user account, as shown in the figure below.

![APIKey](https://cloudfront-prod.bitmovin.com/wp-content/uploads/2016/04/api-key.png)

An example how you can instantiate the bitcodin API is shown in the following:

```ruby
require 'bitcodin'

class TranscodeSintelToDASHAndHLS
  apiKey = "YOUR_API_KEY"
  bitAPI  = Bitcodin::BitcodinAPI.new(apiKey)
end
```
# Example
The following example demonstrates how to create a simple transcoding job, generating MPEG-DASH and Apple HLS out of a single MP4.
```ruby
$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../lib")
require 'bitcodin'
require 'json'

class TranscodeSintelToDASHAndHLS

  # create bitcodinAPI
  @apiKey = "YOUR_API_KEY"
  @bitAPI  = Bitcodin::BitcodinAPI.new(@apiKey)

  # create http config
  @httpConfig  = Bitcodin::HTTPInputConfig.new('http://eu-storage.bitcodin.com/inputs/Sintel.2010.720p.mkv')

  begin
    response     = @bitAPI.createInput(@httpConfig)
    responseData = JSON.parse(response)
    @inputId     = responseData['inputId']
  rescue Exception => e
    puts "Could not create Input."
    puts e.message
    puts e.backtrace.inspect
    return nil
  end

  puts "Created input with ID: #{@inputId}."



  @bitAPI  = Bitcodin::BitcodinAPI.new(@apiKey)

  # create job config
  manifestTypes = []
  manifestTypes.push(Bitcodin::ManifestType::MPEG_DASH_MPD)
  manifestTypes.push(Bitcodin::ManifestType::HLS_M3U8)
  @job = Bitcodin::Job.new(@inputId, 8588, manifestTypes)

  # create job
  begin
    response     = @bitAPI.createJob(@job)
    responseData = JSON.parse(response)
    @jobId       = responseData['jobId']
  rescue Exception => e
    puts "Could not create Job."
    puts e.message
    puts e.backtrace.inspect
    return nil
  end

  puts "Created job with ID: #{@jobId}."

end
```
