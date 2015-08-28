require("bundler/setup")
Bundler.require(:default)
require("./lib/band")
require("./lib/venue")
require('pry')

get("/") do
  erb(:index)
end

get("/bands") do
  @bands = Band.all()
  erb(:bands)
end

post("/bands") do
  name = params.fetch("name")
  band = Band.new({:name => name})
  band.save()
  @bands = Band.all()
  redirect("/bands")
end

get('/bands/:id') do
  @new_band = Band.find(params.fetch('id').to_i)
  erb(:view_band)
end

patch('/bands/:id') do
  @new_band = Band.find(params.fetch('id').to_i)
  name = params.fetch('name')
  @new_band.update({:name => name})
  @new_band = Band.find(params.fetch('id').to_i)
  redirect("/bands/#{@new_band.id()}")
end

delete('/bands/:id') do
  @new_band = Band.find(params.fetch('id').to_i)
  @new_band.delete()
  @bands = Band.all()
  redirect("/categories")
end
