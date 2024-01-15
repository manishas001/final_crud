class MphotoController < ApplicationController

    before_action :authenticate_owner! # Assuming authentication is required
    before_action :set_mblog
    before_action :set_photo, only: [:show, :edit, :update, :destroy]
  
    def index
      @photos = @mblog.photos
    end
  
    def show
    end
  
    def new
      @photo = @mblog.photos.new
    end
  
    def create
      @photo = @mblog.photos.new(photo_params)
  
      if @photo.save
        redirect_to mblog_photo_path(@mblog, @photo), notice: 'Photo was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @photo.update(photo_params)
        redirect_to mblog_photo_path(@mblog, @photo), notice: 'Photo was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @photo.destroy
      redirect_to mblog_photos_path(@mblog), notice: 'Photo was successfully destroyed.'
    end
  
    private
  
    def set_mblog
      @mblog = Mblog.find(params[:mblog_id])
    end
  
    def set_photo
      @photo = @mblog.photos.find(params[:id])
    end
    # app/controllers/mphotos_controller.rb
    def mphoto_params
    params.require(:mphoto).permit(:image, :other_attributes , :photos)
  end
    
    
        
    
    end
    
