class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.order("created_at desc").page(params[:page]).per_page(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
      format.js
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.new
    @comments = @post.comments.order("created_at desc").page(params[:page]).per_page(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
      format.js
    end
  end

  def message
    @post = Post.find(params[:id])
    @conversation = current_user.mailbox.conversations.where(:subject => @post.description)
    if @conversation.blank?
      redirect_to :controller => 'messages', :action => 'new', :post_description => @post.description, :post_userid => @post.user_id
    else
      redirect_to conversations_path
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.user_id = current_user.id
  end

  def votefor
    @post = Post.find(params[:id])
    @post.liked_by current_user
    redirect_to @post
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
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
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
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:description, :community_id, :image)
    end

end
