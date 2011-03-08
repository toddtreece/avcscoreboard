class TeamsController < ApplicationController
  # GET /teams.json
  def index
    @teams = Team.all

    respond_to do |format|
      format.json { render :json => { :success => true, :data =>@teams } }
    end
  end

  # GET /teams/1.json
  def show
    @team = Team.find(params[:id])

    respond_to do |format|
      format.json { render :json => { success => true, :data => @team } }  
    end
  end

  # POST /teams.json
  def create
    @team = Team.new(params[:team])

    respond_to do |format|
      if @team.save
        format.json { render :json => { :success => true, :data => @team, :message => 'Created' } } 
      else
        format.json { render :json => { :success => false, :message => 'Creation Failed' } }  
      end
    end
  end

  # PUT /teams/1.json
  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.json { render :json => { :success => true, :message => 'Updated' } }
      else
        format.json { render :json => { :success => false, :message => 'Update failed' } }
      end
    end
  end

  # DELETE /teams/1.json
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.json { render :json => { :success => true, :message => 'Deleted' } }
    end
  end
end
