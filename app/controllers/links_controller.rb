class LinksController < ApplicationController
  def index
    @links = Link.all
    
    render json: @links
  end

  def create
    @link = Link.create(create_params.merge(base_url: request.base_url))

    render json: @link
  end

  def destroy
    @link = Link.find_by(id: params[:id])

    if @link&.password == params[:password]
      @link.destroy
      head :no_content
    else
      render json: "not found", status: :not_found
    end
  end

  private

  def create_params
    params.permit(:original_url)
  end
end
