require 'sinatra'
require 'sinatra/content_for'
require 'tilt/erubis'
require 'sinatra/reloader' if development?
require 'pry'
require 'time'
require 'date'

configure do 
  enable :sessions
  set :session_secret, 'super secret'
end

before do 
  session[:records] ||= []
end

get '/' do
  erb :index, layout: :layout
end

get '/login' do
  erb :login, layout: :layout
end

post '/users/login' do
  session[:username] = params[:username]
  session[:password] = params[:password]
  if params[:username] == "admin" && params[:password] == "123456"
    session[:success] = "Logged in"
    redirect '/'
  else
    session[:error] = "Try again with the correct username and/or password"
    erb :login
  end
end

get '/all_records' do
  @records = session[:records]
  erb :all_records, layout: :layout
end

get '/live_track' do 
  @records = session[:records]
  @current = @records[-1] 
  erb :live_track, layout: :layout
end

get '/live_track/new' do 
  @current = nil
  erb :new_record, layout: :layout
end

get '/all_records' do 
  erb :all_records, layout: :layout
end

post '/all_records' do 
 check_for_entry_errors
 p check_duplicates(params[:project], params[:task])
 session[:records] << {id: (params[:id].to_i + 1), project: params[:project], task: params[:task], rate: params[:rate], starttime: Time.now.to_s }
 redirect '/live_track'
end

# get '/all_records/:project' do 
#   project = params[:project]
#   session[:message] = "You're viewing #{project}, a part of #{session[:records]}"
# end

post '/all_records/:task/delete' do
  task = params[:task]
  session[:records].delete_if { |hsh| hsh[:task] == task }
  session[:message] = "#{task} has been deleted."
  redirect '/all_records'
end

def check_for_entry_errors
  if params[:rate].to_i == 0
    session[:error] = "Please enter a number for the rate"
    redirect '/live_track/new'
  elsif params[:project].length <= 1 || params[:task].length <= 1
    session[:error] = "The field needs to have more than 1 characters"
    redirect '/live_track/new'
  end
end

def check_duplicates(project, task)
  session[:records].select { |hsh| hsh.value?(project) } 
end

def calculate_pay
  seconds = 3600
  rate = params[:rate]
  rate / seconds
end


# def calculate_time
#   @current = session[:records][-1]
#   start (Time.parse(@current[:endtime]).to_s) - (Time.parse(@current[:starttime]).to_s)
#   (endtime - starttime) / 3600
# end

get '/live_track/end' do
  @current = session[:records][-1]
  @current[:endtime] = Time.now
  session[:records][-1][:endtime] = Time.now
  #@current[:pay] = (time / 60) * pay
 # session[:records][-1][:pay] = @current[:pay]
  session[:message] = "You finished #{@current[:task]} at #{@current[:endtime].strftime(%"%k:%M")}."
  #You made #{@current[:pay]}"
  #session[:records][-1][:pay] 
  @current = nil
  redirect '/all_records'
end


