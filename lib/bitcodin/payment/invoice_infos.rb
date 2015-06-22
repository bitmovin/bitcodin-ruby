module Bitcodin
  class InvoiceInfos

    attr_accessor :values

    def initialize(companyName, firstName, lastName, address, addressLineOptional, postalCode, city, country, vatNumber)
      @values = '{
        "companyName": "'         + companyName + '",
        "firstName": "'           + firstName + '",
        "lastName": "'            + lastName + '",
        "address": "'             + address + '",
        "addressLineOptional": "' + addressLineOptional + '",
        "postalCode": '           + postalCode.to_s + ',
        "city": "'                + city + '",
        "country": "'             + country + '",
        "vatNumber": "'           + vatNumber + '"
      }'
    end

  end
end
