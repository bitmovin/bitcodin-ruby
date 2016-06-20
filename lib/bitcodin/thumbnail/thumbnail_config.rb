module Bitcodin
  class ThumbnailConfig
    attr_accessor :values
    def initialize(jobId, height, position)
      @values = '{'
      @values += '"jobId": ' + jobId.to_s + ','
      @values += '"height": ' + height.to_s + ','
      @values += '"position": ' + position.to_s + ','
      @values += '"async": true'
      @values += '}'
    end
  end
end
