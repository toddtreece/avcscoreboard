class TeamMembersController < ApplicationController
  # GET /team_members.json
  def index
    if params[:filter] && !params[:filter].empty?
      filters = ActiveSupport::JSON.decode(params[:filter])
      filters.each do |filter|
        @team_members = TeamMember.where(filter['property'] => filter['value'])
      end
    else  
      @team_members = TeamMember.all
    end

    respond_to do |format|
      format.json { render :json => { :success => true, :data => @team_members } } 
    end
  end

  # GET /team_members/1.json
  def show
    @team_member = TeamMember.find(params[:id])

    respond_to do |format|
      format.json { render :json => { :success => true, :data => @team_member } }  
    end
  end

  # POST /team_members.json
  def create
    @team_member = TeamMember.new
    @team_member.firstname = params[:firstname]
    @team_member.lastname = params[:lastname]
    @team_member.team_id = 0

    respond_to do |format|
      if @team_member.save
        format.json { render :json => { :success => true, :data => @team_member, :message => 'Created' } }
      else
        format.json { render :json => { :success => false, :message => 'Creation Failed' } }
      end
    end
  end

  # PUT /team_members/1.json
  def update
    @team_member = TeamMember.find(params[:id])
    @team_member.firstname = params[:firstname]
    @team_member.lastname = params[:lastname]
    @team_member.team_id = params[:team_id]

    respond_to do |format|
      if @team_member.save
        format.json { render :json => { :success => true, :message => 'Updated' } }
      else
        format.json { render :json => { :success => false, :message => 'Update Failed' } }  
      end
    end
  end

  # DELETE /team_members/1.json
  def destroy
    @team_member = TeamMember.find(params[:id])
    @team_member.destroy

    respond_to do |format|
      format.json { render :json => { :success => true, :message => 'Deleted' } }  
    end
  end
end
