class MessagesController < ApplicationController

  skip_before_filter :verify_authenticity_token
  before_filter :check_weixin_legality

  def auth
    puts 'in auth method.'
  end

  def reply_text
    puts 'in reply text.'
    if params[:xml][:MsgType] == "text"
      render "echo", :formats => :xml
    end
  end

  private
  def check_weixin_legality
    array = [Rails.configuration.weixin_token, params[:timestamp], params[:nonce]].sort
    render :text => "Forbidden", :status => 403 if params[:signature] != Digest::SHA1.hexdigest(array.join)
  end

end
