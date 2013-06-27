get '/' do
  if params[:input]
    @input = params[:input] 
    @grandma = case_checker(@input)
  end
  erb :index
end
 
post '/grandma' do  
  case_checker(params[:user_input])
end
 
 
def case_checker(text)
  if text == text.upcase
    return "NO NOT SINCE 1943!"
  else
    return "HUH? SPEAK UP SONNY!"
  end
end