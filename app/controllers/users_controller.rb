class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id).where('name LIKE(?)', "%#{params[:keyword]}%").limit(10)
    respond_to do |format|
      format.html
      format.json
    end
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
