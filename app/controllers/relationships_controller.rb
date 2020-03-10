class RelationshipsController < ApplicationController

  def index
    # logger.debug 'ここみて'
    # logger.debug params.inspect
    if params[:follow_id].nil? then
      relationships = Relationship.where( follower_id: params[:follower_id] )
      @users = relationships.map{ |relationship| User.find( relationship.follow_id ) }
      @info = 'Follow'
    else
      relationships = Relationship.where( follow_id: params[:follow_id] )
      @users = relationships.map{ |relationship| User.find( relationship.follower_id ) }
      @info = 'Follower'
    end
  end

  def create
    relationship = Relationship.new( follow_id: params[:user_id], follower_id: current_user.id)
    relationship.save
    redirect_to request.referer
  end

  def destroy
    relationship = Relationship.where( follow_id: params[:user_id] ).find_by( follower_id: current_user.id )
    relationship.destroy
    redirect_to request.referer
  end

  private
  def relationship_params

  end
end
