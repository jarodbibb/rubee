class SongsController < ApplicationController
  def create
    @song = Song.new ( makin_music )
    if @song.save
      redirect_to '/songs/show'
    else 
      flash[:notice] = @song.errors.full_messages
      redirect_to '/songs/show'
    end
  end

  def destroy
  end

  def update
    @song = Song.find(params[:id])
  @song.increment!(:count)
   @playlist = Playlist.where("users_id" => current_user.id).where("songs_id" => params[:id])
  
  if @playlist.length >= 1 
    Playlist.create(timesadded: 1, users_id: current_user.id, songs_id: params[:id])
    
  else
    @playlist.increment!(:timesadded)
    
  end 
    redirect_to '/songs/show'
  end
  def show
    @songs = Song.all
  end 
  def added 
    @song = Song.find(params[:id])
   
    @playlist = Playlist.where("songs_id" => params[:id])
     
    @users = User.where(1)

    
  end 
  private
  def makin_music
    params.require(:song).permit(:title, :artist)
  end

end
