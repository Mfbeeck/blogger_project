class TagsController < ApplicationController
	before_filter :require_login, only: [:destroy]
	def show
  		@tag = Tag.find(params[:id])
	end
	
	def index
		@tags = Tag.all
	end
	
	def destroy
		@tag = Tag.find(params[:id])
		@tagging = Tagging.find(params[:id])
		@tagging.destroy
		@tag.destroy

		redirect_to tags_path
		flash.notice = "The tag \"#{@tag.name}\" was successfully deleted."

	end
end
