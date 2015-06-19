module Bitcodin
  class S3OutputConfig

    attr_accessor :TYPE, :values

    def initialize(name, region, accessKey, secretKey, bucket, prefix = '', makePublic = 'false')
      @TYPE       = 's3'

      @values = '{
        "type": "'       + @TYPE + '",
        "name": "'       + name + '",
        "region": "'     + region + '",
        "accessKey": "'  + accessKey + '",
        "secretKey": "'  + secretKey + '",
        "bucket": "'     + bucket + '",
        "prefix": "'     + prefix + '",
        "makePublic": "' + makePublic + '"
      }'
    end

  end
end
