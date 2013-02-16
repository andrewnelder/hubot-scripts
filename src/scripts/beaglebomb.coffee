# Description:
#   Beagle bombs!
#
# Commands:
#   beagle bomb <n>


module.exports = (robot) ->
  robot.respond /beagle bomb( (\d+))?/i, (msg) ->
    count = msg.match[2]-1 || 5
    msg.http("http://api.tumblr.com/v2/tagged?tag=beagle+puppy&api_key=wP7Zp7uiqJPwFJ4muezAOMtAzHE3fEn3AZb0T8XcZEnlTFBN4M")
      .get() (err, res, body) ->
        data = JSON.parse(body)
        photos = (photo.url for photo in data.photos)
        photos = photos[0..count]
        msg.send photos.join('\n')
