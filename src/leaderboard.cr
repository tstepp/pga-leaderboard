require "http/client"
require "json"
require "./player"

class LeaderboardFetch
  JSON.mapping({
    players: Array(Player)
  })
end

class Leaderboard
  @@json_url_base     = "http://www.pgatour.com/data/r/"
  @@json_url_filename = "leaderboard-v2mini.json"
  @players : Array(Player)

  def initialize
    @json_url_counter = "014"
    @current_year = "#{Time.now.year}"
    @players = [] of Player
  end

  def json_url : String
    "#{@@json_url_base}#{@json_url_counter}/#{@current_year}/#{@@json_url_filename}"
  end

  def fetch
    response = HTTP::Client.get(self.json_url)
    fetch = LeaderboardFetch.from_json(response.body, "leaderboard")
    @players = fetch.players
  end

  def players
    @players
  end

  def tourney_name
    @fetch.leaderboard.players
  end
end
