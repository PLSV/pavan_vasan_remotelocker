require_relative "people"
require_relative "separator_error"

class Normalizer

	BIRTHDATE = "birthdate"
	CITY = "city"
	FIRST_NAME = "first_name"

	SEPARATOR_MAP = Hash[
		:dollar_format => '$', 
		:percent_format => '%',
		:pipe_format => '|',
		:ampersand_format => '&'
	]

	def normalize_separator_content(contents, split_param)
		begin
			if !SEPARATOR_MAP.has_key?(split_param)
				raise SeparationUnavailableError, "Separator does not exist"
			end
			separator = SEPARATOR_MAP[split_param]
			contentsArray = contents.split("\n")
			attributesMap = Hash.new
			crowd = Array.new
			contentsArray[0].split(separator).collect{|x| x.strip}.each_with_index {|val, index| attributesMap[val] = index }
   			contentsArray[1...].each do |i|
   				properties = i.split(separator, attributesMap.length()).collect{|x| x.strip}
   				crowd.append(People.new(properties[attributesMap[FIRST_NAME]], properties[attributesMap[CITY]], properties[attributesMap[BIRTHDATE]]))
			end
			return crowd
		end
	end

end