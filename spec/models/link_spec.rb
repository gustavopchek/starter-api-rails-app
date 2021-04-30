require 'rails_helper'

RSpec.describe Link, type: :model do

  context "validations" do
    it { is_expected.to validate_presence_of :original_url }

    it { is_expected.to allow_value("http://abc.com").for(:original_url) }
    it { is_expected.not_to allow_value("abc.com").for(:original_url) }

    context "uniqueness" do
      subject { create(:link, original_url: 'http://abc.com', shortened_url: 'http://ab.cd', password: '12345') }

      it { is_expected.to validate_uniqueness_of :shortened_url }
    end
  end
end
