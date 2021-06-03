SELECT
	Id,
	Name
From Genre;

SELECT
	id,
	artistName,
	yearEstablished
FROM Artist
ORDER BY ArtistName;

SELECT
	s.title,
	a.artistName
From Song s LEFT JOIN Artist a  on s.title = a.id;


