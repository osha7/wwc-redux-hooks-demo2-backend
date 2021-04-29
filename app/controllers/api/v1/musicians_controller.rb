class Api::V1::MusiciansController < ApplicationController
    
    def index
        
        musicians = Musician.all
        # byebug
        render json: {
            musicians: musicians
        }
    end

    def show
        musician = Musician.find_by(params[:id])
        render json: {musician: musician}
    end

    def new
        musician = Musician.new
    end

    def create
        musician = Musician.create(musician_params)
        if musician.valid?
            render json: {
                success: "Musician successfully created.",
                musician: musician
            }
        else
            render json: { errors: musician.errors.full_messages }
        end
    end

    def edit
        musician = Musician.find_by(params[:id])
    end

    def update
        musician = Musician.find_by(params[:id])
        musician.update(musician_params)
        if musician.valid?
            musician.save
            render json: {
                success: "Musician successfully updated.",
                musician: musician
            }
        else
            render json: { errors: musician.errors.full_messages }
        end
    end

    def delete
        musician = Musician.find_by(params[:id])
        if musician.destroy
            musicians = Musician.all
            render json: {
                musician: musician,
                musicians: musicians,
                success: "Musican successfully deleted"
            }
        else
            render json: {
                failure: "Unable to delete musician at this time",
                errors: musician.errors.full_messages
            }
        end
    end

    private

    def musician_params
        params.require(:musician).permit(:id, :name, :origin, :is_active)
    end

end
