class MainController < ApplicationController
	def google
		render json: {state:"ok"}
	end

	def createTrips
		start_pos = params[:positions][:start]
		finish_pos = params[:positions][:finish]
		datetime = params[:positions][:date].split("T")
		date = datetime[0].split("-")
		datetime = Time.new(date[0], date[1], date[2], datetime[1].split(":")[0],datetime[1].split(":")[1] )
		startplace = Place.find_by(name:start_pos[:name])
		finishplace = Place.find_by(name:finish_pos[:name])
		if startplace.nil?
			startplace = Place.create(name:start_pos[:name], 
								 latitude: start_pos[:latitude],
								 longitude:start_pos[:longitude])
		end
		if finishplace.nil?
			finishplace = Place.create(name:finish_pos[:name], 
								 latitude: finish_pos[:latitude],
								 longitude:finish_pos[:longitude])
		end
		trip = Trip.create( user_id: current_user.id, 
							start: datetime, 
							start_place_id: startplace.id, 
							finish_place_id: finishplace.id)
		render json:{state: 'success'}
	end

	def findTrips

	end

	def my_trips
		trips = Trip.where(user_id: current_user.id)
		data_trips = []
		trips.each do |t|
			data_trips.push({trip: t, start_place: t.start_place, finish_place: t.finish_place})
		end
		puts(data_trips)
		render json: data_trips
	end

	def get_trip
		id = params[:id]
		trip = Trip.find(id)
		data = {trip: trip, start_place: trip.start_place, finish_place: trip.finish_place}
		puts(data)
		render json: data
	end

	def delete_trip
		id = params[:trip]
		trip = Trip.find(id)
		trip.delete
		render json: {status: 'ok'}
	end

end
