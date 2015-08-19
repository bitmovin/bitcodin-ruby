module Bitcodin
  class VideoStreamConfig
    attr_accessor :values
    def initialize(default_stream_id, bitrate, profile, preset, height, width)
      @values = '{
        "defaultStreamId": ' + default_stream_id.to_s + ',
        "bitrate": '         + bitrate.to_s + ',
        "profile": "'        + profile + '",
        "preset":  "'        + preset + '",
        "height": '          + height.to_s + ',
        "width":  '          + width.to_s + '
      }'
    end
  end
end
