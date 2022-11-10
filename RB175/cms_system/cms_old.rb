require 'sinatra'
require 'sinatra/content_for'
require 'tilt/erubis'
require 'sinatra/reloader' if development?
require 'redcarpet'

configure do 
  enable :sessions
  set :session_secret, 'super secret'
end


get '/' do
  @contents = Dir.open("data")
 # @files = @contents.map { |file| file }
  erb :index
end

get '/:filename/edit' do
  @filename = params[:filename]
  txt = "/data/" + @filename
  path = File.expand_path('..', __FILE__)

  file_path = path + txt
  @text = File.read(file_path)
  
  erb :edit
end

def data_path
  
  txt = "/" + params[:filename]
  if ENV["RACK_ENV"] == "test"
    path = File.expand_path('../test/data', __FILE__)
    file_path = path + txt
  else 
    path = File.expand_path('../data', __FILE__) 
    file_path = path + txt
  end
end

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

def view_file_content(path)
  content = File.read(path)
  case File.extname(path)
  when ".txt"
    headers["Content-Type"] = "text/plain"
    content
  when ".md"
    render_markdown(content)
  end
end

get '/:filename' do 
  if error_file_path(data_path)
    session[:message] = "#{params[:filename]} does not exist."
    redirect "/"
  else
    #headers["Content-Type"] = "text/plain"
    view_file_content(data_path)
  end
end

post '/:filename' do
  @text = File.write(data_path, params[:text])

  session[:message] = "#{params[:filename]} has been edited."
  redirect "/"
end

def error_file_path(path)
  !File.exist?(path)
 end
