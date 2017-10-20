def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between
  # 3 and 5 (inclusive).
  # Show the id, title, year, and score.
  Movie
    .select(:id, :title, :yr, :score)
    .where(score: (3..5), yr: (1980..1989))
end

def bad_years
  # List the years in which a movie with a rating above 8 was not released.

  # The SQL below workds as well but only returns ActiveRecord relations, not arrays
  # Movie.find_by_sql(<<-SQL)
  # select
  #   m1.yr
  # from
  #   movies as m1
  # LEFT OUTER JOIN
  #   (select
  #     *
  #   from
  #     movies
  #   where
  #     score > 8) as m2 ON m1.title = m2.title
  # group by
  #   m1.yr
  # having
  #   count(m2.yr) = 0
  # SQL

# This as well
  # Movie.find_by_sql(<<-SQL)
  #   select
  #     yr
  #   from
  #     movies
  #   group by
  #     yr
  #   having
  #     MAX(score) < 8
  # SQL
  #

  Movie
  .group(:yr)
  .having('MAX(score) < 8')
  .pluck(:yr)

end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.
  Movie
    .select('actors.id, name')
    .joins(:actors)
    .where('title = ?', title)
    .order('castings.ord')


end

def vanity_projects
  # List the title of all movies in which the director also appeared
  # as the starring actor.
  # Show the movie id and title and director's name.

  # Note: Directors appear in the 'actors' table.

  Movie
    .select(:id, :title, :name)
    .joins(:actors)
    .where('director_id = actor_id AND ord = 1')
end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name and number of supporting roles.
  Actor
    .select("actors.id, actors.name, COUNT(castings.movie_id) AS roles")
    .joins(:castings)
    .where('ord > 1')
    .group('actors.id')
    .order('roles desc')
    .limit(2)
end
