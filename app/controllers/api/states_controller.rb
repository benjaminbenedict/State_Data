class Api::StatesController < ApplicationController
  def index
    @states = States.all
    render json: States.All
  end

  def show
    @state = State.find_by(abbrev: params[:abbrev])
    render json: State.find_by(abbrev: params[:abbrev])
  end
end
