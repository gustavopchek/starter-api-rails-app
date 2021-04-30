class LinksController < ApplicationController
  def index
    @links = Link.all
    
    render json: @links
  end

  def create
    @link = Link.create(link_params.merge(base_url: request.base_url))

    render json: @link
  end

  def delete
  end

  private

  def link_params
    params.permit(:original_url)
  end
end
