class Movie < ActiveRecord::Base
  class Movie::InvalidKeyError < StandardError ; end
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def self.find_similar_movies( id)
    movie = find_by_id(id)
    if movie.director == nil or movie.director == ""
      raise Movie::InvalidKeyError, "'#{movie.title}' has no director info"
    else
      find_all_by_director(movie.director)
    end
  end
end
