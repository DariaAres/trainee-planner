# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_event, only: %i[edit update show destroy]
  before_action :set_category, only: %i[update]

  def index
    @events = current_user.events.all.page(params[:page]).per(params[:per_page]).order('event_date')
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
    unless @category
      return redirect_to events_path, error: t('event.foreign_category'),
                                      status: :unprocessable_entity
    end

    if @event.update(event_params)
      redirect_to event_path(@event), notice: t('event.event_updated')
    else
      render :edit, status: :unprocessable_entity, error: t('event.event_not_updated')
    end
  end

  def show; end

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
end
