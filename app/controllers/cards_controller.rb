class CardsController < ApplicationController

  def index      
    # render html: 'hello 123'
    #/app/views/cards/index.html.erb
    #erb=embedded ruby
  end

  # Add a new card page
  def new

  end

  def create

    redirect_to "/cards"
  end

end
