class MblogController < ApplicationController
    before_action :authenticate_owner!

    before_action :set_blog, only: [:edit,:update,:destroy]

    
    def index
            @blog= Mblog.all
            
    end


    def new
        @blog = Mblog.new
        # @photo = @blog.photos.new

    end

    def create
        @blog = current_owner.mblog.build(blog_params)
        # @photo = @blog.photos.new(photo_params)
        
        if @blog.save
            redirect_to mblog_index_path, notice:'blog was sucessfully created'
        else
            render:new
        end
    end


    def edit
        # redirect_to edit_mblog_path, notice:'blog was sucessfully created'

                
    end
    def update
        # redirect_to mblog_index_path, alert: 'acess denied' unless current_owner == @blog.user
        
        if @blog.update(blog_params)
            redirect_to mblog_index_path,notice: 'blog was sucessfully updated'
        else
            render :edit
        end

    end


    def destroy
        # @blog = Bloguser.find(params[:id])
        @blog.delete
      
        redirect_to mblog_path, notice: 'Blog was successfully destroyed.'
    end

    

        private
        def set_blog
            @blog =Mblog.find(params[:id])
            # @mphotos = @blog.mphoto

            
        end
        # def set_photo
        #     @photo = @mblog.photos.find(params[:id])
        #   end
          # app/controllers/mphotos_controller.rb
          def mphoto_params
            

          params.require(:mphoto).permit(:photos [])
        end
    
        
    
        def blog_params
            params.require(:mblog).permit(:name, :title, :description, photos: [])
          end
    
            
    


end
