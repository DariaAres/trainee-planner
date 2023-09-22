# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_event, only: %i[edit update show destroy]

  def index
    @events = Event.all.page(params[:page]).per(20)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)

    if @event.save
      flash[:success] = 'Created'
      redirect_to events_path
    else
      flash[:error] = 'Not created'
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to events_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show; end

  def destroy
    @event.destroy

    redirect_to events_path, status: :see_other
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :description, :date_to_notificate, :category_id, :user_id)
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
