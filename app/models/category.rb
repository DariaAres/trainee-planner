# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :user_categories, dependent: :destroy
  has_many :users, through: :user_categories

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
