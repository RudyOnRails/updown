class Question < ActiveRecord::Base
  attr_accessible :title, :user_id

  validates :title, :presence => true
  validates_uniqueness_of :title

  belongs_to :user

  updown_able

end
