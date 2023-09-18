# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :categories
  belongs_to :users
end
