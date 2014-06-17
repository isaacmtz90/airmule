class SearchController < ApplicationController
	def search
		@trips = [];

		if params[:from] != "" && params[:to] != "" 
			from_search = "%#{params[:from].upcase}%"
			to_search = "%#{params[:to].upcase}%"

			if !params[:date].blank?
				
				trip_date = Date.parse(params[:date])
				@trips = Trip.where(" upper(from_city) like ? AND upper(to_city) like ? AND to_when >= ? AND from_when <= ?", from_search,to_search,trip_date,trip_date)
			else
				@trips = Trip.where(" upper(from_city) like ? AND upper(to_city) like ?", from_search,to_search)
			end
			#TODO if trip = null hacer otro search
		end
	end
end