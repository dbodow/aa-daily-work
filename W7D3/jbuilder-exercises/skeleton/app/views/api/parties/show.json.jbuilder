json.extract! @party, :name, :location
json.guests @party.guests do |guest|
  json.partial! 'api/guests/guest', guest: guest
  json.set! :gifts, guest.gifts do |gift| 
    json.partial! 'api/gifts/gift', gift: gift
  end 
end