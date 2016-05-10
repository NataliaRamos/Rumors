class LikesController < ApplicationController
  def unlike
    unlike = params[:rumor_id]
    unlikethis = Like.where(:user_id => session[:id],:rumor_id => unlike).first
    unless unlikethis.delete
      session[:notice] = 'Unable to delete!!'
    end
    redirect_to '/rumors'
  end

  def like
    puts params
    rumor = params[:rumor_id]
    Like.create(:user_id => session[:id],:rumor_id => rumor)
    redirect_to '/rumors'
  end

end
