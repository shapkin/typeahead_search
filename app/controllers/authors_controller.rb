class AuthorsController < ApplicationController
  def index
    @authors = Author.where("name like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.html
      format.json { render :json => @authors.map(&:attributes) }
    end
  end

  def search
    #@authors = search_by params[:q]
    @authors = Author.search "name.autocomplete:#{params[:q]}"
    respond_to do |format|
      format.html
      format.json { render :json => @authors }
    end
  end

  private

    #def search_by(query)
    #  Author.tire.search(load: true) do
    #    query { string query, default_operator: "AND" } if query.present?
    #    sort { by :name, "asc" } if query.blank?
    #  end
    #end
end
