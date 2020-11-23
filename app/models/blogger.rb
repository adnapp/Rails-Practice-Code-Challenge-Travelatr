class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, uniqueness: true
    validates :age, numericality: { greater_than_or_equal_to: 0,  only_integer: true }
    validates :bio, length: { minimum: 30}
    
    
    def number_likes
        self.posts.sum do |post|
            post.likes 
        end
    end

    def featured_post
        self.posts.max_by do |post|
            post.likes
        end
    end
end