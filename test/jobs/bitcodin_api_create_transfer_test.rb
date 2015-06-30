require 'test/unit'
require 'bitcodin'
require 'json'
require 'coveralls'
Coveralls.wear!


module Bitcodin
  class BitcodinApiCreateTransferTest < Test::Unit::TestCase

    def setup
      # read access information (e.g. api key, etc.) from file
      file    = File.read('test/resources/settings.json')
      data    = JSON.parse(file)
      @apiKey = data['apikey']

      # create transfer config
      @transferConfig = TransferConfig.new(2854, 2524)

    end

    def test_createTransferJob
      # create new bitcodinAPI instance
      bitcodinAPI = BitcodinAPI.new(@apiKey)

      # parse response to get job ID
      response = bitcodinAPI.createTransferJob(@transferConfig)

      # check response code
      assert_equal(response.code, ResponseCodes::POST)
    end

    def teardown

    end

  end
end
