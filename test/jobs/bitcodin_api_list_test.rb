=begin
require 'test/unit'
require 'bitcodin'
require 'json'
require 'coveralls'
Coveralls.wear!


module Bitcodin
  class BitcodinApiListTest < Test::Unit::TestCase

    def setup
      # read access information (e.g. api key, etc.) from file
      file         = File.read('test/resources/settings.json')
      data         = JSON.parse(file)
      apiKey       = data['apikey']

      # create new bitcodinAPI instance
      @bitcodinAPI = BitcodinAPI.new(apiKey)
    end

    def test_listInput
      response = @bitcodinAPI.listAllJobs
      assert_equal(response.code, ResponseCodes::GET)
    end

    def teardown
      ## Nothing up to now
    end

  end
end
=end