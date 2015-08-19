$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../lib")
require 'bitcodin'
require 'json'

class CreateJobPlayreadyDrm

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

  @drmConfig = PlayreadyDrmConfiguration.new('XVBovsmzhP9gRIZxWfFta3VVRPzVEWmJsazEJ46I', 'http://playready.directtaps.net/pr/svc/rightsmanager.asmx', 'mpeg_cenc', '746573745f69645f4639465043304e4f')
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
