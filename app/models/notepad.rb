# frozen_string_literal: true

class Notepad < ApplicationRecord
  has_many :notepad_pages
  
  validates :name, presence: true
end
