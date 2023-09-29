# frozen_string_literal: true

require './app/services/user_events_service'

class HomeController < ApplicationController
  def index
    @events_counter = UserEventsService.new(user: current_user) if current_user
  end
end
