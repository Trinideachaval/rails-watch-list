class List < ApplicationRecord
  has_many :bookmarks
  has_many :movies, through: :bookmarks, dependent: :destroy
  validates :name, uniqueness: true
  validates :name, presence: true

  MOVIE_IMAGE = Nokogiri::HTML(RestClient.get("https://www.filmsite.org/iconicfilmscenes.html")).search("img").map{ |img| img["src"] }

  def random_image
    @random_image = "https://www.filmsite.org/#{MOVIE_IMAGE.sample}"
  end
end
