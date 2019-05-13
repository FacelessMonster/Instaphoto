class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :owner?, only: [:edit, :update, :destroy]
  def index
    @photos = Photo.all
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def edit
  end

  def create
    @photo = Photo.new(photo_params.merge(user_id: current_user.id))
      if @photo.save
        redirect_to @photo, notice: 'Photo was successfully created.'
      else
        render :new
      end
  end

  def update
      if @photo.update(photo_params)
        redirect_to @photo, notice: 'Photo was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @photo.destroy
      redirect_to photos_url, notice: 'Photo was successfully destroyed.'
  end

  private

    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:description, :image)
    end

    def owner?
      @photo = current_user.photos.find_by(id: params[:id])
      redirect_to photos_path, notice: "You do not have permission to edit this photo.." if @photo.nil?
    end
end
