class TopController < ApplicationController

  def index
    @books = Book.all
  end


  def search
    @books = Book.where('title LIKE(?)',"%#{search_params[:keyword]}%").order('title ASC').limit(20)
  end


  private
  def search_params
    params.permit(:keyword)
  end
end
