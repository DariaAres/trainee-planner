# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @events_counter = UserEventsService.new(user: current_user) if current_user
  end
end
