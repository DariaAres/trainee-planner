# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :events, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :email, presence: true, format: { with: /^[^@\s]+@[^@\s]+\.[^@\s]+$/, multiline: true }
  validates :password, presence: true, length: { within: 6..20 }
end
