class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.text :name, null: false

      t.timestamps null: false
    end
  end
end
