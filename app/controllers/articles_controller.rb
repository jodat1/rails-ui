class ArticlesController < ApplicationController

    def homepage
    end

    def index

        @articles = Article.all

    end
    
    def new
        @article = Article.new
    end

    def edit

        @article = Article.find(params[:id])

    end

    def create
            # render plain: params[:article].inspect
            @article = Article.new(article_params)
            @article.user = User.first

            if @article.save
                flash[:notice] = "Article was successfully created"

                redirect_to article_path(@article)
            else
                render 'new'
            end 
            # @article.save
            # redirect_to article_path(@article)
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
          flash[:notice] = "Articlce was successfully updated"
          redirect_to article_path(@article)
        else
            render 'edit'
        end

    end

    def show

        @article = Article.find(params[:id])
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash[:notice] = "Article was deleted"
        redirect_to articles_path
    end

    private
        def article_params
            params.require(:article).permit(:title, :descritption)
        end

end