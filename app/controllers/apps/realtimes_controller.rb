class Apps::RealtimesController < ApplicationController

	def index
		odr = params[:o]
		puts odr
		if odr== nil or odr.index('-') == -1
		  @messages = Message.all
		else
		  @messages = Message.where.order('#{odr} desc')
		end

		@total = Message.count
	end

	def new
		@messages = Message.new
	end

	def show
		
	end

	private
	def post_params
		params.require(:mesage).permit(:name,:code)
	end
end
