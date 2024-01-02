class TournamentsController < ApplicationController
  before_action :set_tournament, only: %i[ show edit update destroy ]
  before_action :set_update, only: %i[ update ]

  # GET /tournaments
  def index
    @tournaments = Tournament.all
  end

  # GET /tournaments/1
  def show
  end

  # GET /tournaments/new
  def new
    @tournament = Tournament.new
  end
  
  # GET /tournaments/1/edit
  def edit
    @fencers = Fencer.order(points: :desc)
    @first_fencer = @fencers.first
  end

  # POST /tournaments
  def create
    @tournament = Tournament.new(tournament_params)
    @fencers = Fencer.all
    @tournament.fencers = @fencers

    if @tournament.save
      redirect_to @tournament, notice: "Tournament was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tournaments/1
  def update
    participants = params[:tournament][:fencer_ids]
    @tournament.fencers = []
    # debug
    participants.shift
    participants.each do | participant |
      new_participant = Fencer.find(participant.to_i)
      @tournament.fencers << new_participant
    end
    @tournament.save
    if update_params
      redirect_to @tournament, notice: "Tournament was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tournaments/1
  def destroy
    @tournament.destroy!
    redirect_to tournaments_url, notice: "Tournament was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    def set_update
      @tournament = Tournament.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tournament_params
      params.fetch(:tournament, {})
    end

    def update_params
      params.fetch(:tournament, :fencers, {})
    end

end
