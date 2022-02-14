require 'spec_helper'

RSpec.describe 'App Functional Test' do
  describe 'pipe and ampersand formats sorted by first_name' do
    let(:params) do
      {
        pipe_format: File.read('spec/fixtures/people_by_pipes.txt'),
        ampersand_format: File.read('spec/fixtures/people_by_ampersand.txt'),
        order: :first_name,
      }
    end
    let(:people_controller) { PeopleController.new(params) }

    it 'parses input files and outputs normalized data' do
      normalized_people = people_controller.normalize

      # Expected format of each entry: `<first_name>, <city>, <birthdate M/D/YYYY>`
      expect(normalized_people).to eq [
        'Chloe, Vancouver, 6/10/1994',
        'Colin, London, 4/30/1998',
        'Pamela, Munich, 1/5/1995',
        'Simone, Paris, 1/5/2000',
      ]
    end
  end
end