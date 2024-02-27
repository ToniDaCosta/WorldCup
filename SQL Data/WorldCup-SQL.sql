
# Slide 1 Winner_count by Country

SELECT winner, COUNT(winner) AS winner_count
FROM worldcup.worldcups
GROUP BY winner
ORDER BY winner_count DESC;

# Slide 2 Finals / Semi-Finals

SELECT winning_team, COUNT(winning_team) AS final_count
FROM wcmatches
WHERE stage = "Final"
GROUP BY winning_team
ORDER BY final_count DESC;
-----------------------------------
SELECT winning_team, COUNT(winning_team) AS semifinal_count
FROM wcmatches
WHERE stage = "Semifinals"
GROUP BY winning_team
ORDER BY semifinal_count DESC;

# Slide 3 Number of Hosted World Cups

SELECT host, COUNT(host) AS cups_hosted
FROM worldcup.worldcups
GROUP BY host
ORDER BY cups_hosted DESC;

# Slide 4 Count of contry in finals per year
 
SELECT winning_team, COUNT(DISTINCT year) AS year_count
FROM wcmatches
WHERE winning_team IS NOT NULL
GROUP BY winning_team
ORDER BY year_count DESC;

# Slide 5 Number of Teams, Games and Goals Scored by year.

SELECT year, sum(teams), sum(games), sum(goals_scored) AS goals_Scored
FROM worldcup.worldcups
GROUP BY year 
ORDER BY year DESC;

# Slide 6 Winner by year, others positions and city with attendance.

SELECT worldcups.year,
       worldcups.winner,
       worldcups.host,
       worldcups.second,
       worldcups.third,
       worldcups.fourth,
       wcmatches.city,
       worldcups.attendance
FROM worldcups
JOIN wcmatches ON worldcups.year = wcmatches.year
ORDER BY worldcups.year DESC;

# Slide 7 Sum of attendance by year and country

SELECT
    wcmatches.year,
    wcmatches.country,
    wcmatches.winning_team,
    worldcups.second,
    worldcups.third,
    worldcups.fourth,
    SUM(worldcups.attendance) AS total_attendance
FROM
    wcmatches
JOIN
    worldcups ON wcmatches.year = worldcups.year
WHERE
    worldcups.attendance IS NOT NULL
GROUP BY
    wcmatches.year, wcmatches.country, wcmatches.winning_team, worldcups.second, worldcups.third, worldcups.fourth
ORDER BY
    wcmatches.year DESC, total_attendance DESC;
