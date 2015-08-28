require("spec_helper")

describe(Venue) do
  it("will validate prescence of name") do
    category = Venue.new({:name => ""})
    expect(category.save()).to(eq(false))
  end
end
