class CommitFilesController < ApplicationController
  before_action :set_commit_file, only: [:show, :edit, :update, :destroy]

  # GET /commit_files
  # GET /commit_files.json
  def index
    @commit_files = CommitFile.all
  end

  # GET /commit_files/1
  # GET /commit_files/1.json
  def show
  end

  # GET /commit_files/new
  def new
    @commit_file = CommitFile.new
  end

  # GET /commit_files/1/edit
  def edit
  end

  # POST /commit_files
  # POST /commit_files.json
  def create
    @commit_file = CommitFile.new(commit_file_params)

    respond_to do |format|
      if @commit_file.save
        format.html { redirect_to @commit_file, notice: 'Commit file was successfully created.' }
        format.json { render action: 'show', status: :created, location: @commit_file }
      else
        format.html { render action: 'new' }
        format.json { render json: @commit_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /commit_files/1
  # PATCH/PUT /commit_files/1.json
  def update
    respond_to do |format|
      if @commit_file.update(commit_file_params)
        format.html { redirect_to @commit_file, notice: 'Commit file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @commit_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commit_files/1
  # DELETE /commit_files/1.json
  def destroy
    @commit_file.destroy
    respond_to do |format|
      format.html { redirect_to commit_files_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commit_file
      @commit_file = CommitFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def commit_file_params
      params.require(:commit_file).permit(:filename, :additions, :deletions, :changed_lines, :commit_id)
    end
end
