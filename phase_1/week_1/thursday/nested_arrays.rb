# original gist : https://gist.github.com/b035cd6a14b87d8da2df

  

### Chess Board Solution ###
@board = {}
def generate_board
	8.times do |row|
		8.times do |column|
			@board[[row,column]] = "B Pawn" if row == 1
			@board[[row,column]] = "W Pawn" if row == 6

			@board[[row,column]] = "B King" if row.zero? && column == 4
			@board[[row,column]] = "W King" if row == 7 && column == 4

			@board[[row,column]] = "B Queen" if row.zero? && column == 3
			@board[[row,column]] = "W Queen" if row == 7 && column == 3

			location = @board[[row,column]]
			fill_with_pieces(row,column,[0,7],"Rook")
			fill_with_pieces(row,column,[1,6],"Knight")
			fill_with_pieces(row,column,[2,5],"Bishop")
		end
	end
end

def fill_with_pieces(row, column, column_checks, piece_name)
	if (column == column_checks[0] || column == column_checks[1]) 
		@board[[row,column]] = "B #{piece_name}" if row.zero?
		@board[[row,column]] = "W #{piece_name}" if row == 7
	end
end


### What you were actually asking for with the chess board solution... :( ###
#
#[["B Rook"] ["B Knight"] ["B Bishop"] ["B Queen"] ["B King"] ["B Bishop"] ["B Knight"] ["B Rook"] 
# ["B Pawn"] ["B Pawn"]   ["B Pawn"]   ["B Pawn"]  ["B Pawn"] ["B Pawn"]   ["B Pawn"]   ["B Pawn"] 
# [2,0]      [2,1]        [2,2]        [2,3]       [2,4]      [2,5]        [2,6]        [2,7]
# [3,0]      [3,1]        [3,2]        [3,3]       [3,4]      [3,5]        [3,6]        [3,7]       
# [4,0]      [4,1]        [4,2]        [4,3]       [4,4]      [4,5]        [4,6]        [4,7]
# [5,0]      [5,1]        [5,2]        [5,3]       [5,4]      [5,5]        [5,6]        [5,7]
# ["W Pawn"] ["W Pawn"]   ["W Pawn"]   ["W Pawn"]  ["W Pawn"] ["W Pawn"]   ["W Pawn"]   ["W Pawn"] 
# ["W Rook"] ["W Knight"] ["W Bishop"] ["W Queen"] ["W King"] ["W Bishop"] ["W Knight"] ["W Rook"]]


### Data Table Solution ###


data = [[["Number"], ["Name"], ["Position"], ["Points per Game"]],
		[[12], ["Joe Schmo"], ["Center"], [ [14, 32, 7, 0, 23] ]],
 		[[9 ], ["Ms. Buckets"], ["Point Guard"], [ [19, 0, 11, 22, 0] ]],
 		[[31], ["Harvey Kay"], ["Shooting Guard"], [ [0, 30, 16, 0, 25] ]],
 		[[18], ["Sally Talls"], ["Power Forward"], [ [18, 29, 26, 31, 19]]],
 		[[22], ["MK DiBoux"], ["Small Forward"], [ [11, 0, 23, 17, 0] ]]]

puts data[3][2] #== "Shooting Guard"      # outputs true
puts data[1][3] #== [14, 32, 7, 0, 23]    # outputs true