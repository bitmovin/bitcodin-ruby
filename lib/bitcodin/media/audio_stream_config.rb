module Bitcodin
  class AudioStreamConfig
    attr_accessor :values
    def initialize(default_stream_id, bitrate)
      @values = '{
        "defaultStreamId": ' + default_stream_id.to_s + ',
        "bitrate": '         + bitrate.to_s + '
      }'
    end
  end
end
