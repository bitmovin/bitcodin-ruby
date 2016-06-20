$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../lib")
require 'bitcodin'
require 'json'

class CreateJobThumbnail

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
  @job = Bitcodin::Job.new(@inputId, 73304, manifestTypes)

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

  # create thumbnail
  @thumbnail = Bitcodin::ThumbnailConfig.new(@jobId, 320, 50)

  begin
    @bitAPI  = Bitcodin::BitcodinAPI.new(@apiKey)
    response     = @bitAPI.createThumbnail(@thumbnail)
    responseData = JSON.parse(response)
    @thumbnailId = responseData['id']

    while true
      @bitAPI  = Bitcodin::BitcodinAPI.new(@apiKey)
      response = @bitAPI.getThumbnail(@thumbnailId)
      responseData = JSON.parse(response)
      @thumbnailStatus = responseData['state']

      if @thumbnailStatus == "ERROR"
        puts "Could not create Thumbnail."
        break
      elsif @thumbnailStatus == "FINISHED"
        @thumbnailUrl = responseData['thumbnailUrl']
        puts "Created thumbnail with url: #{@thumbnailUrl}"
        break
      end

      sleep(5)
    end
  rescue Exception => e
    puts "Could not create Thumbnail."
    puts e.message
    puts e.backtrace.inspect
    return nil
  end

end
