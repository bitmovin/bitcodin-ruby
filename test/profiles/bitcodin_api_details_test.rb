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

      # create new bitcodinAPI instance
      bitcodinAPI = BitcodinAPI.new(@apiKey)

      # create encoding profile
      videoStreamConfig1 = VideoStreamConfig.new(0, 1024000, Profile::MAIN, Preset::STANDARD, 480, 204)
      videoStreamConfigs = [videoStreamConfig1]
      audioStreamConfig1 = AudioStreamConfig.new(0, 256000)
      audioStreamConfigs = [audioStreamConfig1]
      encodingProfile = EncodingProfile.new('testProfileRuby', videoStreamConfigs, audioStreamConfigs)

      # parse response to get input ID
      response     = bitcodinAPI.createEncodingProfile(encodingProfile)
      responseData = JSON.parse(response)
      @encodingProfileId     = responseData['encodingProfileId']
    end

    def test_getProfileDetails
      bitcodinAPI = BitcodinAPI.new(@apiKey)
      response    = bitcodinAPI.getEncodingProfile(@encodingProfileId)
      assert_equal(response.code, ResponseCodes::GET)
    end

    def teardown
      # create new bitcodinAPI instance
      bitcodinAPI = BitcodinAPI.new(@apiKey)

      # delete created Input
      bitcodinAPI.deleteEncodingProfile(@encodingProfileId)

    end

  end
end
