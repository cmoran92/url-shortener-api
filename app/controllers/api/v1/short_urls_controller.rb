class Api::V1::ShortUrlsController < ApplicationController
  def create
    shortened_url = ShortenedUrl.for_full_url params[:full_url]
    render json: { short_url: short_link_redirector_url(short_link_slug: shortened_url.short_link_slug) }
  end

  def show
    shortened_url = ShortenedUrl.find_by(short_link_slug: params[:short_link_slug])
    render json: { full_url: shortened_url.full_url, created_at: shortened_url.created_at }
  end
end
