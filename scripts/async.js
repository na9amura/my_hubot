module.exports = (robot => {
  robot.respond(
    /dm:send\s+([^\s]+)\s(.+)/,
    async res => {
      const dm_to_name = res.match[1]
      const text = res.match[2]
      const dm_to = robot.adapter.client.rtm.dataStore.getUserByName(dm_to_name)
      if (!dm_to) { return }

      const im = await robot.adapter.client.web.im.open(user.id)
      await robot.adapter.client.web.chat.postMessage(
        im.channel.id,
        text,
        { as_user: true }
      )
      res.send('ok!')
    }
  )
})
