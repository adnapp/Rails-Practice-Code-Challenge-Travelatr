class Destination < ApplicationRecord
    has_many :posts 
    has_many :bloggers, through: :posts
    
    def featured_post
        self.posts.max_by do |post|
            post.likes
        end
    end

    def blogger_average_age
        sum = self.bloggers.sum {|b| b.age}
        sum/self.bloggers.count
    end
end