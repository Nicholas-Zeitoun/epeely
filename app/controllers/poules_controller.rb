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
    @fencers = Fencer.all
  end

  # GET /poules/1/edit
  def edit
  end

  # POST /poules
  def create
    @poule = Poule.new(poule_params)
    five_fencers(@poule)

    if @poule.save
      redirect_to @poule, notice: "Poule was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Poule of 5
  def five_fencers(poule)
    fencers = Fencer.all
    # Get the 5 fencers
    fencer1 = fencers.first 
    fencer2 = fencers.second 
    fencer3 = fencers.third
    fencer4 = fencers.fourth 
    fencer5 = fencers.fifth

    new_matches = []

    # Create 10 matches
    10.times do
      match = Match.new(:poule => poule)
      match.save!
      new_matches << match
    end

    # Match 1
    @scorem1a = Score.new(points: 0)
    @scorem1b = Score.new(points: 0)
    @scorem1a.match = new_matches[0]
    @scorem1a.fencer = fencer1
    @scorem1b.match = new_matches[0]
    @scorem1b.fencer = fencer2
    @scorem1a.save
    @scorem1b.save
    
    # Match 2
    @scorem2a = Score.new(points: 0)
    @scorem2b = Score.new(points: 0)
    @scorem2a.match = new_matches[1]
    @scorem2a.fencer = fencer3
    @scorem2b.match = new_matches[1]
    @scorem2b.fencer = fencer4
    @scorem2a.save
    @scorem2b.save

    # Match 3
    @scorem3a = Score.new(points: 0)
    @scorem3b = Score.new(points: 0)
    @scorem3a.match = new_matches[2]
    @scorem3a.fencer = fencer5
    @scorem3b.match = new_matches[2]
    @scorem3b.fencer = fencer1
    @scorem3a.save
    @scorem3b.save

    # Match 4
    @scorem3a = Score.new(points: 0)
    @scorem3b = Score.new(points: 0)
    @scorem3a.match = new_matches[3]
    @scorem3a.fencer = fencer2
    @scorem3b.match = new_matches[3]
    @scorem3b.fencer = fencer3
    @scorem3a.save
    @scorem3b.save

    # Match 5
    @scorem4a = Score.new(points: 0)
    @scorem4b = Score.new(points: 0)
    @scorem4a.match = new_matches[4]
    @scorem4a.fencer = fencer5
    @scorem4b.match = new_matches[4]
    @scorem4b.fencer = fencer4
    @scorem4a.save
    @scorem4b.save    

    # Match 6
    @scorem5a = Score.new(points: 0)
    @scorem5b = Score.new(points: 0)
    @scorem5a.match = new_matches[5]
    @scorem5a.fencer = fencer1
    @scorem5b.match = new_matches[5]
    @scorem5b.fencer = fencer3
    @scorem5a.save
    @scorem5b.save
    
    # Match 7
    @scorem6a = Score.new(points: 0)
    @scorem6b = Score.new(points: 0)
    @scorem6a.match = new_matches[6]
    @scorem6a.fencer = fencer2
    @scorem6b.match = new_matches[6]
    @scorem6b.fencer = fencer5
    @scorem6a.save
    @scorem6b.save

    # Match 8
    @scorem7a = Score.new(points: 0)
    @scorem7b = Score.new(points: 0)
    @scorem7a.match = new_matches[7]
    @scorem7a.fencer = fencer4
    @scorem7b.match = new_matches[7]
    @scorem7b.fencer = fencer1
    @scorem7a.save
    @scorem7b.save

    # Match 9
    @scorem8a = Score.new(points: 0)
    @scorem8b = Score.new(points: 0)
    @scorem8a.match = new_matches[8]
    @scorem8a.fencer = fencer3
    @scorem8b.match = new_matches[8]
    @scorem8b.fencer = fencer5
    @scorem8a.save
    @scorem8b.save

    # Match 10
    @scorem9a = Score.new(points: 0)
    @scorem9b = Score.new(points: 0)
    @scorem9a.match = new_matches[9]
    @scorem9a.fencer = fencer4
    @scorem9b.match = new_matches[9]
    @scorem9b.fencer = fencer2
    @scorem9a.save
    @scorem9b.save 
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