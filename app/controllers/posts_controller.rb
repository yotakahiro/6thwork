class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]


  # add_breadcrumb '商品の詳細', post_path: :get

  # GET /posts
  # GET /posts.json
  def index
    add_breadcrumb '商品一覧', posts_path
    @posts = Post.page(params[:page]).per(50)
    @page = Post.page(params[:page]).per(50)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    add_breadcrumb '商品一覧', posts_path
    add_breadcrumb '商品の詳細'
  end

  # GET /posts/new
  def new
    @post = Post.new
    # @post.post_images.build

  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    add_breadcrumb '商品一覧', posts_path
    add_breadcrumb 'カテゴリーページ'

    # タグのフィルタリングにwhereが使えなかった。そして、リンクで飛ばしたパラメータでフィルタリングを試みたが、
    # パラメーターもうまくコントローラに飛ばすことができなかった。
    # そのため、リンク先にタグ名のページを作り、そのタグ名を利用してフィルタリングを行なった。
    @posts = Post.tagged_with(params[:category], :wild => true, :any => true)

    # タグと相性悪そう。カテゴリページに飛ばそうとすると、フィルタがザルになる。
    # @posts = Post.page(params[:page]).per(50)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :price, :description, :user_id, :category_list => [] , post_images_images: [])
    end

    def correct_user
      post = Post.find(params[:id])
      if current_user.id != post.user.id
        redirect_to root_path
      end
    end

end
