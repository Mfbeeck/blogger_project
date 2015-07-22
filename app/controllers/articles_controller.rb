class ArticlesController < ApplicationController
	include ArticlesHelper

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article.id
	end

	def new
		@article = Article.new
	end

	def create
		# @article = Article.new(title: params[:article][:title],body: params[:article][:body])
 		# or
 		# @article.title = params[:article][:title]
 		# @article.body = params[:article][:body]
 		# This isn't best because it's repetitive. You could do then:
 		# @article = Article.new(params[:article]) BUT THIS DOESNT WORK BC IT IS DANGEROUS TO JUST ACCEPT ANY PARAMS GIVEN, WE MUST SEPECIFY LIKE BELOW:
  		@article = Article.new(article_params) #look at new method, article_params in the helper file for articles to understand

  		@article.save
  		redirect_to article_path(@article)
		flash.notice = "The article \"#{@article.title}\" was successfully created."

	end
	
	def tag_list
		self.tags.collect do |tag|
			tag.name
		end.join(", ")
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
		flash.notice = "The article \"#{@article.title}\" was successfully deleted."

	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
  		@article.update(article_params)

		redirect_to articles_path
		flash.notice = "The article \"#{@article.title}\" was successfully updated."

	end

end
