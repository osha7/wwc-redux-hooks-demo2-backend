class Api::V1::SongsController < ApplicationController

    def index
        songs = Song.all
        render json: {songs: songs}
    end

    def show
        song = Song.find_by(params[:id])
        render json: {song: song}
    end

    def new
        song = Song.new
    end

    def create
        song = Song.create(song_params)
        if song.valid?
            render json: {
                success: "Song successfully created",
                song: song
            }
        else
            render json: { errors: song.errors.full_messages }
        end
    end

    def edit
        song = Song.find_by(params[:id])
    end

    def update
        song = Song.find_by(params[:id])
        song.update(song_params)
        if song.valid?
            song.save
            render json: {
                success: "song successfully updated.",
                song: song
            }
        else
            render json: { errors: song.errors.full_messages }
        end
    end

    def delete
        song = Song.find_by(params[:id])
        if song.destroy
            songs = Song.all
            render json: {
                song: song,
                songs: songs,
                success: "Song successfully deleted"
            }
        else
            render json: {
                failure: "Unable to delete song at this time.",
                errors: song.errors.full_messages
            }
        end
    end

    private

    def song_params
        params.require(:song).permit(:name, :musician_id)
    end

end
