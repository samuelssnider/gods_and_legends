require 'rails_helper'

describe BookSearch, type: :service do
  describe '# methods' do
    it "get url should return 400 with no books" do
      VCR.use_cassette 'model/empty_get_url' do
        bs = BookSearch.new
        hash = Hash.new("dnskjfadnskjnfdj")
        response = 0
        response = bs.get_url(hash)
        return_value = JSON.parse(response.body)
        expect(return_value["totalItems"]).to eq(0)
      end
    end
    it "get url should return 500 results with a category of mythology param" do
      VCR.use_cassette 'model/mythology_category_get_url' do
        bs = BookSearch.new
        hash = {title: "a",subject: "Mythology"}
        response = 0
        response = bs.get_url(hash)
        return_value = JSON.parse(response.body)
        expect(return_value["kind"]).to eq("books#volumes")
        expect(return_value["totalItems"]).to_not eq(0)
      end
    end
  end
end
