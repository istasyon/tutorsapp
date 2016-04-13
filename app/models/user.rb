class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauthable

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?       
   
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  acts_as_messageable
  has_many :listings
  has_many :appointments
  has_many :reviews
  has_and_belongs_to_many :languages

  def mailboxer_email(object)
    nil
  end

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first

    if user 
      return user
    else
    	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.image = auth.info.image
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.password = Devise.friendly_token[0,20]
      end
    end
  end 

    def average_rating
      reviews.count == 0 ? 0 : reviews.average(:star).round(2)
    end 
end
