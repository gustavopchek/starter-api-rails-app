require "rails_helper"

RSpec.describe "ShortenedLinks", type: :request do
  describe "GET /index" do
    let!(:link_1) { create(:link) }

    context "with valid link param" do
      subject { get "/l/#{link_1.shortened_url}" }

      it "redirects to original url" do
        expect(subject).to redirect_to(link_1.original_url)
      end
    end

    context "with invalid link param" do
      subject { get "/l/abcd" }

      it "returns not found" do
        subject

        expect(response).to have_http_status(404)
      end
    end
  end
end
