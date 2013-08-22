class WelcomeController < ApplicationController
  def index
    @user = User.new
  end

  def login
    if request.post?
      @user = User.authenticate(params[:user][:username], params[:user][:password])
      if @user
        session[:user_id]= @user.id
        redirect_to(controller:'home')
      else
        flash[:notice] = 'Name or password failed.'
      end
    end
  end
  
end
