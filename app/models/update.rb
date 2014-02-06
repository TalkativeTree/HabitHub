class Update < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags

  validates_presence_of :content
  validates_presence_of :twilio_body
  validates_presence_of :duration
end
