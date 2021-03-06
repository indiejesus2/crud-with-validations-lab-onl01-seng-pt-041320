class SongsController < ApplicationController
    before_action :set_song, only: [:show, :edit, :update, :destroy]

    def index
        @songs = Song.all
    end
    
    def show
    end

    def new
        @song = Song.new
    end
        
    def create
        # binding.pry
        @song = Song.new(song_params)
        # binding.pry
        if @song.save
            redirect_to song_path(@song)
        else
            render :new
        end

    end

    def edit
    end

    def update
        # binding.pry
        @song.attributes=(song_params)

        if @song.save
            redirect_to song_path(@song)
        else
            render :edit
        end

    end

    def destroy
        @song.destroy
        redirect_to songs_path
    end



    private

    def song_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end

    def set_song
        @song = Song.find(params[:id])
    end


end
