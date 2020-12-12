class CardsController < ApplicationController

  before_action :set_card,only:[:show,:edit,:update,:destroy]
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

  def show
    @comment=Comment.new
    @comments=@card.comments
    .where(deleted_at: nil)
    .order(id: :desc)
    #使用reverse 較慢
  end

  def create
    @card=Card.new(clean_parims)
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

  def set_card
    @card=Card.find(params[:id])
  end

end
