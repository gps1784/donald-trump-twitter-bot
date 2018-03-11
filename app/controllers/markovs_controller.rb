class MarkovsController < ApplicationController
  before_action :set_markov, only: :show

  # GET /markovs
  # GET /markovs.json
  def index
    @markovs = Markov.all
  end

  # GET /markovs/1
  # GET /markovs/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_markov
      @markov = Markov.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def markov_params
      params.require(:markov)
    end
end
