# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :category, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates :name, :date, presence: true
  validate :valid_date
  validate :valid_date_to_notificate, if: :date_present?

  def valid_date
    return if date.blank? || date.future?

    errors.add(:date, 'Date cannot be in the past')
  end

  def valid_date_to_notificate
    return if date_to_notificate.future? && (date_to_notificate < date)

    errors.add(:date_to_notificate, 'Mention of events cannot be later than their date')
  end

  def date_present?
    date_to_notificate.present?
  end
end
