module ApplicationHelper


	def create_iex_client
		client = IEX::Api::Client.new(
		publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
		endpoint: 'https://cloud.iexapis.com/v1'
		)
	end

	def flash_class(level)
	    case level
	    when :notice then "alert alert-success"
	    when :success then "alert alert-success"
	    when :error then "alert alert-warning"
	    when :alert then "alert alert-danger"
	    end
	 end
end
