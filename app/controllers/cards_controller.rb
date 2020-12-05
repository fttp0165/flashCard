class CardsController < ApplicationController
  before_action :set_card,only:[:show,:edit,:update,:destory]
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

  def show
  end

  def create
    @card=Card.new(clean_parims)
    if @card.save
      redirect_to "/cards"
    else
      render :new
    end
  end

 def edit
 end

 def update
   if @card.update(clean_parims)
    redirect_to "/cards"
   else
    render :edit
   end
  end

  def destroy
    @card.destroy
    redirect_to root_path
  end

  private

  def clean_parims
    clean_parims=params.require(:card).permit(:title,:content)
  end

  def set_card
    @card=Card.find(params[:id])
  end

end
