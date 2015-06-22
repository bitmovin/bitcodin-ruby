module Bitcodin
  class TransferConfig

    attr_accessor :values

    def initialize(jobId, outputId)
      @values = '{
        "jobId": '     +  jobId.to_s + ',
        "outputId": '  + outputId.to_s + '
      }'
    end

  end
end

