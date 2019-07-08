module Bitcodin
	class VttHLSConfiguration
		attr_accessor :values

		def initialize(langShort, langLong, url)
			@values = '{
				"langShort": "' + langShort + '",
				"langLong": "' + langLong + '",
				"url": "' + url + '"
			}'
		end
	end
end