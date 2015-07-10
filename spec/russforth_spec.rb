require File.expand_path(File.dirname(__FILE__) + '/spec_helper')



describe "Lexicon" do
  lexicon = Lexicon.new

  it "is a thing" do
    expect(lexicon).to be_truthy
  end
end

