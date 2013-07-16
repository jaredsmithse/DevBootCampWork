get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  erb :new_event
end

post '/events/create' do
  new_event = Event.new(params)
  @params = params
  if new_event.save
  	puts "success"
  else
  	@errors = new_event.errors
  end
  erb :new_event
end
