class UserEventsService
  def initialize(user:)
    @user = user
  end

  def today
    count_events_today_for_user
  end

  def in_future
    count_events_in_future_for_user
  end

  private

  attr_reader :user

  def count_events_today_for_user
    user.events.where(event_date: Time.now..Time.now.end_of_day).count
  end

  def count_events_in_future_for_user
    user.events.where(event_date: DateTime.now..).count
  end
end
