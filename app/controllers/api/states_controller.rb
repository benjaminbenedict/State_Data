class Api::StatesController < ApplicationController
  def index
    @states = States.all
    render json: State.all
  end

  def show
    @state = State.find_by(code: params[:code])
    render json: State.find_by(code: params[:code])
  end
end
