require("bundler/setup")
Bundler.require(:default)
require("./lib/category")
require("./lib/ingredient")
require("./lib/recipe")
require("./lib/instruction")
require('pry')

get("/") do
  erb(:index)
end
