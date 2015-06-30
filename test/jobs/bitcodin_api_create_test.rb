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
end
