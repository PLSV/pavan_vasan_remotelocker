require_relative "normalizer"
require_relative "separator_error"

class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    begin
  	  crowd = Array.new
  	  object = Normalizer.new
  	  result = Array.new
      if @params.has_key?(:dollar_format)
	      crowd += object.normalize_separator_content @params[:dollar_format], :dollar_format
      end
      if @params.has_key?(:percent_format)
	      crowd += object.normalize_separator_content @params[:percent_format], :percent_format
      end
      if @params.has_key?(:double_pipe_format)
        crowd += object.normalize_separator_content @params[:double_pipe_format], :double_pipe_format
      end
      if @params.has_key?(:pipe_format)
        crowd += object.normalize_separator_content @params[:pipe_format], :pipe_format
      end
      if @params.has_key?(:ampersand_format)
        crowd += object.normalize_separator_content @params[:ampersand_format], :ampersand_format
      end
	    crowd.sort! { |a, b| a.first_name <=> b.first_name }
	    crowd.each do |people|
		    result.append(people.stringForm())
	    end
	    return result
    rescue SeparationUnavailableError => e
      return e.message
    end 
  end

  private

  attr_reader :params
end
