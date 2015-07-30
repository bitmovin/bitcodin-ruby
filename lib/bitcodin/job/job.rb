module Bitcodin
  class Job

    attr_accessor :values

    def initialize(inputId, encodingProfileId, manifestTypes, speed=nil, drmConfig=nil)
      if !drmConfig.nil? && !speed.nil?
        @values = '{
          "inputId": '           + inputId.to_s + ',
          "encodingProfileId": ' + encodingProfileId.to_s + ',
          "manifestTypes": '     + manifestTypes.to_s + ',
          "speed": '             + '"' + speed.to_s + '"' + ',
          "drmConfig": '         + drmConfig + '
        }'
      elsif !drmConfig.nil? && speed.nil?
        @values = '{
          "inputId": '           + inputId.to_s + ',
          "encodingProfileId": ' + encodingProfileId.to_s + ',
          "manifestTypes": '     + manifestTypes.to_s + ',
          "drmConfig": '         + drmConfig + '
        }'
        elsif drmConfig.nil? && !speed.nil?
          @values = '{
            "inputId": '           + inputId.to_s + ',
            "encodingProfileId": ' + encodingProfileId.to_s + ',
            "manifestTypes": '     + manifestTypes.to_s + ',
            "speed": '             + speed.to_s + '
          }'
        else
          @values = '{
            "inputId": '           + inputId.to_s + ',
            "encodingProfileId": ' + encodingProfileId.to_s + ',
            "manifestTypes": '     + manifestTypes.to_s + '
          }'
      end
    end

  end
end
