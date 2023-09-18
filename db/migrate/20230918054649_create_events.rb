# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.datetime :date, null: false
      t.text :description
      t.datetime :date_to_notificate
      t.belongs_to :category, null: false, foreign_key: { on_delete: :cascade }
      t.belongs_to :user, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
