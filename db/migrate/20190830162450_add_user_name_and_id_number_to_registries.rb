# frozen_string_literal: true

class AddUserNameAndIdNumberToRegistries < ActiveRecord::Migration[5.2]
  def change
    change_table :registries, bulk: true do |t|
      t.string :user_name
      t.string :user_id_number
    end
  end
end
