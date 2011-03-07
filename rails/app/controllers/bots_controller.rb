class BotsController < ApplicationController
  # GET /bots.json
  def index
    @bots = Bot.all

    respond_to do |format|
      format.json  { render :json => { :success => true, :data => @bots } }
    end
  end

  # GET /bots/1.json
  def show
    @bot = Bot.find(params[:id])

    respond_to do |format|
      format.json  { render :json => { :success => true, :data => @bot } }
    end
  end

  # POST /bots.json
  def create
    @bot = Bot.new(params[:bot])

    respond_to do |format|
      if @bot.save
        format.json { render :json => { :success => true, :data => @bot, :message => 'Created' } }
      else
        format.json { render :json => { :success => false, :message => 'Creation Failed' } }
      end
    end
  end

  # PUT /bots/1.json
  def update
    @bot = Bot.find(params[:id])

    respond_to do |format|
      if @bot.update_attributes(params[:bot])
        format.json { render :json => { :success => true, :message => 'Updated' } }
      else
        format.json { render :json => { :success => false, :message => 'Update Failed' } }
      end
    end
  end

  # DELETE /bots/1.json
  def destroy
    @bot = Bot.find(params[:id])
    @bot.destroy

    respond_to do |format|
      format.json { render :json => { :success => true, :message => 'Deleted' } }
    end
  end
end
