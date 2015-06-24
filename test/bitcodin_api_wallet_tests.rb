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

  class BitcodinApiWalletTests < Test::Unit::TestCase

    def setup
      # read access information (e.g. api key, etc.) from file
      file         = File.read('test/resources/settings.json')
      data         = JSON.parse(file)
      apiKey       = data['apikey']

      # create new bitcodinAPI instance
      @bitcodinAPI = BitcodinAPI.new(apiKey)
    end

    def test_getWalletInformation
      response = @bitcodinAPI.getWalletInformation
      assert_equal(response.code, ResponseCodes::GET)
    end

    def test_getListOfAllDeposits
      response = @bitcodinAPI.getListOfAllDeposits
      assert_equal(response.code, ResponseCodes::GET)
    end

    def test_getListOfAllBills
      response = @bitcodinAPI.getListOfAllBills
      assert_equal(response.code, ResponseCodes::GET)
    end

    def teardown
      ## Nothing up to now
    end

  end
end
