require 'pp'
require 'dogestrings'
require_relative 'lexicon'
require_relative 'compiler'
require_relative 'reader'

require_relative 'shufflers'
require_relative 'stack_ops'
require_relative 'io'
require_relative 'math'

class Russforth
  include Verbs::Shufflers
  include Verbs::StackOps
  include Verbs::Io
  include Math::Arithmetic

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
    @lexicon.import_words_from Verbs::Io, self
    @lexicon.import_words_from Math::Arithmetic, self

    @lexicon.alias_word('?dup', 'qdup')
    @lexicon.alias_word( '+', 'plus' )
    @lexicon.alias_word( '*', 'mult' )
    @lexicon.alias_word( '-', 'subtract' )
    @lexicon.alias_word( '/', 'divide' )
    @lexicon.alias_word('.', 'dot')
    @lexicon.alias_word('.S', 'dot_s')

    @lexicon.define_word(':') { read_and_define_word }
    @lexicon.define_word('bye') { exit }
  end

  def evaluate( word )
    entry = resolve_word(word)

    if entry
      entry[:block].call
    else
      @s_out.puts "#{word} ??"
    end
  end

  def read_and_define_word
    name = @reader.read_word
    words = []

    while (word = @reader.read_word)
      break if word == ';'
      words << word
    end

    p = @compiler.compile_words(self, *words)
    @dictionary.define_word(name, &p)
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

