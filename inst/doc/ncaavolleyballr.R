## -----------------------------------------------------------------------------
#| label: setup
library(ncaavolleyballr)


## -----------------------------------------------------------------------------
#| label: findteamname
find_team_name("Neb")


## -----------------------------------------------------------------------------
#| label: findteamid
find_team_id("Nebraska", 2024)


## -----------------------------------------------------------------------------
#| label: findteamid-vector
find_team_id("Nebraska", 2020:2024)
find_team_id(c("Nebraska", "Wisconsin"), 2024)
find_team_id(c("Nebraska", "Wisconsin"), 2020:2024)


## -----------------------------------------------------------------------------
#| label: teamseasoninfo
(neb2024team <- find_team_id("Nebraska", 2024) |>
   team_season_info())


## -----------------------------------------------------------------------------
#| label: meanattendance
neb2024team$schedule |>
  dplyr::pull(Attendance) |>
  sub(",", "", x = _) |>
  as.numeric() |>
  mean()


## -----------------------------------------------------------------------------
#| label: teamseasonstats
team_season_stats(team = "Nebraska")


## -----------------------------------------------------------------------------
#| label: teamseasonstats-opponent
team_season_stats(team = "Nebraska", opponent = TRUE)


## -----------------------------------------------------------------------------
#| label: stat-table
data.frame(Stat = colnames(team_season_stats(team = "Nebraska"))[4:20],
           Description = c("Sets played", "Kills", "Attack errors", "Attacks", 
                           "Hit percentage [(kills-errors)/attacks]", "Assists",
                           "Ace serves", "Service errors", "Digs", 
                           "Reception attempts", "Reception errors", 
                           "Solo blocks", "Block assists", "Block errors", 
                           "Points", "Ball handling errors", "Triple doubles"))


## -----------------------------------------------------------------------------
#| label: playerseasonstats
find_team_id("Nebraska", 2024) |>
  player_season_stats()


## -----------------------------------------------------------------------------
#| label: playerseasonstats-teamstats
find_team_id("Nebraska", 2024) |>
  player_season_stats(team_stats = FALSE)


## ----eval=FALSE, echo=FALSE---------------------------------------------------
#| label: stats-table2
# data.frame(Stat = names(player_season_stats(find_team_id("Nebraska", 2024)))[11:29],
#            Description = c("Games played", "Games started", "Sets played",
#                            "Kills", "Attack errors", "Attacks",
#                            "Kill percentage [(kills-errors)/attacks]",
#                            "Assists", "Ace serves", "Service errors", "Digs",
#                            "Reception attempts", "Reception errors",
#                            "Solo blocks", "Block assists", "Block errors",
#                            "Points", "Ball handling errors", "Triple doubles"))


## -----------------------------------------------------------------------------
#| label: teammatchstats
find_team_id(team = "Nebraska", year = 2024) |>
  team_match_stats()


## -----------------------------------------------------------------------------
#| label: findteamcontests
(neb2024contests <- find_team_id(team = "Nebraska", year = 2024) |>
  find_team_contests())


## -----------------------------------------------------------------------------
#| label: playermatchstats
player_match_stats(contest = "6080708")


## -----------------------------------------------------------------------------
#| label: playermatchstats-team-teamstats
player_match_stats(contest = "6080708", team = "Nebraska", team_stats = FALSE)


## -----------------------------------------------------------------------------
#| label: matchpbp
match_pbp(contest = "6080708") |>
  head(20) # cut this off, because it has 1525 rows!


## -----------------------------------------------------------------------------
#| label: groupstats-season
group_stats(teams = c("Nebraska", "Wisconsin"), year = 2023:2024, level = "season")


## -----------------------------------------------------------------------------
#| label: conferencestats
conference_stats(year = 2024, conf = "Big Ten", level = "season")

