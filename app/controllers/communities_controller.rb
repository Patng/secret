class CommunitiesController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  before_action :set_community, only: [:show, :edit, :update, :destroy, :join]

  # GET /communities
  # GET /communities.json
  def index
    @communities = Community.order("created_at desc").page(params[:page]).per_page(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @communities }
      format.js
    end
  end

  # GET /communities/1
  # GET /communities/1.json
  def show
    @community = Community.find(params[:id])
    @posts = @community.posts.order("created_at desc").page(params[:page]).per_page(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @communities }
      format.js
    end
  end

  # GET /communities/new
  def new
    @categories = Category.all
    @locations = Location.all
    @community = Community.new
    @community.admin_id = current_user.id
    
  end

  # GET /communities/1/edit
  def edit
  end

  def join
    if current_user.communities.exists?@community
      current_user.communities.delete(@community)
      redirect_to @community
    else
      current_user.communities << @community
      redirect_to @community
    end
  end

  # POST /communities
  # POST /communities.json
  def create
    @community = Community.new(community_params)
    @categories = Category.all
    @locations = Location.all
    @community.admin_id = current_user.id
    current_user.communities << @community
    

    respond_to do |format|
      if @community.save
        format.html { redirect_to @community, notice: 'Community was successfully created.' }
        format.json { render action: 'show', status: :created, location: @community }
      else
        format.html { render action: 'new' }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /communities/1
  # PATCH/PUT /communities/1.json
  def update
    respond_to do |format|
      if @community.update(community_params)
        format.html { redirect_to @community, notice: 'Community was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communities/1
  # DELETE /communities/1.json
  def destroy
    @community.destroy
    respond_to do |format|
      format.html { redirect_to communities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community
      @community = Community.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_params
      params.require(:community).permit(:description, :intro, :location_id, :cover, :category_id)
    end
end
