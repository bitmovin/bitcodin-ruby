require 'test/unit'
require 'bitcodin'
require 'json'
require 'coveralls'
Coveralls.wear!


module Bitcodin

  class ResponseCodes

    GET    = 200
    POST   = 201
    DELETE = 204
    PATCH  = 200

  end

  class BitcodinApiInputTests < Test::Unit::TestCase

    def setup
      # read access information (e.g. api key, etc.) from file
      file         = File.read('test/resources/settings.json')
      data         = JSON.parse(file)
      apiKey       = data['apikey']

      # create new bitcodinAPI instance
      @bitcodinAPI = BitcodinAPI.new(apiKey)

      # create S3 config
      s3Data    = data['s3OutputEUWest']
      @s3Config = S3OutputConfig.new('s3Config', s3Data['region'], s3Data['accessKey'], s3Data['secretKey'], s3Data['bucket'], s3Data['prefix'])

      # create FTP config
      ftpData     = data['ftpOutput']
      @ftpConfig  = FTPOutputConfig.new('ftpConfig', ftpData['host'], ftpData['username'], ftpData['password'])
    end

    def test_createS3Output
      response = @bitcodinAPI.createS3Output(@s3Config)
      assert_equal(response.code, ResponseCodes::POST)
    end

    def test_createFTPOutput
      response = @bitcodinAPI.createFTPOutput(@ftpConfig)
      assert_equal(response.code, ResponseCodes::POST)
    end

    def test_listOutputs
      response = @bitcodinAPI.listOutputs
      assert_equal(response.code, ResponseCodes::GET)
    end

    # def test_getOutputDetails
    #   response = @bitcodinAPI.getOutputDetails(2323)
    #   assert_equal(response.code, ResponseCodes::GET)
    # end
    #
    # def test_deleteOutput
    #   response = @bitcodinAPI.deleteOutput(2370)
    #   assert_equal(response.code, ResponseCodes::DELETE)
    # end

    def teardown
      ## Nothing up to now
    end

  end
end
