class AuthorsController < ApplicationController
  def index
    @authors = Author.where("name like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.html
      format.json { render :json => @authors.map(&:attributes) }
    end
  end

  def search
    @authors = Author.search "name.autocomplete:#{params[:q]}"
    respond_to do |format|
      format.html
      format.json { render :json => @authors }
    end
  end
end
