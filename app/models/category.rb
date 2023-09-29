# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :user_categories, dependent: :destroy
  has_many :users, through: :user_categories
  has_many :events, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
