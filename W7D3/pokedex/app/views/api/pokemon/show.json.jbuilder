json.pokemon do
  json.extract! @pokemon, :id, :name, :attack, :defense, :image_url, :poke_type, :moves
end

json.set! :items, @pokemon.items do |item|
  json.extract! item, :id, :name, :pokemon_id, :price, :happiness, :image_url
end
