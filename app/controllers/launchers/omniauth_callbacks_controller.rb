class Launchers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    puts "==============#{request.env["omniauth.auth"]}==================="
    @launcher = Launcher.from_omniauth(request.env["omniauth.auth"])
    if @launcher.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @launcher, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_launcher_registration_url
    end
  end

  def facebook
    @launcher = Launcher.from_omniauth(request.env["omniauth.auth"])
    puts "==============#{request.env["omniauth.auth"]}==================="
    if @launcher.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @launcher, :event => :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_launcher_registration_url
    end
  end
  
  def failure
    redirect_to root_path
  end
end