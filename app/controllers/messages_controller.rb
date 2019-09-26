class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    # binding.pry
    # @messages = Message.group
    # @group = Group.find(params[group_id])
  end

  def create
  end
end
