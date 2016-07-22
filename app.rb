class RedmarkSinatraApp < Sinatra::Base
  get '/' do
    erb '<h2>Redmart Sinatra</h2>'
  end

  get '/aboutme' do
    erb :aboutme
  end

  get '/users' do
    @users = User.all
    erb :'/users/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  get '/users/:id' do
    @user_id = params[:id]
    @user = User.find(params[:id])
    @columns = User.column_names
    @table = User.table_name
    erb :'users/show'
  end

  get '/users/:id/edit' do
    @user = User.find(params[:id])
    @user.update_attributes()

    erb :'users/edit'
  end

  post '/users' do
    puts params[:user]
    # puts params
    # puts params[:name]
    # puts params[:address]
    # puts params[:email]

    @new_user = User.new( params[:user] )

    if @new_user.save
      # go to new user list
      redirect("/users")
    else
      #throw an error
      erb :"users/new"
    end

    # don't use this so we can test if the file is saved or not
    # User.create(
    #   name:
    # )
  end

  delete '/users/:id/delete' do
    Users.find( params[:id] ).destroy

    erb ""
  end


end
