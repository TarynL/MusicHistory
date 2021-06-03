--step 1
--Query all of the entries in the Genre table
SELECT
	Id,
	Name
From Genre;

--step 2
--Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords
SELECT
	id,
	artistName,
	yearEstablished
FROM Artist
ORDER BY ArtistName;

--step 3
--Write a SELECT query that lists all the songs in the Song table and include the Artist name
SELECT
	s.title,
	a.artistName
From Song s LEFT JOIN Artist a  on s.artistId = a.id;

--step 4/5
--Write a SELECT query that lists all the Artists that have a Pop Album
--Write a SELECT query that lists all the Artists that have a Jazz or Rock Album
SELECT	
	b.title,
	a.ArtistName,
	g.name
From Album b 
LEFT JOIN Artist a on b.ArtistId =a.id 
LEFT JOIN Genre g on b.GenreId = g.Id
--Where name = 'Pop' 
Where name = 'Jazz' or name = 'Rock'

--step 6
--Write a SELECT statement that lists the Albums with no songs
--SELECT Title
--From Album
--Where AlbumLength = NULL

--step 6
Select b. title
from album b
left join song s on s.AlbumId = b.id
where s.albumid is null

--step 7
--Using the INSERT statement, add one of your favorite artists to the Artist table.
Select * FROM Artist;
--INSERT INTO Artist (ArtistName,YearEstablished) VALUES ('Etta James', 1954)

--step 8
--Using the INSERT statement, add one, or more, albums by your artist to the Album table.
Select * from Album;
--INSERT INTO Album (title, releasedate, albumlength, label, artistId, genreId) values ('At Last', '11/15/1960', 39, 'Argo', 31, 3)

--Step 9
--Using the INSERT statement, add some songs that are on that album to the Song table.
Select * from Song;
--INSERT INTO Song (title, songLength, releaseDate, genreID, artistId, albumId) VALUES ('At Last', 179,'11/15/1960', 3, 31, 24) 

--Step 10
--Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT 
	b.title,
	s.title,
	a.artistName
FROM Song s
LEFT JOIN Artist a on s.artistId = a.id
LEFT JOIN Album b on s.AlbumId = b.id
WHERE s.Title = 'At Last'

--step 11 
--Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
Select b. title, b. id, count(s.Title) '# of songs'
from album b
left join song s on s.AlbumId = b.id
Group by b.Title, b.id





select * from Album
select * from song 

--Step 12
--Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
Select a. artistName, a. id, count(s.Title) '# of songs'
from artist a
left join song s on s.ArtistId = a.id
Group by a. ArtistName, a.id

--Step 13
--Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
Select  g.name, g. id, count(s.title) '# of songs'
from genre g
left join song s on s. GenreId = g.Id
group by g.name, g.id

--step 14
--Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword
select a.artistname, a. id, count (b.label) '# of labels'
from artist a
left join album b on b.ArtistId = a.id
group by a.ArtistName, a.id
having count(Label) > 1
--step 15
--Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
select b.Title, AlbumLength
from Album b
where AlbumLength =(Select max(AlbumLength)  from Album)

--step 16
--Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
--step 17
--Modify the previous query to also display the title of the album.*/
Select s.title,B.title, s.songlength
from song s
join album b on s.albumid = b.id
where s.Songlength = (select max(s.songlength) from song s)



