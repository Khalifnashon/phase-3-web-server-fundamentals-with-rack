require 'rack'
require "pry"

class App
  def call(env)
    # make our server more dynamic and set it up to send back different 
    # responses based on the path.
    # This conditional logic based on the path (and also the HTTP verb, 
    # as we'll see later) is known as routing, and it's is basically what 
    # web servers do all day long
    path = env["PATH_INFO"]

    if path == "/"
      [200, { "Content-Type" => "text/html" }, ["<h2>Hello <em>World</em>!</h2>"]]
    elsif path == "/potato"
      [200, { "Content-Type" => "text/html" }, ["<p>Boil 'em, mash 'em, stick 'em in a stew</p>"]]
    else
      [404, { "Content-Type" => "text/html" }, ["Page not found"]]
    end
  end
end

# When we run this code, Rack will essentially run in a loop in the background
# waiting for a request to come in. When it receives a request, it will call the 
# #call method and pass in data about the request, so we can send back the appropriate 
# response.
run App.new