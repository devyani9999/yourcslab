class UsersHomeController < ApplicationController
  layout 'user_layout'
  def dashboard
    user_id = params[:id]
    @user = User.find_by(id: user_id)
    @enrolled_courses = @user.courses
    # render(:layout => "user_layout")
  end

  def get_profile
    user_id = params[:id]
    @user = User.find_by(id: user_id)
  end

  def update_profile
    user_id = params[:id]
    @user = User.find_by(id: user_id)
    profile_params = update_profile_params
    if profile_params["password"].blank? || profile_params["password_confirmation"].blank?
      profile_params.delete("current_password")
      profile_params.delete("password")
      profile_params.delete("password_confirmation")
      @user.update(profile_params)
      redirect_to get_user_profile_path(@user.id)
    elsif profile_params["current_password"].present? && profile_params["password"].present? &&
      profile_params["password_confirmation"].present? &&
      profile_params["password"] == profile_params["password_confirmation"]
      if @user.valid_password?(params["current_password"])
        @user.reset_password(profile_params["password"], profile_params["password_confirmation"])
      end
      profile_params.delete("current_password")
      profile_params.delete("password")
      profile_params.delete("password_confirmation")
      @user.update(profile_params)
      redirect_to root_path
    end
  end

  private

  def update_profile_params
    params.permit("first_name", "last_name", "institute", "position", "phone", "email",
                  "address", "current_password", "password", "password_confirmation")
  end

end
