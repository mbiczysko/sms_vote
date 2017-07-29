module TableViewSortingMethods

  private

  def sortable_columns
    ["campaign", "choice", "validity"]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end