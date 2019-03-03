# frozen_string_literal: true

class AddDbStructure < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :role
      t.string :id_number

      t.timestamps
    end

    create_table :registries do |t|
      t.string :registry_type
      t.text :notes

      t.references :user

      t.timestamps
    end
  end
end
