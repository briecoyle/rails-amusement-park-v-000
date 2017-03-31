class User < ActiveRecord::Base
  # write associations here

  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  after_initialize :set_default_role

  def mood
    mood = nil
    if self.happiness > self.nausea
      mood = "happy"
    else
      mood = 'sad'
    end
    mood
  end

  private
  def set_default_role
    self.admin ||= false
  end
end
