# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'open-uri'

# Movie.destroy_all

# url = 'http://tmdb.lewagon.com/movie/top_rated?api_key=<your_api_key>'
# response = URI.open(url)
# json = JSON.parse(response.read)
# movies = json['results']
# movies.each do |movie|
#   title = movie['title']
#   overview = movie['overview']
#   poster_url = "#{poster_url}#{movie["backdrop_path"]}"
#   rating = movie['vote_average']
#   movie = Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)
#   puts movie.title
# end

require "open-uri"
require "json"
puts "clearting db"
Movie.destroy_all
puts "db cleared"
base_url = "http://tmdb.lewagon.com/movie/top_rated"
20.times do |count|
    movies = JSON.parse(open("#{base_url}?page=#{count + 1}").read)['results']
    movies.each do |movie|
      poster_url = "https://image.tmdb.org/t/p/original"
      Movie.create(
        title: movie['title'],
        overview: movie['overview'],
        poster_url: "#{poster_url}#{movie['backdrop_path']}",
        rating: movie['vote_average']
      )
    end
end
