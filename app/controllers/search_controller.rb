class SearchController < ApplicationController
	def search
		@trips = [];
		if params[:from] != "" && params[:to] != "" && params[:date] != ""
			from_search = "%#{params[:from].upcase}%"
			to_search = "%#{params[:to].upcase}%"
			trip_date = Date.parse(params[:date])
			@trips = Trip.where(" upper(from_city) like ? AND upper(to_city) like ? AND from_when >= DATE(CURRENT_DATE) AND to_when >= ? AND from_when <= ?", from_search,to_search,trip_date,trip_date)
			#TODO if trip = null hacer otro search
		end
	end
end