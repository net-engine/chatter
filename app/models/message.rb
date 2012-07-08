class Message < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content
  validates_presence_of :user, :content

  def timestamp
    localtime = created_at.in_time_zone('Brisbane')
    case created_at.yday
    when Date.today.yday
      localtime.strftime "%l:%M%P"
    when Date.today.yday - 1
      localtime.strftime "%l:%M%P yesterday"
    else
      localtime.strftime "%l:%M%P, %e %b"
    end
  end
end
