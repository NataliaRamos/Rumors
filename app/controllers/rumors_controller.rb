class RumorsController < ApplicationController
  def index
    @rumor = Rumor.all
  end

  def show
  end

  def create
    @errors_message = []
    @content = User.find(session[:id]).rumors.create(rumor_params)
    if @content.save
      flash[:success] = "New rumor added!"
      redirect_to "/users/#{session[:id]}"
    else
      errors_message = User.create(user_params).errors.full_messages
      render '/rumors/:id'
    end
  end

  def destroy
  end
  private
  def rumor_params
    params.require(:rumor).permit(:content)
  end
end
