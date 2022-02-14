require 'spec_helper'

EXCEPTION_MESSAGE = "Separator does not exist"

RSpec.describe 'App Functional Test' do
  describe 'handling exception due to an unavailable separator' do
    let(:params) do
      {
        double_pipe_format: File.read('spec/fixtures/people_by_non_registered_separator.txt'),
        ampersand_format: File.read('spec/fixtures/people_by_ampersand.txt'),
        order: :first_name,
      }
    end
    let(:people_controller) { PeopleController.new(params) }

    it 'parses input files and outputs normalized data' do
      normalized_people = people_controller.normalize
      expect(normalized_people).to eq EXCEPTION_MESSAGE
    end
  end
end