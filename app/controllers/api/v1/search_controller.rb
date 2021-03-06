class Api::V1::SearchController < ApplicationController
  def search
    searched_results = PgSearch.multisearch("#{params["query"]}")
    if !searched_results.empty?
      results = searched_results.map do |result|
        PatientSerializer.new(Patient.find(result.searchable_id)) if result.searchable_type == "Patient"
      end
      render json: results, status: :ok
    else
      render status: :not_found
    end
  end

  private

  def search_params
    params.permit(:query)
  end
end
