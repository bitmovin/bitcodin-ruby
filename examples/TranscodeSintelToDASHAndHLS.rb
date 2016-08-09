$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../lib")
require 'bitcodin'
require 'json'

class TranscodeSintelToDASHAndHLS

  @apiKey = "YOUR_API_KEY"

  # INPUT
  # create bitcodinAPI
  @bitAPI  = Bitcodin::BitcodinAPI.new(@apiKey)
  @httpConfig  = Bitcodin::HTTPInputConfig.new('http://eu-storage.bitcodin.com/inputs/Sintel.2010.720p.mkv')

  begin
    response     = @bitAPI.createInput(@httpConfig)
    responseData = JSON.parse(response)
    @inputId     = responseData['inputId']
  rescue Exception => e
    puts "Could not create Input."
    puts e.message
    puts e.backtrace.inspect
    return nil
  end

  puts "Created input with ID: #{@inputId}."


  # ENCODING PROFILE
  @bitAPI  = Bitcodin::BitcodinAPI.new(@apiKey)
  # create encoding profile
  videoStreamConfig1 = Bitcodin::VideoStreamConfig.new(0, 4800000, Bitcodin::Profile::MAIN, Bitcodin::Preset::PREMIUM, 1080, 1920)
  videoStreamConfig2 = Bitcodin::VideoStreamConfig.new(0, 2400000, Bitcodin::Profile::MAIN, Bitcodin::Preset::PREMIUM, 720, 1280)
  videoStreamConfig3 = Bitcodin::VideoStreamConfig.new(0, 1200000, Bitcodin::Profile::MAIN, Bitcodin::Preset::PREMIUM, 480, 856)
  videoStreamConfigs = [videoStreamConfig1, videoStreamConfig2, videoStreamConfig3]
  audioStreamConfig1 = Bitcodin::AudioStreamConfig.new(0, 128000)
  audioStreamConfigs = [audioStreamConfig1]
  encodingProfile = Bitcodin::EncodingProfile.new('Sample Sintel Transcode Profile (Ruby)', videoStreamConfigs, audioStreamConfigs)
  # parse response to get encoding profile ID
  begin
    response           = @bitAPI.createEncodingProfile(encodingProfile)
    responseData       = JSON.parse(response)
    @encodingProfileId = responseData['encodingProfileId']
  rescue Exception => e
    puts "Could not create Encoding Profile."
    puts e.message
    puts e.backtrace.inspect
    return nil
  end

  puts "Created encoding profile with ID: #{@encodingProfileId}."

  # JOB
  @bitAPI  = Bitcodin::BitcodinAPI.new(@apiKey)
  # create job config
  manifestTypes = []
  manifestTypes.push(Bitcodin::ManifestType::MPEG_DASH_MPD)
  manifestTypes.push(Bitcodin::ManifestType::HLS_M3U8)
  @job = Bitcodin::Job.new(@inputId, @encodingProfileId, manifestTypes)

  begin
    response     = @bitAPI.createJob(@job)
    responseData = JSON.parse(response)
    @jobId       = responseData['jobId']
  rescue Exception => e
    puts "Could not create Job."
    puts e.message
    puts e.backtrace.inspect
    return nil
  end

  puts "Created job with ID: #{@jobId}."

end
