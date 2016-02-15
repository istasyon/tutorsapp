class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauthable

  has_many :lessons, dependent: :destroy, 
              foreign_key: "student_id"
  has_many :reverse_lessons, dependent: :destroy, 
                  foreign_key: "teacher_id", 
                  class_name: "Lesson"
  has_many :students, through: :lessons
  has_many :teachers, through: :reverse_lessons


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
        user.password = Devise.friendly_token[0,20]
      end
    end
  end  
end
