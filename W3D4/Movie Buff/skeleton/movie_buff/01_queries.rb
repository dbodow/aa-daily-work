def it_was_ok
  # Consider the following:
  #
  # Movie.where(yr: 1970..1979)
  #
  # We can use ranges (a..b) inside a where method.
  #
  # Find the id, title, and score of all movies with scores between 2 and 3
  Movie
    .select(:id, :title, :score)
    .where(score: (2..3))
end

def harrison_ford
  # Consider the following:
  #
  # Actor
  #   .joins(:movies)
  #   .where(movies: { title: 'Blade Runner' })
  #
  # It's possible to join based on active record relations defined in models.
  #
  # Find the id and title of all movies in which Harrison Ford
  # appeared but not as a lead actor
  Movie
    .select(:id, :title)
    .joins(:actors)
    .where("name = 'Harrison Ford'") # Use double quotes if you are referencing a name
    .where.not('ord = 1') # You don't need to use escape characters if you use single within double quotes/ vice versa
end

def biggest_cast
  # Consider the following:
  #
  # Actor
  #   .joins(:movies)
  #   .group('actors.id')
  #   .order('COUNT(movies.id) DESC')
  #   .limit(1)
  #
  # Sometimes we need to use aggregate SQL functions like COUNT, MAX, and AVG.
  # Often these are combined with group.
  #
  # Find the id and title of the 3 movies with the
  # largest casts (i.e most actors)

  # The query written below works as well!
    # Movie.find_by_sql(<<-SQL)
    # select
    #   movies.id, title
    # from
    #   movies
    # join
    #   castings on castings.movie_id = movies.id
    # join
    #   actors on actors.id = castings.actor_id
    # group by
    #   movies.id
    # order by
    #   COUNT(movie_id) DESC
    # limit
    #   3
    #   SQL
    Movie
      .select("movies.id, title")
      .joins(:castings, :actors)
      .group("movies.id")
      .order("COUNT(castings.movie_id) DESC")
      .limit(3)
end

def directed_by_one_of(them)
  # Consider the following:
  #
  # Movie.where('yr IN (?)', years)
  #
  # We can use IN to test if an element is present in an array.
  #
  # ActiveRecord gives us an even better way to write this:
  #
  # Movie.where(yr: years)
  #
  # Find the id and title of all the movies directed by one of 'them'.

  Movie
    .select(:id, :title)
    .joins(:director) # In model, there is a belongs_to relationship with the director (who is in the actors database)
    .where("actors.name IN (?)", them) # Cannot use `=`; must use `IN` and the `?` needs to be in brackets
end

def movie_names_before_1940
  # Consider the following:
  #
  # Movie.where('score < 2.0').pluck(:title)
  # => ['Police Academy: Mission to Moscow']
  #
  # Pluck works similarly to select, except that it converts a query result
  # directly into a Ruby Array instead of an ActiveRecord object. This can
  # improve performace for larger queries.
  #
  # Use pluck to find the title of all movies made before 1940.
  Movie
    .where("yr < 1940")
    .pluck(:title)
end
