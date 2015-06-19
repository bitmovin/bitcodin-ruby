require 'bitcodin/version'
require 'rubygems' if RUBY_VERSION < '1.9'
require 'rest_client'

require 'bitcodin/input/http_input_config'
require 'bitcodin/output/s3_output_config'
require 'bitcodin/network/http'

module Bitcodin

  class BitcodinAPI

    def initialize(apiKey)
      @apiKey  = apiKey
      @apiURL  = 'http://portal.bitcodin.com/api/'
      @headers = {
          :content_type => 'application/json',
          :bitcodin_api_version => 'v1',
          :bitcodin_api_key => @apiKey
      }
      @httpClient = HTTP.new(@apiKey, @headers)
    end

    def getKey
      return @apiKey
    end

    # Input

    # Create a new Input, which will be analyzed and used for transcoding jobs.
    def createInput(inputConfig)
      url = @apiURL.concat('input/create')
      return @httpClient.sendRequest('post', url, inputConfig.values)
    end

    # An existing input will be analyzed again and a new thumbnail will be created.
    def analyzeInput(id)
      url = @apiURL.concat('input/').concat(id.to_s).concat('/analyze')
      return @httpClient.sendRequest('patch', url)
    end

    def listInput(page = nil)
      url = @apiURL.concat('inputs')
      if page.nil?
        return @httpClient.sendRequest('get', url)
      else
        url = url.concat('/').concat(page.to_s)
        return @httpClient.sendRequest('get', url)
      end
    end

    def getInputDetails(id)
      url = @apiURL.concat('input/').concat(id.to_s)
      return @httpClient.sendRequest('get', url)
    end

    def deleteInput(id)
      url = @apiURL.concat('input/').concat(id.to_s)
      return @httpClient.sendRequest('delete', url)
    end

    # Output

    def createS3Output(config)
      url = @apiURL.concat('output/create')
      return @httpClient.sendRequest('post', url, config.values)
    end

    def createGCSOutput(gcsOutputConfig)

    end

    def createFTPOutput(ftpOutputConfig)

    end

    def listOutputs(page = nil)

    end

    def getOutputDetails(id)

    end

    def deleteOutput(id)

    end

    # Encoding Profiles

    def createEncodingProfile(encodingProfile)

    end

    def listEncodingProfiles(page = nil)

    end

    def getEncodingProfile(id)

    end

    # Jobs

    def createJob(jobConfig)

    end

    def listAllJobs(page = nil)

    end

    def getJobDetails(id)

    end

    def getCurrentJobStatus(id)

    end

    def createTransferJob(transferConfig)

    end

    def listTransferJob(id)

    end

    # Statistics

    def getCurrentOutputStatus(from, to)

    end

    def getJobStatistics

    end

    # Paymant

    def updateInvoiceInfos(invoiceInfos)

    end

    def getInvoiceInfos

    end

    # Wallet

    def getWalletInformation

    end

    def getListOfAllDeposits

    end

    def getListOfAllBills

    end

  end

end
