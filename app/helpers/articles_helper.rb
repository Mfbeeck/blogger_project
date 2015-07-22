module ArticlesHelper
	def article_params
  		params.require(:article).permit(:title, :body, :created_at, :updated_at, :tag_list)
	end
end
