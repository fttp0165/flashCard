class CardsController < ApplicationController

  def index      
    # render html: 'hello 123'
    #/app/views/cards/index.html.erb
    #erb=embedded ruby
    @cards=Card.all
  end

  # Add a new card page
  def new
    @card=Card.new
  end

  def create
    clean_parims=params.require(:card).permit(:title,:content)
    @card=Card.new(clean_parims)
    if @card.save
      redirect_to "/cards"
    else
      render :new
    end
  end

 def edit

   @card=Card.find(params[:id])
 
 end

 def update
   @card=Card.find(params[:id])
   clean_parims=params.require(:card).permit(:title,:content)
 
   if @card.update(clean_parims)
    redirect_to "/cards"
   else
    render :edit
   end


  end

end
