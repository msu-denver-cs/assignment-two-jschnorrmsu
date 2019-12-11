json.extract! car, :id, :model, :VIN, :country, :part, :make_id, :created_at, :updated_at
json.make_name Make.find_by_id(car.make_id).name
json.make_country Make.find_by_id(car.make_id).country
json.parts car.parts.map { |part| part.part}
json.url car_url(car, format: :json)
