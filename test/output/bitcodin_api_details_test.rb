require 'test/unit'
require 'bitcodin'
require 'json'
require 'coveralls'
Coveralls.wear!


module Bitcodin
  class BitcodinApiDetailsTest < Test::Unit::TestCase

    def setup
      # read access information (e.g. api key, etc.) from file
      file    = File.read('test/resources/settings.json')
      data    = JSON.parse(file)
      @apiKey = data['apikey']

      # create FTP config
      ftpData     = data['ftpOutput']
      @ftpConfig  = FTPOutputConfig.new('ftpConfig', ftpData['host'], ftpData['username'], ftpData['password'])

      # create new bitcodinAPI instance
      bitcodinAPI = BitcodinAPI.new(@apiKey)

      # create S3 Output
      response = bitcodinAPI.createFTPOutput(@ftpConfig)

      # parse response to get output ID
      responseData = JSON.parse(response)
      @outputId    = responseData['outputId']
    end

    def test_getOutputDetails
      bitcodinAPI = BitcodinAPI.new(@apiKey)
      response    = bitcodinAPI.getOutputDetails(@outputId)

      # check response
      assert_equal(response.code, ResponseCodes::GET)
    end

    def teardown
      bitcodinAPI = BitcodinAPI.new(@apiKey)
      bitcodinAPI.deleteOutput(@outputId)
    end

  end
end
