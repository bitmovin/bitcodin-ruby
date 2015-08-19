module Bitcodin
  class EncodingProfile

    attr_accessor :values

    #def initialize(name, defaultStreamIdVideo, bitrateVideo, profile, preset, height, width, defaultStreamIdAudio, bitrateAudio)
    def initialize(name, videoStreamConfigs, audioStreamConfigs)  
      @values =  '{'
      @values += '"name": "' + name + '",'
      @values += '"videoStreamConfigs": ['

      videoStreamConfigs.each do |videoStreamConfig|
        @values += videoStreamConfig.values
        if videoStreamConfig != videoStreamConfigs.last
          @values += ','
        end
      end

      @values += '],'
      @values += '"audioStreamConfigs": ['

      audioStreamConfigs.each do |audioStreamConfig|
        @values += audioStreamConfig.values
        if audioStreamConfig != audioStreamConfigs.last
          @values += ','
        end
      end

      @values += ']}'
    end

  end
end
