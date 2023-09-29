# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_categories, dependent: :destroy
  has_many :categories, through: :user_categories
  has_many :events, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :email, presence: true, format: { with: /^[^@\s]+@[^@\s]+\.[^@\s]+$/, multiline: true }
  validates :password, presence: true, length: { within: 6..20 }
end
