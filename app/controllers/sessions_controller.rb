class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      session[:id] = user[:id]
      # Log the user in and redirect to the rumors page.
      redirect_to '/rumors'
    else
      # Create an error message.
      flash[:danger] = 'Invalid email/password combination'
      redirect_to "/sessions/new"
    end
  end
  def destroy
    puts "destroy getting here!!!"
    session[:user_id] = nil
    redirect_to '/sessions/new'
  end
end
