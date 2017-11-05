require 'rails_helper'

describe BookSearch, type: :service do
  describe '# methods' do
    it "get url should return 400 with no input" do
      VCR.use_cassette 'model/api_response' do
        bs = BookSearch.new
        hash = Hash.new(0)
        response = 0
        response = bs.get_url(hash)
        return_value = JSON.parse(response.get.body)
        expect(return_value["totalItems"]).to eq(0)
      end
    end
  end
end
