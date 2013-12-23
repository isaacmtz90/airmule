class SearchController < ApplicationController
	def search
		from_search = "%#{params[:from].upcase}%"
		to_search = "%#{params[:to].upcase}%"
		logger.debug from_search
		@trips = Trip.where(" upper(from_city) like? AND  upper(to_city) like ? ", from_search,to_search)
		#TODO if trip = null hacer otro search
	end
end