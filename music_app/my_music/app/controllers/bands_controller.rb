class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def create
    band = Band.new(band_params)

    if band.save
      redirect_to band_url(band)
    else
      flash.now[:errors] = band.errors.full_messages
      render :new
    end
  end

  def new
    @band = Band.new
    render :new
  end

  def edit
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end

  def update
  end

  def destroy
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
