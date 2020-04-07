class Movie < ApplicationRecord
  
   has_many :reviews    
   
   def release_date_1930_or_later
       if release_date < Date.parse('1 Jan 1930')
        errors.add(:release_date, 'Date must be at least 1930')
       end
    end


    def grandfathered?
        release_date && release_date < Date.parse('1 Jan 1968')
    end
   

    validates :title, :presence => true
    validates :rating, :inclusion => {:in => %w[G PG PG-13 R NC-17]},
      :unless => :grandfathered? 
        
    validates :release_date, :presence => true

    validate :release_date_1930_or_later

end
