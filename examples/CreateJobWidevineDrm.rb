$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../lib")
require 'bitcodin'
require 'json'

class CreateJobWidevineDrm

  # create bitcodinAPI
  @apiKey = "YOUR_API_KEY"
  @bitAPI  = Bitcodin::BitcodinAPI.new(@apiKey)

  # create http config
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



  @bitAPI  = Bitcodin::BitcodinAPI.new(@apiKey)

  # create job config
  manifestTypes = []
  manifestTypes.push(Bitcodin::ManifestType::MPEG_DASH_MPD)
  manifestTypes.push(Bitcodin::ManifestType::HLS_M3U8)

  @drmConfig = WidevineDrmConfiguration.new('widevine_test', '1ae8ccd0e7985cc0b6203a55855a1034afc252980e970ca90e5202689f947ab9', 'd58ce954203b7c9a9a9d467f59839249', 'http://license.uat.widevine.com/cenc/getcontentkey', '746573745f69645f4639465043304e4f', 'mpeg_cenc')
  @job = Bitcodin::Job.new(@inputId, 8588, manifestTypes, 'standard', @drmConfig.values)

  # create job
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
