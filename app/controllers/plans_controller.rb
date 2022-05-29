class PlansController < ApplicationController


  def index
    @plans = Plan.all

    if Plan.count == 0
     @message = "現在登録済みのスケジュールはありません"
    end
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(params.require(:plan).permit(:title, :starting_date, :ending_date, :checkbox, :introduction))
    if @plan.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to :plans
    else
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(params.require(:plan).permit(:title, :starting_date, :ending_date, :checkbox, :introduction))
      flash[:notice] = "ユーザーIDが「#{@plan.id}」の情報を更新しました"
      redirect_to :plans
    else
      render "edit"
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :plans
  end
end
