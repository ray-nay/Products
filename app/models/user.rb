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