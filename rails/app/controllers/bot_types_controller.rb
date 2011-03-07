class BotTypesController < ApplicationController
  # GET /bot_types.json
  def index
    @bot_types = BotType.all

    respond_to do |format|
      format.json { render :json => { :data => @bot_types } }
    end
  end

  # GET /bot_types/1.json
  def show
    @bot_type = BotType.find(params[:id])

    respond_to do |format|
      format.json { render :json =>  { :data => @bot_type } }
    end
  end

  # POST /bot_types.json
  def create
    @bot_type = BotType.new(params[:bot_type])

    respond_to do |format|
      if @bot_type.save
        format.json { render :json => { :success => true, :data => @bot_type, :message => 'Created' } }
      else
        format.json { render :json => { :success => false, :message => 'Creation Failed' } }
      end
    end
  end

  # PUT /bot_types/1.json
  def update
    @bot_type = BotType.find(params[:id])

    respond_to do |format|
      if @bot_type.update_attributes(params[:bot_type])
        format.json { render :json => { :success => true, :message => 'Updated' } }
      else
        format.json { render :json => { :success => false, :message => 'Update Failed' } }
      end
    end
  end

  # DELETE /bot_types/1.json
  def destroy
    @bot_type = BotType.find(params[:id])
    @bot_type.destroy

    respond_to do |format|
      format.json { render :json => { :success => true, :message => 'Deleted' } }
    end
  end
end
