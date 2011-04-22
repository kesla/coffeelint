argv =  require('optimist').argv
fs = require 'fs'

checkStyle = (filename, line, str) ->
  # Assure each line is less than 80 charachters long
  if str.length > 80
    console.log "#{filename}:#{line} Lines should be <= 80 characters long"      

argv._.forEach (filename) ->
  fs.readFile filename, "utf8", (err, data) ->
    lines = data.split('\n')
    for i in [0...lines.length]
      checkStyle(filename, i+1, lines[i])
