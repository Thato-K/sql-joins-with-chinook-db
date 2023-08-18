-- SQLite
SELECT count(*) FROM artists;


SELECT * FROM genres;
SELECT count(*) FROM genres;

SELECT count(*) FROM playlists;

SELECT * FROM playlists
WHERE Name LIKE 'M%';

SELECT * FROM playlists
WHERE Name LIKE '%S';

SELECT * FROM artists
WHERE Name = 'Lost';

SELECT * FROM albums
WHERE ArtistId = 149;

-- find all albums for a given artist
SELECT * FROM artists
JOIN albums on artists.ArtistId = albums.ArtistId
WHERE artists.ArtistId = 17;

-- Find all the songs for a given Genre

SELECT * FROM tracks
WHERE GenreId = 6;

SELECT * FROM genres
JOIN tracks on genres.GenreId = tracks.GenreId
WHERE genres.Name = "Blues";

-- Find all the songs in a playlist - by playlist name
SELECT * FROM playlists
JOIN playlist_track 
    on playlist_track.PlaylistId = playlists.PlaylistId
JOIN tracks 
    on playlist_track.TrackId = tracks.TrackId
WHERE playlists.Name = 'Grunge';


-- Find all the artists for a given Genre
SELECT * FROM genres
JOIN artists on genres.GenreId
WHERE genres.Name = 'Rock';


SELECT
    DISTINCT artists.Name
    FROM genres
    JOIN tracks on tracks.GenreId = genres.GenreId
    JOIN albums on albums.AlbumId = tracks.AlbumId
    JOIN artists on artists.ArtistId =albums.ArtistId
    WHERE genres.Name = "Rock";
    

-- Find the Playlist with the most / least songs
SELECT playlists.Name, count(*) from playlists
JOIN playlist_track
ON playlists.PlaylistId = playlist_track.PlaylistId
GROUP BY playlists.Name
ORDER by count(*) ASC
LIMIT 1;

-- Find the total for a given invoice
SELECT * FROM invoices
WHERE invoiceId = 17;



-- Find the biggest/smallest invoice amounts

SELECT InvoiceId, Min(Total)
FROM invoices

SELECT InvoiceId, Max(Total)
FROM invoices

-- Find the artist with the most/least songs
SELECT
DISTINCT artists.Name, count(*) as TrackCount
FROM artists
JOIN albums on albums.ArtistId = artists.ArtistId
JOIN tracks on tracks.AlbumId = albums.AlbumId
GROUP BY artists.Name
ORDER BY TrackCount DESC
LIMIT 5;
-- OFFSET 5