class Api::StatesController < ApplicationController
  def index
    @states = State.all
    # render json: State.all
    render "index.json.jb"
  end

  def show
    @state = State.find_by(code: params[:code])
    # render json: State.find_by(code: params[:code])
    render "show.json.jb"
  end
end
