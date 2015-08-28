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
  @venues = Venue.all()
  erb(:view_band)
end

post("/bands:id") do
  name = params.fetch('name')
  venue = Venue.create(:name => name)
  @venues = Venue.all()
  redirect("/bands/#{@new_band.id()}")
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
  redirect("/bands")
end

get("/venues") do
  @venues = Venue.all()
  erb(:venues)
end

post("/venues") do
  name = params.fetch("name")
  venue = Venue.new({:name => name})
  venue.save()
  @venues = Venue.all()
  redirect("/venues")
end

get('/venues/:id') do
  @new_venue = Venue.find(params.fetch('id').to_i)
  erb(:view_venue)
end
