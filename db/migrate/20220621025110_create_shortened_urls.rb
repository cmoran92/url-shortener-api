class CreateShortenedUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :shortened_urls do |t|
      t.string :full_url, null: false
      t.string :short_link_slug, null: false
      t.index :full_url, unique: true
      t.index :short_link_slug, unique: true

      t.datetime :created_at, null: false
    end
  end
end
