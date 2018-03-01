class ArticlesController < ApplicationController
  # before_action :validate_user, except: [:show, :index]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_article, except: [:index, :new, :create]
  # Get /articles
  def index
    @articles = Article.all
  end

  # Get /articles/:id
  def show
    @article.update_visits_count
    @comment = Comment.new
  end

  # Get /articles/new
  def new
    @article = Article.new
    @categories = Category.all.order(:name)
  end

  # Post /articles
  def create
    if user_signed_in?
      @article = current_user.articles.new(article_params)
      @article.categories = params[:categories]
      if @article.save
        flash[:success] = 'Articulo creado exitosamente.'
        redirect_to @article
      else
        flash[:error] = @article.errors.full_messages.to_sentence
        render :new
      end
    end
  end

  # Delete /articles/:id
  def destroy
    @article.destroy
    flash[:success] = 'Articulo eliminado exitosamente.'
    redirect_to articles_path
  end

  # Put /article/:id
  def update
    if @article.update(article_params)
      flash[:success] = 'Artículo actualizado exitosamente.'
      redirect_to @article
    else
      render :edit
    end
  end

  def edit
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :cover, :categories)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def validate_user
    redirect_to new_user_session_path, alert: 'Debes iniciar sesión o registrarte antes de continuar...'
  end
end
