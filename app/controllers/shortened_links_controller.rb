class ShortenedLinksController < ApplicationController
  def index
    link = Link.find_by(shortened_url: params[:shortened_url])
    
    if link
      redirect_to link.original_url
    else
      render json: { error: "not found" }, status: :not_found
    end
  end
end
