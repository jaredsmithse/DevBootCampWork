get '/create' do 
	erb :create_note
end

post '/create_note' do 
	Note.create(params)
	redirect '/'
end


get '/update/:id' do 
	@note = Note.find(params[:id])
	erb :update_note
end

post '/update/:id' do 
	note = Note.find(params[:id])
	note.update_attributes(params)
end


get '/note/:id' do 
	@note = Note.find(params[:id])
	erb :note_view
end

get '/delete/:id' do 
	Note.delete(params[:id])
	redirect '/'
end