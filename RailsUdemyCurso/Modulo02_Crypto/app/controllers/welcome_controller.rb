class WelcomeController < ApplicationController
  def index
    @nome = params[:nome] ? params[:nome] : 'RailsDev'
    @curso = "Rails"
  end
end
