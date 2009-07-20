require 'rubygems'
require 'erb'
require 'rack'

class Joke

  #print_r and vardump for completeness  
  def vardump(o)
    o.inspect
  end
  
  def print_r(o)
    o.inspect
  end

  #support for array('s',1,4);
  def array(*arr)
    arr
  end

  #support for <? ?>
  def _preprocess(str)
    str = str.gsub('<?', '<%')
    str = str.gsub('?>', '%>')
  end

  #the rack interface
  def call(env)
    req = Rack::Request.new(env)
    path = env['REQUEST_PATH'].sub('/','')
    if path == ''
      path = 'index.rb'
    end
    if File.exists?(path)
      # $_GET, $_POST and $_REQUEST support
      eval('$_REQUEST,$_' << env['REQUEST_METHOD'] << '= req.params,req.params')
      response = ERB.new(_preprocess(File.read(path))).result(binding)
      # ensure data doesn't stick around between requests
      $_GET, $_POST, $_REQUEST = nil
      [200, {"Content-Type" => "text/html", "Content-Length" => response.length.to_s}, response]
    else
      [404, {"Content-Type" => "text/plain", "Content-Length" => '3'}, '404']
    end
  end
end

run Joke.new 
