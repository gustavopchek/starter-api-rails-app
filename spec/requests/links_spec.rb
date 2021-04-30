require 'rails_helper'

RSpec.describe "Links", type: :request do
  describe "GET links" do
    # let!(:link_1) { create(:link) }
    # let!(:link_2) { create(:link) }

    subject { get "/links" }

    it "returns all links" do
      subject
      
      # puts json_response.first

      # expect(json_response.first)["id"].to eq(id)
      expect(json_response.count).to eq(2)
    end
  end

  describe "POST links" do
    let(:params) { { original_url: "http://abc.de" } }

    subject { post "/links", params: params }

    it "creates a link correctly" do
      # expect do
        subject
      # end.to change{ Link.count }.by(1)

      puts json_response

      expect(json_response['password']).to_not be_empty
    end
  end

  private

  def json_response
    JSON.parse(response.body)
  end
end
