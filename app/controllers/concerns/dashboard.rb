class Dashboard

  include TableViewSortingMethods

  attr_accessor :per_page, :page, :data_set, :column, :direction

  def initialize(params)
    self.per_page  = params[:per_page] || 10
    self.page      = params[:page]
    self.column    = params[:column]
    self.direction = params[:direction]
    self.data_set  = nil
    self.votes
  end

  def votes
    self.data_set ||= Vote.where(where_options).paginate(:page => @page, per_page: @per_page).order("#{sort_column} #{sort_direction}")
  end

  def where_options
    options = {}
    return options
  end

  def campaigns
    Vote.pluck(:campaign).uniq
  end

  private

  def sort_column
    sortable_columns.include?(@column) ? @column : "id"
  end

  def sort_direction
    %w[asc desc].include?(@direction) ? @direction : "asc"
  end

end