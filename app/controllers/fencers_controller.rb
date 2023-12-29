class FencersController < ApplicationController
  before_action :set_fencer, only: %i[ show edit update destroy ]

  # GET /fencers
  def index
    @fencers = Fencer.all
  end

  # GET /fencers/1
  def show
  end

  # GET /fencers/new
  def new
    @fencer = Fencer.new
  end

  # GET /fencers/1/edit
  def edit
  end

  # POST /fencers
  def create
    @fencer = Fencer.new(fencer_params)

    if @fencer.save
      redirect_to @fencer, notice: "Fencer was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fencers/1
  def update
    if @fencer.update(fencer_params)
      redirect_to @fencer, notice: "Fencer was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /fencers/1
  def destroy
    @fencer.destroy!
    redirect_to fencers_url, notice: "Fencer was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fencer
      @fencer = Fencer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fencer_params
      params.require(:fencer).permit(:name, :points, :photo)
    end
end
