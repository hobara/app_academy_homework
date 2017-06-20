class ArtworkSharesController < ApplicationController

  def create
    artwork_share = ArtworkShare.new(artwork_share_params)
    if artwork_share.save
      render json: artwork_share
    else
      render json: artwork_share.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork_share = current_artwork_share
    if artwork_share
      artwork_share.destroy
      render json: artwork_share
    else
      render json: ["doesn't exist"]
    end
  end

  private

  def current_artwork_share
    ArtworkShare.find_by(id: params[:id])
  end

  def artwork_share_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end


end
