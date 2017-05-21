MATCH (me:User {id: {user_id}})-[my:RATED]->(m:Movie)
MATCH (other:User)-[their:RATED]->(m)
  WHERE me <> other
  AND abs(my.rating - their.rating) < 2
WITH other,m
MATCH (other)-[otherRating:RATED]->(movie:Movie)
  WHERE movie <> m
WITH avg(otherRating.rating) AS avgRating, movie
RETURN movie
  ORDER BY avgRating desc
  LIMIT 25
