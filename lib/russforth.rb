require 'pp'
require 'dogestrings'
require 'shufflers'
require 'lexicon'

class Russforth
  include Verbs::Shufflers

  def initialize( s_in = $stdin, s_out = $stdout )
    @s_in = s_in
    @s_out = s_out
    @lexicon = Lexicon.new
    @reader = Reader.new( @s_in )
    @compiler = Compiler.new( @lexicon )
    @stack = []
    build_lexicon
  end

  def build_lexicon
    @lexicon.import_words_from Verbs::Shufflers, self

    @lexicon.alias_word('?dup', 'qdup')
  end

  
end
