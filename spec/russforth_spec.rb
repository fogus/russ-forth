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

  puts lexicon['dup'].to_s

  it "is a thing" do
    expect(lexicon).to be_truthy
  end
end

