require 'mlb'

user_model     = RailsAdmin::AbstractModel.new(User)
project_model     = RailsAdmin::AbstractModel.new(Project)
case_model     = RailsAdmin::AbstractModel.new(Case)
tabela_model     = RailsAdmin::AbstractModel.new(Tabela)
# league_model   = RailsAdmin::AbstractModel.new(League)
# division_model = RailsAdmin::AbstractModel.new(Division)
# team_model     = RailsAdmin::AbstractModel.new(Team)
# player_model   = RailsAdmin::AbstractModel.new(Player)

user_model.new(:email => 'tom.jrc@gmail.com', :password => '123456', :password_confirmation => '123456').save

project_model.new(:name => 'PRODEB - SIGER', :active => 1).save

case_model.new(:name => 'RF-050 MANTER EQUIPAMENTO', :active => 1, :project_id => 1 ).save

tabela_model.new(:name => 'GEO_EQUIPAMENTO', :active => 1, :project_id => 1 ).save

# MLB::Team.all.each do |mlb_team|
#   unless league = league_model.where(:name => mlb_team.league).first
#     league = league_model.new(:name => mlb_team.league)
#     league.save
#   end
#   unless division = division_model.where(:name => mlb_team.division).first
#     division = division_model.new(:name => mlb_team.division, :league => league)
#     division.save
#   end
#   unless team = team_model.where(:name => mlb_team.name).first
#     team = team_model.new(:name => mlb_team.name, :logo_url => mlb_team.logo_url, :manager => mlb_team.manager, :ballpark => mlb_team.ballpark, :mascot => mlb_team.mascot, :founded => mlb_team.founded, :wins => mlb_team.wins, :losses => mlb_team.losses, :win_percentage => ("%.3f" % (mlb_team.wins.to_f / (mlb_team.wins + mlb_team.losses))).to_f, :division => division)
#     team.save
#   end
#   mlb_team.players.reject{|player| player.number.nil?}.each do |player|
#     player_model.new(:name => player.name, :number => player.number, :position => player.position, :team => team).save
#   end
# end

# puts "Seeded #{league_model.count} leagues, #{division_model.count} divisions, #{team_model.count} teams and #{player_model.count} players"
