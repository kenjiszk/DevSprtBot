module.exports = (robot) ->
  robot.hear /hello/, (msg) ->
    msg.reply msg.message.text

  robot.respond /hi/i, (msg) ->
    msg.reply "fuga"
