require 'test/unit'
require 'bitcodin'
require 'json'
require 'coveralls'
Coveralls.wear!


module Bitcodin
  class BitcodinApiStatisticsTests < Test::Unit::TestCase

    def setup
      # read access information (e.g. api key, etc.) from file
      file         = File.read('test/resources/settings.json')
      data         = JSON.parse(file)
      apiKey       = data['apikey']

      # create new bitcodinAPI instance
      @bitcodinAPI = BitcodinAPI.new(apiKey)
    end

    def test_getCurrentOutputStatus
      response = @bitcodinAPI.getCurrentOutputStatus
      assert_equal(response.code, ResponseCodes::GET)
    end

    def test_getJobStatistics
      response = @bitcodinAPI.getJobStatistics(Date.new(2001,12,24), Date.new(2100,12,31))
      assert_equal(response.code, ResponseCodes::GET)
    end

    def teardown
      ## Nothing up to now
    end

  end
end
