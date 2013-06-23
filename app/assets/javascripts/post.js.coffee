class @Post
  constructor: (data) ->
    @id = data.id
    @title = data.title
    @url = data.url
    @author = data.author
    @content = data.content