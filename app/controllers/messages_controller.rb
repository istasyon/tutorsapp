class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    chosen_recipient = User.find_by(id: params[:to].to_i) if params[:to]
    conversation = current_user.send_message(chosen_recipient, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end
end