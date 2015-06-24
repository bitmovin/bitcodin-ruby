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

      # create encoding profile
      @encodingProfile = EncodingProfile.new('testProfile', 0, 1024000, Profile::MAIN, Preset::STANDARD, 480, 204, 0, 256000)

    end

    def test_createEncodingProfile
      # create new bitcodinAPI instance
      bitcodinAPI = BitcodinAPI.new(@apiKey)


      # parse response to get profile ID
      response     = bitcodinAPI.createEncodingProfile(@encodingProfile)
      responseData = JSON.parse(response)
      @profileId   = responseData['encodingProfileId']

      # check response code
      assert_equal(response.code, ResponseCodes::POST)
    end

    def teardown
      # create new bitcodinAPI instance
      bitcodinAPI = BitcodinAPI.new(@apiKey)

      # delete created Input
      bitcodinAPI.deleteEncodingProfile(@profileId)

    end

  end
end
