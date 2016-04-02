json.array! @properties do |prop|
  json.name prop.title
  json.values do
   json.array! prop.values, :id, :value
 end
end
