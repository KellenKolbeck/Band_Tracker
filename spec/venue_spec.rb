require("spec_helper")

describe(Venue) do
  it("will validate prescence of name") do
    venue = Venue.new({:name => ""})
    expect(venue.save()).to(eq(false))
  end
  it("capitalizes the name of a venue") do
    venue = Venue.create(:name => "fillmore")
    expect(venue.name()).to(eq("Fillmore"))
  end
end
