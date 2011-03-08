class LapsController < ApplicationController
  # GET /laps.json
  def index
    @laps = Lap.all

    respond_to do |format|
      format.json { render :json => { :success => true, :data => @laps } }
    end
  end

  # GET /laps/1.json
  def show
    @lap = Lap.find(params[:id])

    respond_to do |format|
      format.json { render :json => { :success => true, :data => @lap } }
    end
  end

  # POST /laps.json
  def create
    @lap = Lap.new(params[:lap])

    respond_to do |format|
      if @lap.save
        format.json { render :json => { :success => true, :data => @lap, :message => 'Created' } }  
      else
        format.json { render :json => { :success => true, :message => 'Creation Failed' } }
      end
    end
  end

  # PUT /laps/1.json
  def update
    @lap = Lap.find(params[:id])

    respond_to do |format|
      if @lap.update_attributes(params[:lap])
        format.json { render :json => { :success => true, :message => 'Updated' } }  
      else
        format.json { render :json => { :success => false, :message => 'Update Failed' } }  
      end
    end
  end

  # DELETE /laps/1.json
  def destroy
    @lap = Lap.find(params[:id])
    @lap.destroy

    respond_to do |format|
      format.json { render :json => { :success => true, :message 'Deleted' } }  
    end
  end
end
