class ResourcesController < ApplicationController
  def index
    @bulk_websites = Website.where("kind = ?", "bulk")
    @body_websites = Website.where("kind = ?", "body")
    @informational_websites = Website.where("kind = ?", "informational")
    
    @medicinal_books = Book.where("kind = ?", "medicinal")
    @environmental_books = Book.where("kind = ?", "environmental")
    
    @documentary_movies = Movie.where("kind = ?", "documentary")
    @drama_movies = Movie.where("kind = ?", "drama")
  end
end
