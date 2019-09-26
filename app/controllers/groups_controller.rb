class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(create_params)
    # binding.pry
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def edit
    # group = Group.find(params[:id])
    # @group_name = group.name
    # @user = group.users.name
  end

  def update

  end
  
  private

  def create_params
    params.require(:group).permit(:name, {user_ids: []})
  end
  
  def update_params
    # params.permit(:name, :)
  end

end
