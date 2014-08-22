
require 'sinatra'
require 'erb'
require 'open-uri'

set :public, File.dirname(__FILE__) + '/public'

get '/' do
  erb :index
end


helpers do

  # Get the page following the question mark
  def get_url(urltext = request.url)
    return "" unless urltext.include? "?"
    page = urltext.split('?').last
    return page
  end

  # Convert \n, \t and other meta characters
  def parse(content)
    content.gsub('"', '\"').gsub("\t", "\\t").gsub("\n", "\\n").gsub("\r", "\\r")
  end

  # Get the content of the textile remote file
  def get_content(url)
    open(url) do |src|
      return parse(src.read)
    end
  rescue
    return ""
  end
end

# How to run Sinatra
# $ gem install sinatra
# $ ruby -rubygems textile.rb
