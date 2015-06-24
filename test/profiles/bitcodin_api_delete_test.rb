require 'test/unit'
require 'bitcodin'
require 'json'
require 'coveralls'
Coveralls.wear!


module Bitcodin
  class BitcodinApiDeleteTest < Test::Unit::TestCase

    def setup
      # read access information (e.g. api key, etc.) from file
      file    = File.read('test/resources/settings.json')
      data    = JSON.parse(file)
      @apiKey = data['apikey']

      # create new bitcodinAPI instance
      bitcodinAPI = BitcodinAPI.new(@apiKey)

      # create encoding profile
      encodingProfile = EncodingProfile.new('testProfile', 0, 1024000, Profile::MAIN, Preset::STANDARD, 480, 204, 0, 256000)

      # parse response to get input ID
      response           = bitcodinAPI.createEncodingProfile(encodingProfile)
      responseData       = JSON.parse(response)
      @encodingProfileId = responseData['encodingProfileId']
    end

    def test_getProfileDetails
      # create new bitcodinAPI instance
      bitcodinAPI = BitcodinAPI.new(@apiKey)

      # delete created Input
      response = bitcodinAPI.deleteEncodingProfile(@encodingProfileId)
      assert_equal(response.code, ResponseCodes::DELETE)
    end

    def teardown

    end

  end
end
