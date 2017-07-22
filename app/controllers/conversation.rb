class ConverastionController < ApplicationController

  def show
    # if Conversation.where(sender_id: current_user.id, recipient_id: @user.id).present?
    #   @conversation = Conversation.where(sender_id: current_user.id, recipient_id: @user.id).first
    # elsif Conversation.where(sender_id: @user.id, recipient_id: current_user.id).present?
    #   @conversation = Conversation.where(sender_id: @user.id, recipient_id: current_user.id).first
    # else
      @conversation = Conversation.create(sender_id: current_user.id, recipient_id: @user.id)
    # end
  end
end
