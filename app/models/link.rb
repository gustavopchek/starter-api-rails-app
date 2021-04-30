class Link < ApplicationRecord
  validates :original_url, presence: true

  validates :original_url, format: /(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?/i
  validates :shortened_url, uniqueness: true

  before_save :generate_password
  before_save :generate_shortened_url

  attr_accessor :base_url

  private

  def generate_password
    self.password = SecureRandom.hex(8)
  end

  # there could be another way to do this here, storing the full url, or even storing the
  # prefix separately, to manage different domains
  def generate_shortened_url
    self.shortened_url = SecureRandom.hex(4)
  end
end
