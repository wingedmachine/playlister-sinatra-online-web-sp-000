class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  post '/songs' do
    artist = Artist.find_or_create_by(name: params[:song][:artist_name])
    genres = params[:song][:genre_slugs].map { |slug| Genre.find_by_slug(slug) }
    binding.pry
    Song.create()
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/create'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end
end
