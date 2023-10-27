class UserEventsService
  def initialize(user:)
    @user = user
  end

  def today
    user.events.where(event_date: DateTime.now..DateTime.now.end_of_day).count
  end

  def in_future
    user.events.where(event_date: DateTime.now..).count
  end

  private

  attr_reader :user
end
