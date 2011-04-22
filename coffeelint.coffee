argv =  require('optimist').argv
fs = require 'fs'

String::isWhiteSpace = () ->
  /^\s+$/.test this

checkStyle = (filename, line, str) ->
  printError = (msg) ->
    console.log "#{filename}:#{line} #{msg}"

  # Assure each line is less than 80 charachters long
  if str.length > 80
    printError "Line is > 80 characters long."

  if str.length > 0 and str[str.length-1].isWhiteSpace()
    printError "Line ends in whitespace."

argv._.forEach (filename) ->
  fs.readFile filename, "utf8", (err, data) ->
    lines = data.split('\n')
    for i in [0...lines.length]
      checkStyle(filename, i+1, lines[i])
