require 'test/unit'
require 'bitcodin'
require 'json'
require 'coveralls'
Coveralls.wear!


module Bitcodin
  class BitcodinApiCreateTest < Test::Unit::TestCase

    def setup
      # read access information (e.g. api key, etc.) from file
      file    = File.read('test/resources/settings.json')
      data    = JSON.parse(file)
      @apiKey = data['apikey']

    end

    def test_createInput
      # create new bitcodinAPI instance
      bitcodinAPI = BitcodinAPI.new(@apiKey)

      # create http config
      httpConfig  = HTTPInputConfig.new('http://eu-storage.bitcodin.com/inputs/Sintel.2010.720p.mkv')

      # parse response to get input ID
      response     = bitcodinAPI.createInput(httpConfig)
      responseData = JSON.parse(response)
      @inputId     = responseData['inputId']

      # check response code
      assert_equal(response.code, ResponseCodes::POST)
    end

    def teardown
      # create new bitcodinAPI instance
      bitcodinAPI = BitcodinAPI.new(@apiKey)

      # delete created Input
      bitcodinAPI.deleteInput(@inputId)

    end

  end
end
