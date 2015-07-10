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
    @stack = []
    build_lexicon
  end

  def build_lexicon
    @lexicon.import_words_from Verbs::Shufflers, self
  end
end
