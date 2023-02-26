# require 'active_record'

# # Establish a connection to your database
# ActiveRecord::Base.establish_connection(
#   adapter: 'sqlite3',
#   database: 'mydatabase.sqlite3'
# )

class User < ActiveRecord::Base
    # attr_accessor :name, :bio
    
    has_many :reviews
    has_many :products, through: :reviews 

    def favorite_product
        reviews.order(star_rating: :desc).first.product
      end
    
      def remove_reviews(product)
        reviews.where(product: product).destroy_all
      end
    
end 
class Product < ActiveRecord::Base
    # attr_accessor :name, :desc

    has_many :reviews
    has_many :users, through: :reviews
    
    def leave_review(user, star_rating, comment)
        Review.create!(user: user, product: self, star_rating: star_rating, comment: comment)
      end
    
      def print_all_reviews
        reviews.each do |review|
          review.print_review
        end
      end
    
      def average_rating
        reviews.average(:star_rating).to_f
      end
end 
class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :product

    def print_review
        puts "Review for #{product.name} by #{user.name}: #{star_rating}. #{comment}"
      end
    
      def user
        User.find(user_id)
      end
    
      def product
        Product.find(product_id)
      end
end 

allreviews = Review.all

puts Review.all