class ProfilesController < ApplicationController
	def create
		profile = UserProfile.where(user_id: current_user.id).first
		datetime = params[:date].split("T")
		date = datetime[0].split("-")
		datetime = Time.new(date[0], date[1], date[2], datetime[1].split(":")[0],datetime[1].split(":")[1] )
		if profile.nil?
			profile = UserProfile.create(user_id: current_user.id, name: params[:name], last_name: params[:last_name], birth_date: datetime)
		else
			profile.update(name: params[:name], last_name: params[:last_name], birth_date: datetime)
		end
		render json: {profile: profile}

	end
	def get_profile
		profile = UserProfile.where(user_id: current_user.id).first
		if profile.nil?
			render json: {profile: nil}
		else
			render json: {profile: profile}
		end
	end

end
