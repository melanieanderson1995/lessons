require "remembering_names"

describe Names do
  it "adds a name" do
    @name = name
    expect(subject.add_name).to eq "Name added"
  end
end
