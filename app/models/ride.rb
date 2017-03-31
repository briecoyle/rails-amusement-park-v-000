class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    @message = nil
    if user.tickets < attraction.tickets && user.height < attraction.min_height
      @message = "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      @message = "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif user.tickets < attraction.tickets
      @message = "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
      @message = "Thanks for riding the #{attraction.name}!"
    end
    @message
  end
end
