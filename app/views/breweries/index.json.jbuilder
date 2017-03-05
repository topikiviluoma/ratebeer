json.array!(@breweries) do |brewery|
  json.extract! brewery, :id, :name
  json.amount do
    json.amount brewery.beers.count
  end
  json.founded do
    json.year brewery.year
  end
  json.active do
    json.active brewery.active?
  end


end