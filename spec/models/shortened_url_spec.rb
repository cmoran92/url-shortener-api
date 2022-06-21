require 'rails_helper'

RSpec.describe ShortenedUrl, type: :model do
  describe '.for_full_url' do
    it 'returns a new instance if there is no instance for this full URL' do
      ShortenedUrl.for_full_url 'https://www.google.com'
      expect(ShortenedUrl.count).to eq(1)
    end

    it 'returns the existing instance if there is an instance for this full URL' do
      existing_shortened_url = ShortenedUrl.create! full_url: 'https://www.google.com'
      new_shortened_url = ShortenedUrl.for_full_url 'https://www.google.com'
      expect(new_shortened_url.id).to eq(existing_shortened_url.id)
    end
  end
end
