class WikisController < ApplicationController
    
   def index
       @user = current_user
       @wikis = @user.wikis.all
       render :index
   end
  
  def show
  #    @some_user = User.find(params[:user_id])
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
   
  def edit
      @wiki = Wiki.find(params[:id])
      render :edit
  end

  def update
     @wiki = Wiki.find(params[:id])
     @wiki.title = params[:wiki][:title]
     @wiki.body = params[:wiki][:body]
 
     if @wiki.save
       flash[:notice] = "Post was updated."
       redirect_to [@wiki]
     else
       flash.now[:alert] = "There was an error saving the wiki. Please try again."
       render :edit
     end
     
  end

  def destroy
     @wiki = Wiki.find(params[:id])
 
     if @wiki.destroy
       flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
       redirect_to welcome_index_path
     else
       flash.now[:alert] = "There was an error deleting the wiki."
       render :show
     end
  end
end
