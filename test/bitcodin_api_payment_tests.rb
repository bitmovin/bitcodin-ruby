require 'test/unit'
require 'bitcodin'
require 'json'
require 'coveralls'
Coveralls.wear!


module Bitcodin

  class ResponseCodes

    GET    = 200
    POST   = 200
    DELETE = 204
    PATCH  = 200

  end

  class BitcodinApiPaymentTests < Test::Unit::TestCase

    def setup
      # read access information (e.g. api key, etc.) from file
      file         = File.read('test/resources/settings.json')
      data         = JSON.parse(file)
      apiKey       = data['apikey']

      # create new bitcodinAPI instance
      @bitcodinAPI = BitcodinAPI.new(apiKey)

      # create invoice info
      @invoiceInfo = InvoiceInfos.new('bitmovin Gmbh', 'Stefan', 'Lederer', 'Lakeside', 'B01', '9020', 'Klagenfurt', 'Austria', 'ATU68021428')
    end

    def test_updateInvoiceInfos
      response = @bitcodinAPI.updateInvoiceInfos(@invoiceInfo)
      assert_equal(response.code, ResponseCodes::POST)
    end

    def test_getInvoiceInfos
      response = @bitcodinAPI.getInvoiceInfos
      assert_equal(response.code, ResponseCodes::GET)
    end

    def teardown
      ## Nothing up to now
    end

  end
end
