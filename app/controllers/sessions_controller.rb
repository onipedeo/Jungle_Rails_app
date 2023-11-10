class SessionsController < ApplicationController
  def new
  end

  def create
     user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     flash[:notice] = "Successfully logged in as #{user.first_name}"
     redirect_to '/'
    else
      flash.now[:alert] = "User not found"
      render 'new'
    end
end

  def destroy
    session[:user_id] = nil
    flash.now[:alert] = "Logged Out successfully"
    redirect_to '/login'
  end
end
