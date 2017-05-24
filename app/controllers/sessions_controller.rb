class SessionsController < ApplicationController

  include SessionsHelper

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/users/#{@user.id}'
    else
      redirect_to '/login'
    end
  end

 def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
