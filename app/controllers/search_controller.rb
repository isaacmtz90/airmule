class SearchController < ApplicationController
	def search
		from_search = "%#{params[:from]}%"
		logger.debug from_search
		@trips = Trip.where("from_city like ?", from_search)
		#TODO if trip = null hacer otro search
	end
end
