class HeatsController < ApplicationController
  # GET /heats.json
  def index
    @heats = Heat.all

    respond_to do |format|
      format.json  { render :json => { :success => true, :data => @heats } }
    end
  end

  # GET /heats/1.json
  def show
    @heat = Heat.find(params[:id])

    respond_to do |format|
      format.json  { render :json => { :success => true, :data => @heat } }
    end
  end

  # POST /heats.json
  def create
    @heat = Heat.new(params[:heat])

    respond_to do |format|
      if @heat.save
        format.json { render :json => { :success => true, :data => @heat, :message=> 'Created'  } } 
      else
        format.json { render :json => { :success => false, :message => 'Creation Failed' } }  
      end
    end
  end

  # PUT /heats/1.json
  def update
    @heat = Heat.find(params[:id])

    respond_to do |format|
      if @heat.update_attributes(params[:heat])
        format.json { render :json => { :success => true, :message => 'Updated' } }
      else
        format.json { render :json => { :success => true, :message => 'Update Failed' } }
      end
    end
  end

  # DELETE /heats/1.json
  def destroy
    @heat = Heat.find(params[:id])
    @heat.destroy

    respond_to do |format|
      format.json { render :json => { :success => true, :message => 'Deleted' } }
    end
  end
end
