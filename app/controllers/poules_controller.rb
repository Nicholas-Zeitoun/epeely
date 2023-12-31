class PoulesController < ApplicationController
  before_action :set_poule, only: %i[ show edit update destroy ]

  # GET /poules
  def index
    @poules = Poule.all
  end

  # GET /poules/1
  def show
  end

  # GET /poules/new
  def new
    @poule = Poule.new
  end

  # GET /poules/1/edit
  def edit
  end

  # POST /poules
  def create
    @poule = Poule.new(poule_params)

    if @poule.save
      redirect_to @poule, notice: "Poule was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /poules/1
  def update
    if @poule.update(poule_params)
      redirect_to @poule, notice: "Poule was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /poules/1
  def destroy
    @poule.destroy!
    redirect_to poules_url, notice: "Poule was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poule
      @poule = Poule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def poule_params
      params.fetch(:poule, {})
    end
end
