class CardsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]
  before_action :find_my_card,only:[:edit,:update,:destroy]
  before_action :clean_parims,only:[:create,:update]
  
  def index      
    # render html: 'hello 123'
    #/app/views/cards/index.html.erb
    #erb=embedded ruby
    @cards=Card.order(id: :desc)
    @my_date=Time.now
  end

  # Add a new card page
  def new
    @card=Card.new
  end

  def like
    card=Card.find(params[:id])
    if current_user.like_cards.include?(card)
      current_user.like_cards.delete(card)
      render json: {status:0}
    else
      current_user.like_cards << card
      render json: {status:1}
    end
  end

  def show
    @card=Card.find(params[:id])
    @comment=Comment.new
    @comments=@card.comments
    .where(deleted_at: nil)
    .order(id: :desc)
    #使用reverse 較慢
  end

  def create
    @card=current_user.cards.new(clean_parims)
    if @card.save
     # flash[:notice]="新增卡片成功"
      redirect_to "/cards",notice: '新增卡片成功'
    else
      render :new
    end
  end

 def edit
 end

 def update
   if @card.update(clean_parims)
    redirect_to "/cards",notice: '更新成功'
   else
    render :edit
   end
  end

  def destroy
    @card.destroy
    redirect_to root_path,notice: '刪除成功'
  end

  private

  def clean_parims
    clean_parims=params.require(:card).permit(:title,:content)
  end



  def find_my_card
    @card=current_user.cards.find(params[:id])
  end

end
