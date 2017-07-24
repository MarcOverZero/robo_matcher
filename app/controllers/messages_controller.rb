class MessagesController < ApplicationController
  def new

  end

  def create
    @user = User.find(params[:user_id])
    @message= current_user.messages.new(message_params)
    @message.save
    redirect_to "/users/#{@user.id}"
  end


  private

  def message_params
    params.require(:message).permit(:user_id, :recipient_id, :body)
  end
end
