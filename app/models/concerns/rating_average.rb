module RatingAverage
    extend ActiveSupport::Concern
    
    
    def average_rating
        t = ratings.all
        t = t.map { |i| i.score + 0.0 } 
        ka = t.sum/ratings.count
        "#{ka}"
    end
   end