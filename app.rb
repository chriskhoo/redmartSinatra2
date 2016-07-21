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

get '/users/:id' do
  @user_id = params[:id]
  @user = User.find(params[:id])
  @columns = User.column_names
  @table = User.table_name
  erb :'each_user'
end

end
