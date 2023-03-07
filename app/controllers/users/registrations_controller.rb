# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  


  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    @user = User.new(sign_up_params)
    if @user.save
      for finance in ["食費", "外食費", "日用品", "交通費", "光熱費", "衣服", "趣味", "交際費", "その他", "給料" ] do
        @genre = Genre.new
        @genre[:g_name] = finance
        @genre[:user_id] = User.last.id
        @genre[:created_at] = Date.today
        @genre[:updated_at] = Date.today
        if finance == "給料"
          @genre[:status] = 2
        else
          @genre[:status] = 1
        end
        @genre.save
      end
      sign_in(:user, @user)
      redirect_to root_path
    else
      render :new
    end
  end


  private 
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
