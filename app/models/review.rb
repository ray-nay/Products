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