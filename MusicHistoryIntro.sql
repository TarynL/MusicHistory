SELECT s.Title,
       a.ArtistName
  FROM Song s
       LEFT JOIN Artist a on s.ArtistId = a.id;

SELECT * FROM genre;
     
INSERT INTO Genre (Name) VALUES ('Techno');

update genre
set name = 'Folk'
where Id = 1;