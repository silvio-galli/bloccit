class AdvertisementsController < ApplicationController
  def index
  	@advertisements = Advertisement.all
  end

  def show
  	@advertisement = Advertisement.find(params[:id])
  end

  def new
  	@advertisement = Advertisement.new
  end

  def create
  	@advertisement = Advertisement.new
  	@advertisement.title = params[:post][:title]
  	@advertisement.copy = params[:post][:copy]
  	@advertisement.price = params[:post][:price]

  	if @advertisement.save
  		flash[:notice] = "The advertisment was successfully saved."
  		redirect_to @advertisement
  	else
  		flash[:error] = "Something went wrong and the new advertisement wasn't saved."
  		render :new
    end
  end
end
