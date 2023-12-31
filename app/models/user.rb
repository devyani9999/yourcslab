class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable , :confirmable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :enrollments
  has_many :courses, through: :enrollments

  def display_name
    full_name.presence || "#{first_name} #{last_name}"
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first || where(email: auth.info.email).first
    # find_or_create_by!(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    #   user.email = auth.info.email
    #   user.password = Devise.friendly_token[0, 20]
    #   user.full_name = auth.info.name # assuming the user model has a name
    #   user.avatar_url = auth.info.image # assuming the user model has an image
    # end
  end

  def self.create_from_omniauth(auth)
    User.create!({
                  email: auth.info.email,
                  password: "helloworld",
                  full_name: auth.info.name,
                  avatar_url:  auth.info.image,
                  provider: auth.provider,
                  uid: auth.uid
                })
  end

  # def self.from_google(email:, uid: )
  #   find_or_create_by!(email: email, uid: uid, provider: 'google_oauth2')
  # end
end
