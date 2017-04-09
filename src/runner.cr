require "./leaderboard"
require "terminal_table"

table = TerminalTable.new
table.headings = ["TOTAL", "NAME", "TODAY"]

leaderboard = Leaderboard.new
leaderboard.fetch
leaderboard.players.each do |player|
  if player.today
    table << [player.total, player.full_name, "#{player.today} thru #{player.thru}"]
  end
end

puts table.render
