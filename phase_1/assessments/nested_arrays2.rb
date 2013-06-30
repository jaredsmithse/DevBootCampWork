### Tic Tac Toe Solution ###

def generate_tic_tac_toe
	x_or_o = ["X","O"]

	board_start = (0..9).to_a.map {|square| square = x_or_o[rand(x_or_o.length)]}

	final_board = Array.new(3) { board_start.shift(3) }

end

p generate_tic_tac_toe



### Convert Array Solution ###

def convert_roster_format(roster)
	array_of_entries = []
	headers = roster[0]
	(1..roster.size-1).each do |roster_index|
		array_to_be_converted = []
		(roster.size - 2).times do |header_index|
			array_to_be_converted << [headers[header_index],roster[roster_index][header_index]]
		end
		array_of_entries << Hash[array_to_be_converted]
	end
	array_of_entries
end


roster = 	[["Number", "Name", "Position", "Points per Game"],
["12","Joe Schmo","Center",[14, 32, 7, 0, 23] ],
["9", "Ms. Buckets ", "Point Guard", [19, 0, 11, 22, 0] ],
["31", "Harvey Kay", "Shooting Guard", [0, 30, 16, 0, 25] ], 
["7", "Sally Talls", "Power Forward ", [18, 29, 26, 31, 19] ], 
["22", "MK DiBoux ", "Small Forward ", [11, 0, 23, 17, 0] ]]

hashed_roster = convert_roster_format(roster)
expected_hash_at_2 = { 
	"Number" => "31", 
	"Name" => "Harvey Kay", 
	"Position" => "Shooting Guard", 
	"Points per Game" => [0, 30, 16, 0, 25] 
}
puts hashed_roster[2] == expected_hash_at_2
puts hashed_roster[0]["Name"] == "Joe Schmo"






