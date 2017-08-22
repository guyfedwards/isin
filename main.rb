require 'socket'
require 'isin_code_generator'

server = TCPServer.new('0.0.0.0', 2345)

loop do
    socket = server.accept

    request = socket.gets

    STDERR.puts request

    response = IsinCodeGenerator.make("LU")

    socket.print "HTTP/1.1 200 OK\r\n" +
                 "Content-Type: text-plain\r\n" +
                 "Content-Length: #{response.bytesize}\r\n" +
                 "Connection: close\r\n"

    socket.print "\r\n"

    socket.print response

    socket.close
end
