class Api::V1::SearchController < ApplicationController
  def search
    results = PgSearch.multisearch("#{params["query"]}")
    
  end

  private

  def search_params
    params.permit(:query)
  end
end
