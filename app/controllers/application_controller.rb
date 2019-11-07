require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    if @user = User.find_by(username: params["username"], password: params["password"])
      session[:user_id] = @user.id
      redirect to '/account' # is "redirect to" needed here?
    else
      erb :error
    end
    # @user = User.find_by(username: params["username"], password: params["password"])
    # erb :error if @user == nil
    # session[:user_id] = @user.id
    # redirect '/account' # is "redirect to" needed here?
  end

  get '/account' do
    @user = User.find(session[:user_id])
    erb :account
  end

  get '/logout' do

  end


end
