require 'test/unit'
require 'bitcodin'
require 'json'
require 'coveralls'
Coveralls.wear!


module Bitcodin
  class BitcodinApiDeleteTest < Test::Unit::TestCase

    def setup
      # read access information (e.g. api key, etc.) from file
      file    = File.read('test/resources/settings.json')
      data    = JSON.parse(file)
      @apiKey = data['apikey']

      # create new bitcodinAPI instance
      bitcodinAPI = BitcodinAPI.new(@apiKey)

      # create http config
      httpConfig = HTTPInputConfig.new('http://bitbucketireland.s3.amazonaws.com/Sintel-original-short.mkv')

      # create input
      response = bitcodinAPI.createInput(httpConfig)

      # parse response to get input ID
      responseData = JSON.parse(response)
      @inputId     = responseData['inputId']

    end

    def test_deleteInput
      # create new bitcodinAPI instance
      bitcodinAPI = BitcodinAPI.new(@apiKey)

      # delete created Input
      response = bitcodinAPI.deleteInput(@inputId)

      # check response code
      assert_equal(response.code, ResponseCodes::DELETE)
    end

    def teardown

    end

  end
end
