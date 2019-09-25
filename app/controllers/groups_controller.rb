class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    # Group.create
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
    # params.permit(:name, )
  end
  
  def update_params
    # params.permit(:name, :)
  end

end
