require "rails_helper"

RSpec.describe Notepad, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to have_many(:notepad_pages) }
  end
end
