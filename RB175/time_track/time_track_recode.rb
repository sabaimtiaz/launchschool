require 'sinatra'
require 'sinatra/content_for'
require 'tilt/erubis'
require 'sinatra/reloader' if development?
require 'pry'
require 'date'
require 'csv'

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


def show_record
  session[:records].each { |hsh| hsh }
end

post '/all_records' do 
 check_for_entry_errors
 session[:records] << {id: (params[:id].to_i + 1), project: params[:project], task: params[:task], rate: params[:rate], starttime: Time.now }
 redirect '/live_track'
end

post 'all_records/:project/delete' do
  delete_record(params[:project])
  redirect '/'
end

get '/all_records/:project' do 

  project = params[:project]
  session[:message] = "You're viewing #{project}, a part of #{session[:records]}"

end

post '/all_records/:project/delete' do
  project = params[:project]
  delete_record(session[:records], project)
  session[:records].delete_if { |hsh| hsh[:project] == project }
  session[:message] = "#{project} has been deleted."
  redirect '/all_records'
end

def delete_record(hsh, record)
  hsh.delete_if {|h| h[:record] == record }
end

def check_for_entry_errors
   if params[:rate].to_i == 0
    session[:error] = "Please enter a number for the rate"
    redirect '/live_track/new'
  elsif params[:project].length <= 1 || params[:task].length <= 1
    session[:error] = "The field needs to have more than 1 characters"
  # check to see we dont have the same project here
    redirect '/live_track/new'
  }
  end
end

get '/live_track/end' do
  @current = session[:records][-1]
  @current[:endtime] = Time.now
  session[:records][-1][:endtime] = Time.now
  session[:message] = "You finished #{@current[:task]} at #{@current[:endtime].strftime(%"%k:%M")}"
  #session[:records][-1][:pay] 
  @current = nil
  redirect '/all_records'
end


