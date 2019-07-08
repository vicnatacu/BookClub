class RelationshipsController < ApplicationController
  def create
    if current_user == nil
      flash[:alert] = "You must be logged in to do that"
      return redirect_to new_user_session_path
    end
    user = User.find(params[:user_id])
    if !current_user.following.include?(user)
    current_user.following.push(user) 
    flash[:alert] = "Your are now following #{user.name}"
    else 
      flash[:alert] = "You are already following #{user.name}"
    end

    if current_user.save
      
      return redirect_to books_path
    end
  end
end
