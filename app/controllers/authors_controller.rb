class AuthorsController < ApplicationController
  def index
    @authors = Author.where("name like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.html
      format.json { render :json => @authors.map(&:attributes) }
    end
  end

  def search
    @authors = Article.search params[:q]
    respond_to do |format|
      format.html
      format.json { render :json => @authors }
    end
  end
end
