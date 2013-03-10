class RacesController < ApplicationController
  # GET /elections/:election_id/races
  # GET /elections/:election_id/races.json
  def index
    @election = Election.find(params[:election_id])
    @races = @election.races

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @races }
    end
  end

  # GET /elections/:election_id/races/1
  # GET /elections/:election_id/races/1.json
  def show
    @election = Election.find(params[:election_id])
    @race = @election.races.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @race }
    end
  end

  # GET /elections/:election_id/races/new
  # GET /elections/:election_id/races/new.json
  def new
    @election = Election.find(params[:election_id])
    @race = @election.races.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @race }
    end
  end

  # GET /elections/:election_id/races/1/edit
  def edit
    @election = Election.find(params[:election_id])
    @race = @election.races.find(params[:id])
  end

  # POST /elections/:election_id/races
  # POST /elections/:election_id/races.json
  def create
    @election = Election.find(params[:election_id])
    @race = @election.races.build(params[:race])

    respond_to do |format|
      if @race.save
        format.html { redirect_to [@election, @race], notice: 'Race was successfully created.' }
        format.json { render json: @race, status: :created, location: [@election, @race] }
      else
        format.html { render action: "new" }
        format.json { render json: @race.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /elections/:election_id/races/1
  # PUT /elections/:election_id/races/1.json
  def update
    @election = Election.find(params[:election_id])
    @race = Race.find(params[:id])

    respond_to do |format|
      if @race.update_attributes(params[:race])
        format.html { redirect_to [@election, @race], notice: 'Race was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @race.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elections/:election_id/races/1
  # DELETE /elections/:election_id/races/1.json
  def destroy
    @election = Election.find(params[:election_id])
    @race = @election.races.find(params[:id])
    @race.destroy

    respond_to do |format|
      format.html { redirect_to election_races_url(@election) }
      format.json { head :no_content }
    end
  end
end
