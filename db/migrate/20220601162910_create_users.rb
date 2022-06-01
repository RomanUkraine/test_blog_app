class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.text :bio
      t.boolean :admin
      t.boolean :online

      t.timestamps
    end
  end
end
