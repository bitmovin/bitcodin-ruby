module Bitcodin
  class Job
    attr_accessor :values
    def initialize(inputId, encodingProfileId, manifestTypes, speed=nil, drmConfig=nil, hlsEncryptionConfig=nil, audioMetaDataConfigs=nil, location=nil, videoMetaData=nil, extractClosedCaptions=nil)
      @values = '{'
      @values += '"inputId": ' + inputId.to_s + ','
      @values += '"encodingProfileId": ' + encodingProfileId.to_s + ','
      @values += '"manifestTypes": ' + manifestTypes.to_s + ''
      unless speed.nil?
        @values += ',"speed": ' + '"' + speed.to_s + '"' + ''
      end
      unless drmConfig.nil?
        @values += ',"drmConfig": ' + drmConfig + ''
      end
      unless hlsEncryptionConfig.nil?
        @values += ',"hlsEncryptionConfig": ' + hlsEncryptionConfig + ''
      end
      unless audioMetaDataConfigs.nil?
        @values += ',"audioMetaData": ['
        audioMetaDataConfigs.each do |audioMetaDataConfig|
          @values += audioMetaDataConfig.values
          if audioMetaDataConfig != audioMetaDataConfigs.last
            @values += ','
          end
        end
        @values += ']'
      end
      unless location.nil?
        @values += ',"location": "' + location.to_s + '"'
      end
      unless videoMetaData.nil?
        unless extractClosedCaptions.nil?
          @values += ', "extractClosedCaptions": ' + extractClosedCaptions
        end
        @values += ', "videoMetaData": ['
        videoMetaData.each do |videoMeta|
          @values += videoMeta.values
          if videoMeta != videoMetaData.last
            @values += ','
          end
        end
        @values += ']'
      end
      @values += '}'
    end
  end
end
