class ScoresController < ApplicationController
  before_action :set_score, only: %i[ show edit update destroy ]
  before_action :set_match, only: %i[new create]


  # GET /scores
  def index
    @scores = Score.all
  end

  # GET /scores/1
  def show
  end

  # GET /scores/new
  def new
    @match = Match.find(2)
    @fencer = Fencer.find(1)
    @score = Score.new
  end

  # GET /scores/1/edit
  def edit
  end

  # POST /scores
  def create
    @score = Score.new(score_params)
    # @score.match = @match
    # @score.fencer = @fencer

    if @score.save
      redirect_to @score, notice: "Score was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /scores/1
  def update
    if @score.update(score_params)
      redirect_to @score, notice: "Score was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /scores/1
  def destroy
    @score.destroy!
    redirect_to scores_url, notice: "Score was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def score_params
      params.require(:score).permit(:points)
    end
end
