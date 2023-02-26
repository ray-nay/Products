class CreateReviews < ActiveRecord::Migration[6.1]
  def change
      create_table :reviews do |t|
        t.integer :star_rating
        t.string :comment
        t.belongs_to :user, null: false, foreign_key: true
        t.belongs_to :products, null: false, foreign_key: true
        
      end
  end
end
