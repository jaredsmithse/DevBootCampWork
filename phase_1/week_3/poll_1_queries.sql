#1
SELECT COUNT(politician_id) FROM votes
WHERE politician_id = 524;

#2
SELECT COUNT(votes.politician_id) FROM votes
JOIN congress_members ON votes.politician_id = congress_members.id
WHERE congress_members.name = 'Sen. Olympia Snowe'

#3
SELECT COUNT(votes.politician_id) FROM votes
JOIN congress_members ON votes.politician_id = congress_members.id
WHERE congress_members.name = 'Rep. Erik Paulsen';


#4
SELECT congress_members.name, COUNT(*) FROM votes
JOIN congress_members ON votes.politician_id = congress_members.id
GROUP BY congress_members.name
ORDER BY COUNT(*) DESC;

#5
SELECT congress_members.name, COUNT(*) FROM votes
JOIN congress_members ON votes.politician_id = congress_members.id
GROUP BY congress_members.name
ORDER BY COUNT(*) ASC;

#6
SELECT congress_members.name, COUNT(votes.politician_id) FROM votes
JOIN congress_members ON votes.politician_id = congress_members.id
GROUP BY votes.politician_id
ORDER BY COUNT(votes.politician_id) DESC LIMIT 1;
       

SELECT voters.first_name, voters.last_name, voters.gender, voters.party FROM voters
JOIN votes ON voters.id = votes.voter_id
WHERE votes.politician_id = 224
ORDER BY voters.first_name DESC, voters.last_name DESC;

#7
SELECT congress_members.name, congress_members.location, congress_members.grade_1996, COUNT(votes.politician_id) AS vote_count
FROM congress_members JOIN votes ON votes.politician_id = congress_members.id
WHERE congress_members.grade_current < 9
GROUP BY congress_members.name
ORDER BY vote_count;

#8
-- # Work in progress
-- SELECT congress_members.location FROM votes
-- JOIN congress_members ON congress_members.id = votes.politician_id
-- JOIN voters ON voters.id = votes.voter_id
-- GROUP BY congress_members.location
-- ORDER BY COUNT(votes.politician_id) DESC LIMIT 10

-- SELECT voters.*, congress_members.location  FROM votes
-- JOIN congress_members ON congress_members.id = votes.politician_id
-- JOIN voters ON votes.voter_id = voters.id
-- GROUP BY congress_members.location
-- ORDER BY COUNT(votes.politician_id) DESC LIMIT 10;

# final answer
SELECT voters.first_name, voters.last_name, location FROM voters
INNER JOIN (SELECT congress_members.location FROM votes
JOIN congress_members ON congress_members.id = votes.politician_id
JOIN voters ON voters.id = votes.voter_id
GROUP BY congress_members.location
ORDER BY COUNT(votes.politician_id) DESC LIMIT 10);

#9
SELECT voters.first_name, voters.last_name, COUNT(votes.voter_id) AS num_votes FROM voters
JOIN votes ON voters.id = votes.voter_id
GROUP BY voters.id
HAVING num_votes > 2
ORDER BY num_votes DESC;

#10
SELECT voters.first_name, voters.last_name, congress_members.name, COUNT(votes.politician_id) AS num_votes 
FROM votes JOIN voters ON voters.id = votes.voter_id
JOIN congress_members ON congress_members.id = votes.politician_id
GROUP BY voters.id
HAVING num_votes > 1
ORDER BY num_votes DESC;



