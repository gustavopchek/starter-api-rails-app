# frozen_string_literal: true

class NotepadPage < ApplicationRecord
  belongs_to :notepad

  validates :name, :date, presence: true
end
