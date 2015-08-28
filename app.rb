require("bundler/setup")
Bundler.require(:default)
require("./lib/band")
require("./lib/venue")
require('pry')

get("/") do
  erb(:index)
end
