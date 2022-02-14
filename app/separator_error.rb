class SeparationUnavailableError < StandardError
	def message
		"Separator does not exist"
	end
end