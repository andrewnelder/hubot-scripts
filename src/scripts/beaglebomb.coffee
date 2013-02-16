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
        output_photos = []
        data = JSON.parse(body)
        for response in data.response
          do (response) ->
            for photo in response.photos
              do (photo) ->
                output_photos.push photo.original_size.url
        msg.send output_photos.join('\n')
