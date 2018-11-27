class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/create'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/show'
  end
end
