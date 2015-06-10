module.exports = (robot) ->
  robot.hear /^.*/, (msg) ->
    Sequelize = require 'sequelize'
    sequelize = new Sequelize 'heroku_7240a6ac4f56953', 'bc64e4cd1e363a', '8166dc34',
      host: 'us-cdbr-iron-east-02.cleardb.net',
      logging: false

    Row = sequelize.define 'Row',
      name: Sequelize.STRING
      text: Sequelize.STRING
      room: Sequelize.STRING
    sequelize.sync()

    day = new Date
    row =  Row.build
      name: msg.message.user.name
      text: msg.message.text
      room: msg.message.room
    row.save()

  robot.router.get '/', (req, res) ->
    html = """
      <html>
        aaaaaaaaaaaaaaa
        aaaaaaaaaaaaaaa
      </html>
    """
    res.type 'html'
    res.send html
