# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :name, :event_date, presence: true
  validate :date_cannot_be_in_the_past
  validate :mention_cannot_be_later_than_date, if: :date_to_notificate?
  validate :mention_cannot_be_in_the_past, if: :date_to_notificate?

  paginates_per 20

  private

  def date_cannot_be_in_the_past
    return if event_date.blank? || event_date.future?

    errors.add(:event_date, I18n.t('event.date_past'))
  end

  def mention_cannot_be_later_than_date
    return if date_to_notificate < event_date

    errors.add(:date_to_notificate, I18n.t('event.mention_future'))
  end

  def mention_cannot_be_in_the_past
    return if date_to_notificate.future?

    errors.add(:date_to_notificate, I18n.t('event.mention_past'))
  end
end
