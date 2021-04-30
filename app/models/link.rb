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

  def generate_shortened_url
    self.shortened_url = url_prefix + SecureRandom.hex(8)
  end

  def url_prefix
    base_url ? base_url : 'http://abc.de/'
  end
end
