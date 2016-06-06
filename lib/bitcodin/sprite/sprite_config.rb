module Bitcodin
  class SpriteConfig
    attr_accessor :values
    def initialize(jobId, height, width, distance)
      @values = '{'
      @values += '"jobId": ' + jobId.to_s + ','
      @values += '"height": ' + height.to_s + ','
      @values += '"width": ' + width.to_s + ','
      @values += '"distance": ' + distance.to_s + ','
      @values += '"async": true'
      @values += '}'
    end
  end
end
