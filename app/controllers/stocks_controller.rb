class StocksController < ApplicationController
  
  def index
  	@stock = Stock.new
    @quote = IEX::Resources::Quote.get('MSFT')
  end

  def show
  	@stocks = Stock.all
  end


  def new
  	@stock = Stock.new
  end

  def create
    @stock = IEX::Resources::Quote.get(params[:id])
    ##I need to create a client and pass this along into it.
    if @stock.save
      flash[:notice] = "Successful look up"
      redirect_to root_path
    else
      flash.now[:error] = "Nothing was found"
    end
  end

  private

  def set_params
    params.require(:stock).permit(:ticker)
  end

  def stock_lookup

  end

  def client_create
    IEX::Api::Client.new(
    publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
    endpoint: 'https://cloud.iexapis.com/v1'
    )
  end



end
