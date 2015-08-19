require 'test/unit'
require 'bitcodin'
require 'json'
require 'coveralls'
Coveralls.wear!


module Bitcodin
=begin
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

  class BitcodinApiCreateWidevineDrmTest < Test::Unit::TestCase
    def setup
      # read access information (e.g. api key, etc.) from file
      file    = File.read('test/resources/settings.json')
      data    = JSON.parse(file)
      @apiKey = data['apikey']

      @drmConfig = WidevineDrmConfiguration.new('widevine_test', '1ae8ccd0e7985cc0b6203a55855a1034afc252980e970ca90e5202689f947ab9', 'd58ce954203b7c9a9a9d467f59839249', 'http://license.uat.widevine.com/cenc/getcontentkey', '746573745f69645f4639465043304e4f', 'mpeg_cenc')

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

  class BitcodinApiCreatePlayreadyDrmTest < Test::Unit::TestCase
    def setup
      # read access information (e.g. api key, etc.) from file
      file    = File.read('test/resources/settings.json')
      data    = JSON.parse(file)
      @apiKey = data['apikey']

      @drmConfig = PlayreadyDrmConfiguration.new('XVBovsmzhP9gRIZxWfFta3VVRPzVEWmJsazEJ46I', 'http://playready.directtaps.net/pr/svc/rightsmanager.asmx', 'mpeg_cenc', '746573745f69645f4639465043304e4f')

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

  class BitcodinApiCreateWidevinePlayreadyCombinedDrmTest < Test::Unit::TestCase
    def setup
      # read access information (e.g. api key, etc.) from file
      file    = File.read('test/resources/settings.json')
      data    = JSON.parse(file)
      @apiKey = data['apikey']

      @drmConfig = WidevinePlayreadyCombinedDrmConfiguration.new('eb676abbcb345e96bbcf616630f1a3da', '100b6c20940f779a4589152b57d2dacb', 'http://playready.directtaps.net/pr/svc/rightsmanager.asmx?PlayRight=1&ContentKey=EAtsIJQPd5pFiRUrV9Layw==', 'mpeg_cenc', 'CAESEOtnarvLNF6Wu89hZjDxo9oaDXdpZGV2aW5lX3Rlc3QiEGZrajNsamFTZGZhbGtyM2oqAkhEMgA=')

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

  class BitcodinApiCreateHlsEncryptionTest < Test::Unit::TestCase
    def setup
      # read access information (e.g. api key, etc.) from file
      file    = File.read('test/resources/settings.json')
      data    = JSON.parse(file)
      @apiKey = data['apikey']

      @hlsEncryption = HLSEncryptionConfiguration.new('SAMPLE-AES', 'cab5b529ae28d5cc5e3e7bc3fd4a544d', '08eecef4b026deec395234d94218273d')

      # create job config
      manifestTypes = []
      manifestTypes.push(ManifestType::MPEG_DASH_MPD)
      manifestTypes.push(ManifestType::HLS_M3U8)
      @job = Job.new(3868, 7353, manifestTypes, 'standard', nil, @hlsEncryption.values)
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
=end

  class BitcodinApiCreateMultipleAudioStreamsTest < Test::Unit::TestCase
    def setup
      # read access information (e.g. api key, etc.) from file
      file    = File.read('test/resources/settings.json')
      data    = JSON.parse(file)
      @apiKey = data['apikey']
      bitcodinAPI = BitcodinAPI.new(@apiKey)

      # create encoding profile
      videoStreamConfig1 = VideoStreamConfig.new(0, 1024000, Profile::MAIN, Preset::STANDARD, 480, 204)
      videoStreamConfigs = [videoStreamConfig1]
      audioStreamConfig1 = AudioStreamConfig.new(0, 256000)
      audioStreamConfig2 = AudioStreamConfig.new(1, 256000)
      audioStreamConfigs = [audioStreamConfig1, audioStreamConfig2]
      encodingProfile = EncodingProfile.new('testProfileRuby', videoStreamConfigs, audioStreamConfigs)
      # parse response to get encoding profile ID
      response           = bitcodinAPI.createEncodingProfile(encodingProfile)
      responseData       = JSON.parse(response)
      encodingProfileId = responseData['encodingProfileId']


      bitcodinAPI = BitcodinAPI.new(@apiKey)
      # create input
      httpConfig  = HTTPInputConfig.new('http://bitbucketireland.s3.amazonaws.com/Sintel-two-audio-streams-short.mkv')
      # parse response to get input ID
      response     = bitcodinAPI.createInput(httpConfig)
      responseData = JSON.parse(response)
      inputId     = responseData['inputId']

      # create job config
      manifestTypes = []
      manifestTypes.push(ManifestType::MPEG_DASH_MPD)
      manifestTypes.push(ManifestType::HLS_M3U8)

      # create audio metadata
      audioMetaDataConfiguration0 = AudioMetaDataConfiguration.new(0, 'de', 'Just Sound')
      audioMetaDataConfiguration1 = AudioMetaDataConfiguration.new(1, 'en', 'Sound and Voice')

      @job = Job.new(inputId, encodingProfileId, manifestTypes, 'standard', nil, nil, [audioMetaDataConfiguration0, audioMetaDataConfiguration1])
    end

    def test_createJob
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
