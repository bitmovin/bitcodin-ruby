require 'test/unit'
require 'bitcodin'
require 'json'
require 'coveralls'
Coveralls.wear!


module Bitcodin
  class BitcodinApiCreateFTPTest < Test::Unit::TestCase

    def setup
      # read access information (e.g. api key, etc.) from file
      file    = File.read('test/resources/settings.json')
      data    = JSON.parse(file)
      @apiKey = data['apikey']

      # create FTP config
      ftpData     = data['ftpOutput']
      @ftpConfig  = FTPOutputConfig.new('ftpConfig', ftpData['host'], ftpData['username'], ftpData['password'])
    end

    def test_createFTPOutput
      # create new bitcodinAPI instance
      bitcodinAPI = BitcodinAPI.new(@apiKey)

      # create S3 Output
      response = bitcodinAPI.createFTPOutput(@ftpConfig)

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
