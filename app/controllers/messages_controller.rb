class MessagesController < ApplicationController
  
  before_action :set_group, only: [:index, :create]

  def index
    @groups = current_user.groups
    @message = Message.new
    @messages = @group.messages.includes(:user)
  end

  def create
    @groups = current_user.groups
    @message = Message.new(message_params)
    if  @message.save
      redirect_to group_messages_path(@group)
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください'
      render :index
    end 
  end

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
