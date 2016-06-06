$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../lib")
require 'bitcodin'
require 'json'

class CreateJobSprite

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

  # create sprite
  @sprite = Bitcodin::SpriteConfig.new(@jobId, 240, 320, 50)

  begin
    @bitAPI  = Bitcodin::BitcodinAPI.new(@apiKey)
    response     = @bitAPI.createSprite(@sprite)
    responseData = JSON.parse(response)
    @spriteId = responseData['id']

    while true
      @bitAPI  = Bitcodin::BitcodinAPI.new(@apiKey)
      response = @bitAPI.getSprite(@spriteId)
      responseData = JSON.parse(response)
      @spriteStatus = responseData['state']

      if @spriteStatus == "ERROR"
        puts "Could not create Sprite."
        break
      elsif @spriteStatus == "FINISHED"
        @spriteUrl = responseData['spriteUrl']
        @spriteVttUrl = responseData['vttUrl']
        puts "Created sprite with url: #{@spriteUrl} and vtt url: #{@spriteVttUrl}"
        break
      end

      sleep(5)
    end
  rescue Exception => e
    puts "Could not create Sprite."
    puts e.message
    puts e.backtrace.inspect
    return nil
  end

end
