class WelcomeController < ApplicationController

  include TableViewSortingMethods

  helper_method :sort_column, :sort_direction

  def index
    @dashboard = Dashboard.new(params)
  end

  def by_campaign
    @dashboard = Dashboard.new(params)
  end

  private
    def sortable_columns
      ["campaign", "choice", "validity"]
    end

    def sort_column
      sortable_columns.include?(params[:column]) ? params[:column] : "campaign"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
