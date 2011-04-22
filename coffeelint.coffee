argv =  require('optimist').argv
fs = require 'fs'

String::isWhiteSpace = () ->
  /^\s+$/.test this

String::indentation = () ->
  this.split((/\S/))[0]

checkStyle = (filename, line, str) ->
  printError = (msg) ->
    console.log "#{filename}:#{line} #{msg}"

  if str.length > 80
    printError "Line is > 80 characters long."

  if str.length > 0 and str[str.length-1].isWhiteSpace()
    printError "Line ends in whitespace."

  if /\t/.test str.indentation()
    printError "Tab found in indentation, only spaces allowed."

argv._.forEach (filename) ->
  fs.readFile filename, "utf8", (err, data) ->
    lines = data.split('\n')
    for i in [0...lines.length]
      checkStyle(filename, i+1, lines[i])
