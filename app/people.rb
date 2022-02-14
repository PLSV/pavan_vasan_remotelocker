require 'date'

class People
	attr_reader :first_name, :city, :birthdate

	def initialize(first_name, city, birthdate)
		@first_name = first_name
		@city = city
		@birthdate = birthdate
	end

	def stringForm
		return "#{@first_name}, #{getFullForm()}, #{formatDate()}"
	end

	def formatDate
		return Date.parse(@birthdate).strftime("%-m/%-d/%Y")
	end

	def getFullForm
		if @city == "LA"
			return "Los Angeles"
		elsif @city == "NYC"
			return "New York City"
		else
			return @city
		end
	end
end