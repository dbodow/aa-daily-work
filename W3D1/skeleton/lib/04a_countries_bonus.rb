# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

# BONUS QUESTIONS: These problems require knowledge of aggregate
# functions. Attempt them after completing section 05.

def highest_gdp
  # Which countries have a GDP greater than every country in Europe? (Give the
  # name only. Some countries may have NULL gdp values)
  execute(<<-SQL)
    -- highest gdp in Europe
    SELECT
      name
    FROM
      countries
    WHERE gdp > (
      SELECT
        MAX(gdp)
      FROM
        countries
      WHERE
        continent = 'Europe'
      );
  SQL
end

def largest_in_continent
  # Find the largest country (by area) in each continent. Show the continent,
  # name, and area.
  execute(<<-SQL)
      -- biggest areas by continent
      SELECT
        continent, name, area -- can't also put in name
      FROM
        countries AS c1
      WHERE
        area = (
          SELECT
            MAX(c2.area) as max_area
          FROM
            countries AS c2
          WHERE -- behaves like a groups by when in a subquery
            c1.continent = c2.continent
        );
  SQL
end

def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.
  execute(<<-SQL)
    SELECT
      name, continent
    FROM
      countries AS c1
    WHERE
      c1.population > 3 * (
        SELECT
          MAX(c2.population) AS triple_pop
        FROM
          countries AS c2
        WHERE
          c1.continent = c2.continent AND c1.name != c2.name
      );
  SQL
end
