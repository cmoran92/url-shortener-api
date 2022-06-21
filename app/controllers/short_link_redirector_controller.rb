class ShortLinkRedirectorController < ApplicationController
  def redirect
    redirect_to ShortenedUrl.find_by(short_link_slug: params[:short_link_slug]).full_url, allow_other_host: true, status: 301
  end
end
