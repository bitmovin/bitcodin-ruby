module Bitcodin
  class Job
    attr_accessor :values
    def initialize(inputId, encodingProfileId, manifestTypes, speed=nil, drmConfig=nil, hlsEncryptionConfig=nil)
      @values = '{'
      @values += '"inputId": ' + inputId.to_s + ','
      @values += '"encodingProfileId": ' + encodingProfileId.to_s + ','
      @values += '"manifestTypes": ' + manifestTypes.to_s + ''
      if !speed.nil?
        @values += ',"speed": ' + '"' + speed.to_s + '"' + ''
      end
      if !drmConfig.nil?
        @values += ',"drmConfig": ' + drmConfig + ''
      end
      if !hlsEncryptionConfig.nil?
        @values += ',"hlsEncryptionConfig": ' + hlsEncryptionConfig + ''
      end
      @values += '}'
      puts @values
    end
  end
end
