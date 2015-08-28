require("spec_helper")

describe(Band) do
  it("will validate prescence of name") do
    band = Band.new({:name => ""})
    expect(band.save()).to(eq(false))
  end

  it("capitalizes the name of a band") do
    band = Band.create(:name => "cream")
    expect(band.name()).to(eq("Cream"))
  end
end
