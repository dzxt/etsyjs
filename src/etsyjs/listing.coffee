class Listing

  constructor: (@listingId, @client) ->

  # Retrieves listings by id
  # '/listings/:listing_id' GET
  find: ({token, secret}, cb) ->
    @client.get "/listings/#{@listingId}", token, secret, (err, status, body, headers) ->
      return cb(err) if err
      if status isnt 200
        cb(new Error('Get listings error'))
      else
        cb null, body, headers

  # Finds all active Listings.
  # '/listings/active' GET
  active: ({token, secret}, cb) ->
    @client.get "/listings/active", token, secret, (err, status, body, headers) ->
      return cb(err) if err
      if status isnt 200
        cb(new Error('Get trending listings error'))
      else
        cb null, body, headers

  # Collects the list of listings used to generate the trending listing page
  # '/listings/trending' GET
  trending: ({token, secret}, cb) ->
    @client.get "/listings/trending", token, secret, (err, status, body, headers) ->
      return cb(err) if err
      if status isnt 200
        cb(new Error('Get trending listings error'))
      else
        cb null, body, headers

  # Collects the list of interesting listings
  # '/listings/interesting' GET
  interesting: ({token, secret}, cb) ->
    @client.get "/listings/interesting", token, secret, (err, status, body, headers) ->
      return cb(err) if err
      if status isnt 200
        cb(new Error('Get interesting listings error'))
      else
        cb null, body, headers

module.exports = Listing