module Bitcodin
  class Job

    attr_accessor :values

    def initialize(inputId, encodingProfileId, manifestTypes)
      @values = '{
        "inputId": '           + inputId.to_s + ',
        "encodingProfileId": ' + encodingProfileId.to_s + ',
        "manifestTypes": '     + manifestTypes.to_s + '
      }'
    end

  end
end
