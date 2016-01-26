class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :place

  RATINGS = {
    'Excellent'  => '5_stars',
    'Very good'  => '4_stars',
    'Good'       => '3_stars',
    'Fair'       => '2_stars',
    'Poor'       => '1_star'
  }

  def humanized_rating
  	RATINGS.invert[self.rating]
  end
end
