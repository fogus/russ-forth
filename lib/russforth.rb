require 'pp'
require 'dogestrings'
require_relative 'lexicon'
require_relative 'compiler'
require_relative 'reader'

require_relative 'shufflers'
require_relative 'stack_ops'

class Russforth
  include Verbs::Shufflers
  include Verbs::StackOps

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
    @lexicon.import_words_from Verbs::StackOps, self

    @lexicon.alias_word('?dup', 'qdup')
    @lexicon.alias_word('.', 'dot')
  end

  def evaluate( word )
    entry = resolve_word(word)

    if entry
      entry[:block].call
    else
      @s_out.puts "#{word} ??"
    end
  end

  def resolve_word( word )
    return @lexicon[word] if @lexicon[word]

    x = to_number(word)

    if x
      block = proc { @stack << x }
      return { :name => word, :block => block, :immediate => false }
    end

    nil
  end

  def to_number( word )
    begin
      return Integer( word )
    rescue
      puts $!
    end
    begin
      return Float( word )
    rescue
      puts $!
    end
    nil
  end

  def run
    until $stdin.eof?
      @s_out.flush
      word = @reader.read_word
      evaluate word
    end
  end
end

