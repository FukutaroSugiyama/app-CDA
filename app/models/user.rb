class User < ApplicationRecord
    def sum_user_contentdistance(user_posts)
        user_total_distance = 0
        for var in user_posts do
            distance = var.content_distance
            user_total_distance += distance
        end
        return user_total_distance
    end
end
