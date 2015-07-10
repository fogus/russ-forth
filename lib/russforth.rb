require 'pp'
require 'dogestrings'
require_relative 'shufflers'
require_relative 'lexicon'
require_relative 'compiler'
require_relative 'reader'

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

  def evaluate( word )
    entry = @compiler.resolve_word(word)

    if entry
      entry[:block].call
    else
      @s_out.puts "#{word} ??"
    end
  end

  def run
    until $stdin.eof?
      @s_out.flush
      word = read_word
      evaluate word
    end
  end
end

