class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create table :users do |t|
      t.string :name
      t.string :bio
      
  end
end
