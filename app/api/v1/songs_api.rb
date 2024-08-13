# app/api/v1/songs_api.rb
module V1
  class SongsApi < Grape::API
    version 'v1', using: :path
    format :json
    prefix :api

    resource :songs do
      desc 'Get a list of songs'
      get do
        Song.all
      end

      desc 'Get a song by ID'
      params do
        requires :id, type: Integer, desc: 'Song ID'
      end
      route_param :id do
        get do
          Song.find(params[:id])
        end
      end

      desc 'Create a new song'
      params do
        requires :title, type: String, desc: 'Song title'
        requires :artist, type: String, desc: 'Song artist'
        requires :album, type: String, desc: 'Song album'
        requires :released_on, type: Date, desc: 'Release date'
      end
      post do
        Song.create!({
          title: params[:title],
          artist: params[:artist],
          album: params[:album],
          released_on: params[:released_on]
        })
      end

      desc 'Update a song'
      params do
        requires :id, type: Integer, desc: 'Song ID'
        optional :title, type: String, desc: 'Song title'
        optional :artist, type: String, desc: 'Song artist'
        optional :album, type: String, desc: 'Song album'
        optional :released_on, type: Date, desc: 'Release date'
      end
      route_param :id do
        put do
          song = Song.find(params[:id])
          song.update!(declared(params, include_missing: false))
          song
        end
      end

      desc 'Delete a song'
      params do
        requires :id, type: Integer, desc: 'Song ID'
      end
      route_param :id do
        delete do
          Song.find(params[:id]).destroy
          status 204
        end
      end
    end
  end
end
