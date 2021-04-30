require "rails_helper"

RSpec.describe "Links", type: :request do
  describe "GET links" do
    let!(:link_1) { create(:link) }

    before { get "/links" }

    it "returns all links" do
      # subject

      expect(json_response.count).to eq(2)
    end
  end

  describe "POST links" do
    subject { post "/links", params: params }

    context "with valid params" do
      let(:params) { { original_url: "http://abc.de" } }

      it "creates a link" do
        expect do
          subject
        end.to change{ Link.count }.by(1)
  
        expect(json_response["password"]).to_not be_empty
      end
    end

    context "with invalid params" do
      let(:params) { { original_url: "abc.de" } }

      it "does not creates a link" do
        expect do
          subject
        end.to change{ Link.count }.by(0)
  
        expect(json_response["id"]).to be_nil
      end
    end
  end

  describe "DELETE /links/:id" do
    let(:link_1) { create(:link) }
    let(:params) { { password: link_1.password } }

    subject { delete "/links/#{link_1.id}", params: params }

    context "with valid params" do
      it "returns status code 204" do
        subject
  
        expect(response).to have_http_status(204)
      end
    end

    context "with invalid params" do
      shared_examples_for "not found" do
        it "returns not found" do
          subject
    
          expect(response).to have_http_status(404)
        end
      end

      context "with invalid id" do
        subject { delete "/links/999", params: params }

        it_behaves_like "not found"
      end

      context "with valid id but invalid password" do
        let(:params) { { password: "abcd" } }

        it_behaves_like "not found"
      end
    end
  end

  private

  def json_response
    JSON.parse(response.body)
  end
end
