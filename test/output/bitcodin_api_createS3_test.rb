require 'test/unit'
require 'bitcodin'
require 'json'
require 'coveralls'
Coveralls.wear!


module Bitcodin
  class BitcodinApiCreateS3Test < Test::Unit::TestCase

    def setup
      # read access information (e.g. api key, etc.) from file
      file    = File.read('test/resources/settings.json')
      data    = JSON.parse(file)
      @apiKey = data['apikey']

      # create S3 config
      s3Data    = data['s3OutputEUWest']
      @s3Config = S3OutputConfig.new('s3Config', s3Data['region'], s3Data['accessKey'], s3Data['secretKey'], s3Data['bucket'], s3Data['prefix'])
    end

    def test_createS3Output
      # create new bitcodinAPI instance
      bitcodinAPI = BitcodinAPI.new(@apiKey)

      # create S3 Output
      response = bitcodinAPI.createS3Output(@s3Config)

      # parse response to get output ID
      responseData = JSON.parse(response)
      @outputId    = responseData['outputId']

      # check response
      assert_equal(response.code, ResponseCodes::POST)
    end

    def teardown
      bitcodinAPI = BitcodinAPI.new(@apiKey)
      bitcodinAPI.deleteOutput(@outputId)
    end

  end
end
