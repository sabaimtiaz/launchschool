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
    status 422
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
  @records = session[:records]
  erb :all_records, layout: :layout
end

post '/all_records' do 
 check_for_entry_errors
 params[:id] = session[:records].size 
 session[:records] << {id: params[:id], project: params[:project], task: params[:task], rate: params[:rate], starttime: Time.now.to_s }
 redirect '/live_track'
end

post '/all_records/:id/delete' do
  id = params[:id].to_i
  if session[:records].size == 1
    task = session[:records][0][:task]
    session[:records].delete_at(0)
    session[:message] = "#{task} has been deleted."
    redirect '/all_records'
  else
    task = session[:records][id][:task]
    session[:records].delete_at(id)
    session[:message] = "#{task} has been deleted."
    redirect '/all_records'
  end
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

def format_date(date)
  Time.parse(date)
end

def calculate_pay
  id = params[:id].to_i
  start = format_date(session[:records][id][:starttime])
  ending = format_date(session[:records][id][:endtime])
  (ending-start)/3600 * (session[:records][id][:rate].to_i).round(2)  
end

get '/live_track/:id/end' do
  id = params[:id].to_i
  session[:records][id][:endtime] = Time.now.to_s
  earnings = calculate_pay
  task = session[:records][id][:task]
  session[:message] = "You finished #{task} at #{Time.now.strftime(%"%k:%M")} and made $#{earnings.round(2)}"
  redirect '/live_track'
end
