class SignupsController < ApplicationController
    def create
        signedup = Signup.new(time: params[:time], activity_id: params[:activity_id], camper_id: params[:camper_id])
        if signedup.save
            render json: signedup.activity, status: 201
        else
            render json: {"errors": ["validation errors"]}, status: 422
        end
    end
end
