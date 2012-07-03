class Message < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content
  validates_presence_of :user, :content
end
