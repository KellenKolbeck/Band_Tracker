require("spec_helper")

describe(Band) do
  it("will validate prescence of name") do
    category = Band.new({:name => ""})
    expect(category.save()).to(eq(false))
  end
end
