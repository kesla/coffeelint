argv =  require('optimist').argv
fs = require 'fs'

String::isWhiteSpace = () ->
  /^\s+$/.test this

String::indentation = () ->
  this.split((/\S/))[0]

String::last = () ->
  this[this.length-1]

# Remove strings from input, replace them with dummy variable
removeStrings = (input) ->
  input = input.replace /\\\"/g, ""
  input = input.replace /\\\'/g, ""
  input = input.replace /\"[^\"]*\"/g, "a"
  input = input.replace /\'[^\']*\'/g, "a"
  input

printError = (filename, lineNr, msg) ->
  console.log "#{filename}:#{lineNr} #{msg}"

checkStyle = (filename, lineNr, line) ->
  if line.length > 80
    printError filename, lineNr, "Line is > 80 characters long."

  if line.length > 0 and line.last().isWhiteSpace()
    printError filename, lineNr, "Line ends in whitespace."

  if /\t/.test line.indentation()
    printError filename, lineNr,
      "Tab found in indentation, only spaces allowed."

  clean = removeStrings line
  if (i = clean.indexOf("->")) isnt -1
    unless clean[i-1].isWhiteSpace()
      printError filename, lineNr,
        "No space before function declaration ('->')"
    unless i is clean.length - 2 or clean[i+2].isWhiteSpace()
      printError filename, lineNr,
        "No space or newline after function declaration ('->')."

argv._.forEach (filename) ->
  fs.readFile filename, "utf8", (err, data) ->
    lines = data.split('\n')
    checkStyle(filename, 0, lines[0])
    for i in [1...lines.length]
      checkStyle(filename, i+1, lines[i])
      if lines[i] is "" and lines[i-1] is ""
        printError filename, i, "Two empty lines found."
