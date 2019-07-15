#!/usr/local/bin/python3
import socket
from http.server import BaseHTTPRequestHandler, HTTPServer

hostName = ''
hostPort = 80

class MyServer(BaseHTTPRequestHandler):
    def do_GET(self):
        self.server_name = socket.gethostname()
        # for mac compatibility
        self.server_name = self.server_name + '.local'
        self.server_ip = socket.gethostbyname(self.server_name)
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.body = 'hostname: ' + self.server_name + '   ip: ' + self.server_ip + '\n'
        self.wfile.write(self.body.encode('utf-8'))

webServer = HTTPServer((hostName, hostPort), MyServer)
webServer.serve_forever()
