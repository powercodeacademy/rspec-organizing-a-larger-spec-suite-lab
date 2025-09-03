RSpec.shared_examples "a printable object" do 
  it "can be convereted into a string" do 
    expect(subject.to_s).to be_a(String) 
  end
end
