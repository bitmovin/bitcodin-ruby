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

      # create http config
      @httpConfig  = HTTPInputConfig.new('http://ftp.nluug.nl/pub/graphics/blender/demo/movies/Sintel.2010.720p.mkv')
    end

    def test_createInput
      response = @bitcodinAPI.createInput(@httpConfig)
      assert_equal(response.code, ResponseCodes::POST)
    end

    def test_listInput
     response = @bitcodinAPI.listInput
     assert_equal(response.code, ResponseCodes::GET)
    end

    def test_getInputDetails
     response = @bitcodinAPI.getInputDetails(4440)
     assert_equal(response.code, ResponseCodes::GET)
    end

    def test_deleteInput
      response = @bitcodinAPI.deleteInput(4436)
      assert_equal(response.code, ResponseCodes::DELETE)
    end

    def teardown
      ## Nothing up to now
    end

  end
end
