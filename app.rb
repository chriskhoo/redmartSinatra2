class RedmarkSinatraApp < Sinatra::Base

  get '/' do
    erb '<h2>Redmart Sinatra</h2>'
  end

  get '/users' do
    @users = User.all

    erb :'users'
end

get '/aboutme' do

  erb :'aboutme'
end

end
