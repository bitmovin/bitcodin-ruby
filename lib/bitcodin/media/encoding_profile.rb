module Bitcodin
  class EncodingProfile

    attr_accessor :values

    def initialize(name, defaultStreamIdVideo, bitrateVideo, profile, preset, height, width, defaultStreamIdAudio, bitrateAudio)
      @values = '{
        "name": "'     + name + '",
        "videoStreamConfigs": [
          {
            "defaultStreamId": ' + defaultStreamIdVideo.to_s + ',
            "bitrate": '         + bitrateVideo.to_s + ',
            "profile": "'        + profile + '",
            "preset":  "'        + preset + '",
            "height": '          + height.to_s + ',
            "width":  '          + width.to_s + '
          }
        ],
        "audioStreamConfigs": [
          {
            "defaultStreamId": ' + defaultStreamIdAudio.to_s + ',
            "bitrate": '         + bitrateAudio.to_s + '
          }
        ]
      }'
    end

  end
end