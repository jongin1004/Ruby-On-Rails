class ScaffoldBlogsController < ApplicationController
  before_action :set_scaffold_blog, only: %i[ show edit update destroy ]

  # GET /scaffold_blogs or /scaffold_blogs.json
  def index
    @scaffold_blogs = ScaffoldBlog.all
  end

  # GET /scaffold_blogs/1 or /scaffold_blogs/1.json
  def show
  end

  # GET /scaffold_blogs/new
  def new
    @scaffold_blog = ScaffoldBlog.new
  end

  # GET /scaffold_blogs/1/edit
  def edit
  end

  # POST /scaffold_blogs or /scaffold_blogs.json
  def create
    @scaffold_blog = ScaffoldBlog.new(scaffold_blog_params)

    respond_to do |format|
      if @scaffold_blog.save
        format.html { redirect_to @scaffold_blog, notice: "Scaffold blog was successfully created." }
        format.json { render :show, status: :created, location: @scaffold_blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @scaffold_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scaffold_blogs/1 or /scaffold_blogs/1.json
  def update
    respond_to do |format|
      if @scaffold_blog.update(scaffold_blog_params)
        format.html { redirect_to @scaffold_blog, notice: "Scaffold blog was successfully updated." }
        format.json { render :show, status: :ok, location: @scaffold_blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @scaffold_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scaffold_blogs/1 or /scaffold_blogs/1.json
  def destroy
    @scaffold_blog.destroy
    respond_to do |format|
      format.html { redirect_to scaffold_blogs_url, notice: "Scaffold blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scaffold_blog
      @scaffold_blog = ScaffoldBlog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scaffold_blog_params
      params.require(:scaffold_blog).permit(:title, :description)
    end
end
