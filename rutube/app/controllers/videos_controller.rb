class VideosController < ApplicationController
  before_action :authenticate_user!, onlyy: [:create, :new, :update, :destroy, :edit]
  before_action :set_video, only: %i[ show edit update destroy ]
  before_action :check_owner, only: [:edit, :updata, :destroy]

  # GET /videos or /videos.json
  def index
    # page라는 파라미터를 받고, 한 페이지에 per(4) 4개씩 불러오겠다. 
    @videos = Video.all.page(params[:page]).per(4)
  end

  # GET /videos/1 or /videos/1.json
  def show
    # show화면에 들어올 때마다, increment!로 view_count 속성값을 1씩 증가시키기 
    @video.increment!(:view_count)
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos or /videos.json
  def create
    @video = Video.new(video_params)
    @video.user = current_user

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: "Video was successfully created." }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1 or /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: "Video was successfully updated." }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1 or /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: "Video was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def video_params
      params.require(:video).permit(:title, :description, :file, :image )
    end

    def check_owner
      redirect_to main_path unless @video.user == current_user 
    end
end
