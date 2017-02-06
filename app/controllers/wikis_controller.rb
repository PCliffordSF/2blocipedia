class WikisController < ApplicationController
    
#   def index
#       @wikis = Wiki.all
#       render :index
#   end
  
  def show
      @wiki = Wiki.find(params[:id])
      render :show
  end
  
  def new
      @wiki = Wiki.new
      render :new
  end

   def create
       
     @wiki = Wiki.new
     @wiki.title = params[:wiki][:title]
     @wiki.body = params[:wiki][:body]
     @wiki.user = current_user

     if @wiki.save

       flash[:notice] = "The wiki was saved."
       redirect_to @wiki
     else

       flash.now[:alert] = "There was an error saving the wiki. Please try again."
       render :new
     end
   end

  def update
  end

  def edit
  end

  def destroy
  end




end
