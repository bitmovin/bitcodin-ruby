require 'bitcodin/version'
require 'rubygems' if RUBY_VERSION < '1.9'
require 'rest-client'

require 'bitcodin/input/http_input_config'
require 'bitcodin/output/output_type'
require 'bitcodin/output/s3_region'
require 'bitcodin/output/s3_output_config'
require 'bitcodin/output/gcs_output_config'
require 'bitcodin/output/ftp_output_config'
require 'bitcodin/media/encoding_profile'
require 'bitcodin/media/preset'
require 'bitcodin/media/profile'
require 'bitcodin/media/audio_stream_config'
require 'bitcodin/media/video_stream_config'
require 'bitcodin/job/job'
require 'bitcodin/job/manifest_type'
require 'bitcodin/transfer/transfer_config'
require 'bitcodin/payment/invoice_infos'
require 'bitcodin/network/http'
require 'bitcodin/job/drm_configuration'
require 'bitcodin/job/hls_encryption_configuration'
require 'bitcodin/job/audio_meta_data_configuration'
require 'bitcodin/job/video_meta_data_configuration'
require 'bitcodin/job/location'

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

    def createGCSOutput(config)
      url = @apiURL.concat('output/create')
      return @httpClient.sendRequest('post', url, config.values)
    end

    def createFTPOutput(config)
      url = @apiURL.concat('output/create')
      return @httpClient.sendRequest('post', url, config.values)
    end

    def listOutputs(page = nil)
      url = @apiURL.concat('outputs')
      if page.nil?
        return @httpClient.sendRequest('get', url)
      else
        url = url.concat('/').concat(page.to_s)
        return @httpClient.sendRequest('get', url)
      end
    end

    def getOutputDetails(id)
      url = @apiURL.concat('output/').concat(id.to_s)
      return @httpClient.sendRequest('get', url)
    end

    def deleteOutput(id)
      url = @apiURL.concat('output/').concat(id.to_s)
      return @httpClient.sendRequest('delete', url)
    end

    # Encoding Profiles

    def createEncodingProfile(config)
      url = @apiURL.concat('encoding-profile/create')
      return @httpClient.sendRequest('post', url, config.values)
    end

    def listEncodingProfiles(page = nil)
      url = @apiURL.concat('encoding-profiles')
      if page.nil?
        return @httpClient.sendRequest('get', url)
      else
        url = url.concat('/').concat(page.to_s)
        return @httpClient.sendRequest('get', url)
      end
    end

    def getEncodingProfile(id)
      url = @apiURL.concat('encoding-profile/').concat(id.to_s)
      return @httpClient.sendRequest('get', url)
    end

    def deleteEncodingProfile(id)
      url = @apiURL.concat('encoding-profile/').concat(id.to_s)
      return @httpClient.sendRequest('delete', url)
    end

    # Jobs

    def createJob(config)
      url = @apiURL.concat('job/create')
      response = @httpClient.sendRequest('post', url, config.values)
      return response
    end

    def listAllJobs(page = nil)
      url = @apiURL.concat('jobs')
      if page.nil?
        return @httpClient.sendRequest('get', url)
      else
        url = url.concat('/').concat(page.to_s)
        return @httpClient.sendRequest('get', url)
      end
    end

    def getJobDetails(id)
      url = @apiURL.concat('job/').concat(id.to_s)
      return @httpClient.sendRequest('get', url)
    end

    def getCurrentJobStatus(id)
      url = @apiURL.concat('job/').concat(id.to_s).concat('/status')
      return @httpClient.sendRequest('get', url)
    end

    def createTransferJob(config)
      url = @apiURL.concat('job/transfer')
      return @httpClient.sendRequest('post', url, config.values)
    end

    def listTransferJob(id)
      url = @apiURL.concat('job/').concat(id.to_s).concat('/transfers')
      return @httpClient.sendRequest('get', url)
    end

    def deleteJob(id)
      url = @apiURL.concat('job/').concat(id.to_s)
      return @httpClient.sendRequest('delete', url)
    end

    # Statistics

    def getCurrentOutputStatus
      url = @apiURL.concat('statistics')
      return @httpClient.sendRequest('get', url)
    end

    def getJobStatistics(from, to)
      url = @apiURL.concat('statistics/jobs/').concat(from.to_s).concat('/').concat(to.to_s)
      return @httpClient.sendRequest('get', url)
    end

    # Payment

    def updateInvoiceInfos(infos)
      url = @apiURL.concat('payment/invoiceinfo')
      puts infos.values
      return @httpClient.sendRequest('post', url, infos.values)
    end

    def getInvoiceInfos
      url = @apiURL.concat('payment/invoiceinfo')
      return @httpClient.sendRequest('get', url)
    end

    # Wallet

    def getWalletInformation
      url = @apiURL.concat('payment/user')
      return @httpClient.sendRequest('get', url)
    end

    def getListOfAllDeposits(page = nil)
      url = @apiURL.concat('payment/deposits')
      if page.nil?
        return @httpClient.sendRequest('get', url)
      else
        url = url.concat('/').concat(page.to_s)
        return @httpClient.sendRequest('get', url)
      end
    end

    def getListOfAllBills(page = nil)
      url = @apiURL.concat('payment/bills')
      if page.nil?
        return @httpClient.sendRequest('get', url)
      else
        url = url.concat('/').concat(page.to_s)
        return @httpClient.sendRequest('get', url)
      end
    end

  end
end
