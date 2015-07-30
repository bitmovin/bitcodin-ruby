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

      # create job config
      manifestTypes = []
      manifestTypes.push(ManifestType::MPEG_DASH_MPD)
      manifestTypes.push(ManifestType::HLS_M3U8)
      @job = Job.new(3868, 7353, manifestTypes)
    end

    def test_createJob
      # create new bitcodinAPI instance
      bitcodinAPI = BitcodinAPI.new(@apiKey)

      # parse response to get job ID
      response     = bitcodinAPI.createJob(@job)
      responseData = JSON.parse(response)
      @jobId       = responseData['jobId']

      # check response code
      assert_equal(response.code, ResponseCodes::POST)
    end

    def teardown

    end

  end

  class BitcodinApiCreateDrmTest < Test::Unit::TestCase
    def setup
      # read access information (e.g. api key, etc.) from file
      file    = File.read('test/resources/settings.json')
      data    = JSON.parse(file)
      @apiKey = data['apikey']

      @drmConfig = DrmConfiguration.new('widevine', 'widevine_test', '1ae8ccd0e7985cc0b6203a55855a1034afc252980e970ca90e5202689f947ab9', 'd58ce954203b7c9a9a9d467f59839249', 'http://license.uat.widevine.com/cenc/getcontentkey', '746573745f69645f4639465043304e4f', 'mpeg_cenc')

      # create job config
      manifestTypes = []
      manifestTypes.push(ManifestType::MPEG_DASH_MPD)
      manifestTypes.push(ManifestType::HLS_M3U8)
      @job = Job.new(3868, 7353, manifestTypes, 'standard', @drmConfig.values)
    end

    def test_createJob
      # create new bitcodinAPI instance
      bitcodinAPI = BitcodinAPI.new(@apiKey)
      # parse response to get job ID
      response     = bitcodinAPI.createJob(@job)
      responseData = JSON.parse(response)
      @jobId       = responseData['jobId']

      # check response code
      assert_equal(response.code, ResponseCodes::POST)
    end

    def teardown

    end
  end
end
