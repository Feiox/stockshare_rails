class StocksController < ApplicationController
  load_and_authorize_resource

  def index
    @stock = Stock.all
  end

  def show
    @stock  = Stock.find(params[:id])
  end

  def new
    @stock = Stock.new
  end

  def edit

    @stock = Stock.find(params[:id])
  end

  def create

    @stock = current_user.stocks.new(stock_params)

    if @stock.save
      redirect_to @stock
    else
      render 'new'
    end
  end

  def update
    @stock = Stock.find(params[:id])

    if @stock.update(stock_params)
      redirect_to @stock
    else
      render 'edit'
    end
  end

  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy

    redirect_to stocks_path
  end

  private
      def stock_params
      params.require(:stock).permit(:stockNumber,:title,:size,:inventory,:color,:text,:avatar)
    end
end