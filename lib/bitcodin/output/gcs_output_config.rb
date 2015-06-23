module Bitcodin
  class GCSOutputConfig

    attr_accessor :TYPE, :values

    def initialize(name, accessKey, secretKey, bucket, prefix = '', makePublic = 'false')
      @TYPE   = OutputType::GCS

      @values = '{
        "type": "'       + @TYPE + '",
        "name": "'       + name + '",
        "accessKey": "'  + accessKey + '",
        "secretKey": "'  + secretKey + '",
        "bucket": "'     + bucket + '",
        "prefix": "'     + prefix + '",
        "makePublic": '  + makePublic + '
      }'
    end

  end
end
