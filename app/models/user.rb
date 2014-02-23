class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :plan, dependent: :destroy
  has_many :updates, dependent: :destroy

  validates_presence_of   :email
  validates_uniqueness_of :email
  validates_format_of :email, with: /@/, on: :create

  phony_normalized_method :cellphone
  phony_normalize :cellphone, default_country_code: 'US'

  validates_uniqueness_of :cellphone
  validates :cellphone, phony_plausible: true, presence: true

  def on_trial?
    (Time.zone.now - self.created_at) < 7.days
  end

  def is_admin?
    self.email == 'siong1987@gmail.com' || 'benjamin.b2@gmail.com'
  end

  def in_my_time_zone(time)
    time.in_time_zone(self.time_zone)
  end

  def no_ongoing_activity?
    latest_update.already_happened?
  end

  private

  def get_first_update
    messenger.send_message_async(self.id, "Welcome")
  end
end

