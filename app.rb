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

post("/bands/:id/venues") do
  name = Venue.find(params.fetch("name"))
  venue = Venue.create(:name => name)
  @new_band = Band.find(params.fetch('id').to_i)
  @new_venue = Venue.find(params.fetch('id').to_i)
  @venues = Venue.all()
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
  @bands = Band.all()
  erb(:view_venue)
end

post("/venues/:id/bands") do
  name = Band.find(params.fetch("name"))
  band = Band.create(:name => name)
  @new_band = Band.find(params.fetch('id').to_i)
  @new_venue = Venue.find(params.fetch('id').to_i)
  @bands = Band.all()
  redirect("/venues/#{@new_venue.id()}")
end

patch('/venues/:id') do
  @new_venue = Venue.find(params.fetch('id').to_i)
  name = params.fetch('name')
  @new_venue.update({:name => name})
  @new_venue = Venue.find(params.fetch('id').to_i)
  redirect("/venues/#{@new_venue.id()}")
end

delete('/venues/:id') do
  @new_venue = Venue.find(params.fetch('id').to_i)
  @new_venue.delete()
  @venues = Venue.all()
  redirect("/venues")
end
