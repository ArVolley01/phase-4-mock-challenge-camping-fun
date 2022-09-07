class CampersController < ApplicationController

    def index
        render json: Camper.all.to_a
    end

    def create
        camper = Camper.new(
            name: params[:name],
            age: params[:age]
        )
        if camper.save
            render json: camper, status: 201
        else
            render json: {"errors": ["validation errors"]}, status: 422
        end
    end

    def show
        camper = Camper.find_by(id: params[:id])
        if camper
            render json: camper.to_json(methods: [:activities])
        else
            render json: {error: "Camper not found"}, status: 404
        end
    end


end
