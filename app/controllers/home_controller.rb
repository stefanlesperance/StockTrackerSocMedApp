class HomeController < ApplicationController
  def index
  	@stock = Stock.new
  end

  def show
  	@stocks = Stock.all
  end


  def new
  	@stock = Stock.new
  end

 def create
 	byebug
    @stock = client.get(params[:id])
    ##I need to create a client and pass this along into it.
    if @stock.save
      flash[:notice] = "Successful look up"
      redirect_to root_path
    else
      flash.now[:error] = "Nothing was found"
    end
  end

end
