# frozen_string_literal: true

require 'net/http'

class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_event, only: %i[edit update show destroy]
  before_action :set_category, only: %i[update]

  def index
    @events = search(search_params).all.page(params[:page]).per(params[:per_page]).order('event_date')
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to events_path, notice: t('event.event_created')
    else
      render :new, status: :unprocessable_entity, error: t('event.event_not_created')
    end
  end

  def edit; end

  def update
    return redirect_to events_path, error: t('event.foreign_category'), status: :unprocessable_entity unless @category

    if @event.update(event_params)
      redirect_to event_path(@event), notice: t('event.event_updated')
    else
      render :edit, status: :unprocessable_entity, error: t('event.event_not_updated')
    end
  end

  def show
    @weather = WeatherPresenter.new(new_weather_service, @event.event_date)
  end

  def destroy
    if @event.destroy
      redirect_to events_path, notice: t('event.event_deleted')
    else
      redirect_to events_path, error: t('event.event_not_deleted')
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :event_date, :description, :date_to_notificate, :category_id)
  end

  def find_event
    @event = Event.all.find(params[:id])
  end

  def set_category
    @category = current_user.categories.find_by(id: event_params[:category_id])
  end

  def search(search_params)
    SearchService.new(search_params:, user: current_user).call
  end

  def search_params
    params.permit(:name, :category_id)
  end

  def new_weather_service
    WeatherService.new(date: @event.event_date)
  end
end
