class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :place
  after_create :send_comment_email

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

  def send_comment_email
    NotificationMailer.comment_added(self).deliver
  end
end
