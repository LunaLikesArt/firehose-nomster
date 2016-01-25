class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :place

  RATINGS = {
    'Poor'    => '1_star',
    'Fair'   => '2_stars',
    'Good' => '3_stars',
    'Very good'  => '4_stars',
    'Excellent'  => '5_stars'
  }

  def humanized_rating
  	RATINGS.invert[self.rating]
  end
end
