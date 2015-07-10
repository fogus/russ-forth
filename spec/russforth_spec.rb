require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

class RFMock
  include Verbs::Shufflers

  def initialize( lex )
    @lexicon = lex
    @lexicon.import_words_from Verbs::Shufflers, self
  end
end


describe "Lexicon" do
  lexicon = Lexicon.new
  mock = RFMock.new( lexicon )

  it "can be seeded" do
    expect(lexicon).to be_truthy
    expect(lexicon['dup'][:name]).to eq "dup"
    expect(lexicon['dup'][:immediate]).to be false
    expect(lexicon['dup'][:block]).to be_truthy
  end
end

