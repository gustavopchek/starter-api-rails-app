require 'rails_helper'

RSpec.describe NotepadPage, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:date) }

    it { is_expected.to belong_to(:notepad) }
  end
end
