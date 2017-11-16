json.extract! party, :name, :location
json.set! :guests, party.guests do |guest|
  json.partial! 'api/guests/guest', guest: guest
end