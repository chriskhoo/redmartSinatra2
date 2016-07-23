class RedmarkSinatraApp < Sinatra::Base
# fixed pages
  get '/' do
    erb :home
  end

  get '/about' do
    erb :about
  end

# dynamic pages
# users ----------------------------------------
  get '/users' do
    @users = User.all.order('id')
    erb :'/users/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  get '/users/:id' do
    # if params[:id] == 'new'
    #   erb :'users/new'
    # else
    @user_id = params[:id]
    @user = User.find(params[:id])
    @columns = User.column_names
    @table = User.table_name
    erb :'users/show'
    # end
  end

  get '/users/:id/edit' do
    @user = User.find(params[:id])
    erb :'users/edit'
  end

  post '/users' do
    puts params[:user]
    # puts params
    # puts params[:name]
    # puts params[:address]
    # puts params[:email]

    @new_user = User.new( params[:user] )
    @new_user[:name] =  @new_user[:name].downcase.split.map(&:capitalize).join(' ')

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

  put '/users/:id' do
    # find user
    @edited_user = User.find( params[:id] )
    # capitalize the name
    params[:user][:name] = params[:user][:name].downcase.split.map(&:capitalize).join(' ')
    # get user details from form
    if @edited_user.update_attributes( params[:user] )
      # go back to users page
      redirect("/users")
    else
      # redirect("/users/#{params[:id]}/edit")
    end
  end

  delete '/users/:id' do
    @deleted_user = User.find( params[:id] )
    if @deleted_user.destroy
      redirect("/users")
    else
      erb :"/users/#{@deleted_user.id}"
    end
  end

# products ----------------------------------------
  get '/products' do
    @products = Product.all.order('id')
    erb :'/products/index'
  end

  get '/products/new' do
    erb :'products/new'
  end

  get '/products/:id' do
    @product_id = params[:id]
    @product = Product.find(params[:id])
    @columns = Product.column_names
    @table = Product.table_name
    erb :'products/show'
  end

  get '/products/:id/edit' do
    @product = Product.find(params[:id])
    erb :'products/edit'
  end

  post '/products' do
    @new_product = Product.new( params[:product] )
    # put name in the correct form
    @new_product[:name] =  @new_product[:name].downcase.split.map(&:capitalize).join(' ')

    if @new_product.save
      redirect("/products")
    else
      erb :"products/new"
    end
  end

  put '/products/:id' do
    @edited_product = Product.find( params[:id] )
    # put name in the correct form
    params[:product][:name] = params[:product][:name].split.map(&:capitalize).join(' ')
    if @edited_product.update_attributes( params[:product] )
      redirect("/products")
    else
      erb :"products/#{params[:id]}"
    end
  end

  delete '/products/:id' do
    @deleted_product = Product.find( params[:id] )
    if @deleted_product.destroy
      redirect("/products")
    else
      erb :"/products/#{@deleted_product.id}"
    end
  end

# categories ----------------------------------------
  get '/categories' do
    @categories = Category.all.order('id')
    erb :'/categories/index'
  end

  get '/categories/new' do
    erb :'categories/new'
  end

  get '/categories/:id' do
    @category_id = params[:id]
    @category = Category.find(params[:id])
    @columns = Category.column_names
    @table = Category.table_name
    erb :'categories/show'
  end

  get '/categories/:id/edit' do
    @category = Category.find(params[:id])
    erb :'categories/edit'
  end

  post '/categories' do
    @new_category = Category.new( params[:category] )
    # put name in the correct form
    @new_category[:name] =  @new_category[:name].downcase.split.map(&:capitalize).join(' ')

    if @new_category.save
      redirect("/categories")
    else
      erb :"categories/new"
    end
  end

  put '/categories/:id' do
    @edited_category = Category.find( params[:id] )
    # put name in the correct form
    params[:category][:name] = params[:category][:name].split.map(&:capitalize).join(' ')
    if @edited_category.update_attributes( params[:category] )
      redirect("/categories")
    else
      erb :"categories/#{params[:id]}"
    end
  end

  delete '/categories/:id' do
    @deleted_category = Category.find( params[:id] )
    if @deleted_category.destroy
      redirect("/categories")
    else
      erb :"/categories/#{@deleted_category.id}"
    end
  end

  # brands ----------------------------------------
    get '/brands' do
      @brands = Brand.all.order('id')
      erb :'/brands/index'
    end

    get '/brands/new' do
      erb :'brands/new'
    end

    get '/brands/:id' do
      @brand_id = params[:id]
      @brand = Brand.find(params[:id])
      @columns = Brand.column_names
      @table = Brand.table_name
      erb :'brands/show'
    end

    get '/brands/:id/edit' do
      @brand = Brand.find(params[:id])
      erb :'brands/edit'
    end

    post '/brands' do
      @new_brand = Brand.new( params[:brand] )
      # put name in the correct form
      @new_brand[:name] =  @new_brand[:name].downcase.split.map(&:capitalize).join(' ')

      if @new_brand.save
        redirect("/brands")
      else
        erb :"brands/new"
      end
    end

    put '/brands/:id' do
      @edited_brand = Brand.find( params[:id] )
      # put name in the correct form
      params[:brand][:name] = params[:brand][:name].split.map(&:capitalize).join(' ')
      if @edited_brand.update_attributes( params[:brand] )
        redirect("/brands")
      else
        erb :"brands/#{params[:id]}"
      end
    end

    delete '/brands/:id' do
      @deleted_brand = Brand.find( params[:id] )
      if @deleted_brand.destroy
        redirect("/brands")
      else
        erb :"/brands/#{@deleted_brand.id}"
      end
    end

end
