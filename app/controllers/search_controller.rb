class SearchController < ApplicationController
  def search
    query = params[:query]

    results = ::SearchService.search query

    render json: results
  end
end
