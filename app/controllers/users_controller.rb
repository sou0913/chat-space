class UsersController < ApplicationController
  def edit

  end

  def update
    user = User.find(current_user.id)
    user.update(update_params)
    redirect_to action: 'index', controller: 'messages'
  end

  private
  def update_params
    params.require(:user).permit(:name, :email)
  end
end
