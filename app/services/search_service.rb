# frozen_string_literal: true

class SearchService
  attr_reader :events

  def initialize(search_params:, user:)
    @search_params = search_params
    @events = user.events
  end

  def call
    return @events if @search_params.try(:empty?)

    @events.filtered_by_name("%#{@search_params[:name]}%").filtered_by_category(@search_params[:category_id].to_i)
  end
end
