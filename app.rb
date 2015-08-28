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
