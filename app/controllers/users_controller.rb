class UsersController < ApplicationController

  def index
    user = User.all
    render json: user, include: :items
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user, include: :items
  rescue ActiveRecord::RecordNotFound => e
    render json: {error: e.record.errors.full_messages}, include: :unprocessable_entity
  end

end
