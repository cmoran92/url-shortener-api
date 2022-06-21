require 'securerandom'

class ShortenedUrl < ApplicationRecord
  before_validation :generate_short_link_slug, on: :create

  def self.for_full_url(full_url)
    find_by(full_url: full_url) || create!(full_url: full_url)
  end

  private

  def generate_short_link_slug
    while true
      self.short_link_slug = SecureRandom.alphanumeric(7)
      break unless ShortenedUrl.find_by short_link_slug: short_link_slug
    end
  end
end
