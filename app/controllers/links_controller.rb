class LinksController < ApplicationController 
    before_action :set_link, only: [:show, :update, :destroy]

    def index
        @pagy, @links = pagy(Link.recent_first, items: 10)
        @link ||= Link.new
    rescue Pagy::OverflowError
        redirect_to root_path
    end
  
    def create 
      @link = Link.new(link_params)
      if @link.save
        respond_to do |format|
            format.html {redirect_to root_path }
            format.turbo_stream { render turbo_stream: turbo_stream.prepend("links", @link)}
        end
      else
        index
        render :index, status: :unprocessable_entity
      end
    end

    def show
    end
  
    def update
      if @link.update(link_params)
        redirect_to @link
      else
        render :edit, status: unprocessable_entity
      end
    end
  
    def destroy
      @link.destroy
      redirect_to root_path, notice: "Link has been deleted."
    end
  
    private 
  
    def link_params
      params.require(:link).permit(:url)
    end
  end