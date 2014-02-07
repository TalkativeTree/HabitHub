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

end
