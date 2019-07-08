module Bitcodin
	class VttHLS
		attr_accessor :values

		def initialize(jobID, subtitleConfig)
			@values = '{'
			@values += '"jobId": ' + jobID.to_s + ','
			@values += '"subtitles": ['
			@values += subtitleConfig.map(&:values).join(",")
			@values += ']'
			@values += '}'
		end
	end
end