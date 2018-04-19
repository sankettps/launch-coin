class Launcher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable,:omniauthable, :omniauth_providers => [:google_oauth2,:facebook]
  has_many :coin_icos, dependent: :destroy 
  has_many :comments, dependent: :destroy 
  has_many :ratings, dependent: :destroy 
  
  def self.from_omniauth(access_token)
	  data = access_token.info
	  launcher = Launcher.where(:email => data["email"]).first

	  unless launcher
	    password = Devise.friendly_token[0,20]
	    launcher = Launcher.create(email: data["email"],password: password, password_confirmation: password,first_name: data["first_name"],last_name: data["last_name"],provider: access_token.try(:provider),uid: access_token.try(:uid))
	    launcher.skip_confirmation!
	  end
	  launcher
	end

	def name
		"#{first_name || ''} #{last_name || ''}"
	end
end
