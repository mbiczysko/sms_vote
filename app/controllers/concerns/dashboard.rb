class Dashboard

  include TableViewSortingMethods

  attr_accessor :per_page, :page, :data_set, :column, :direction, :campaign

  def initialize(params)
    self.per_page  = params[:per_page] || 10
    self.page      = params[:page]
    self.column    = params[:column]
    self.direction = params[:direction]
    self.campaign  = params[:campaign]
    self.data_set  = nil
    self.votes
  end

  def votes
    self.data_set ||= Vote.where(where_options).paginate(:page => @page, per_page: @per_page).order("#{sort_column} #{sort_direction}")
  end

  def where_options
    options = {}
    options.merge!(campaign: campaign) if campaign
    return options
  end

  def campaigns
    Vote.pluck(:campaign).uniq
  end

  def campaign_name
    self.votes.pluck(:campaign).uniq.first
  end

  def valid_votes
    self.votes.where(validity: 'during')
  end

  def choices
    self.valid_votes.pluck(:choice).uniq
  end

  def by_choice(choice)
    self.valid_votes.where(choice: choice)
  end

  private

  def sort_column
    sortable_columns.include?(@column) ? @column : "id"
  end

  def sort_direction
    %w[asc desc].include?(@direction) ? @direction : "asc"
  end

end