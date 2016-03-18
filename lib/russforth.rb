require 'pp'
require 'dogestrings'
require_relative 'lexicon'
require_relative 'compiler'
require_relative 'reader'

require_relative 'shufflers'
require_relative 'stack_ops'
require_relative 'io'
require_relative 'math'
require_relative 'comparators'
require_relative 'comb'

class Russforth
  include Verbs::Shufflers
  include Verbs::StackOps
  include Verbs::Io
  include Math::Arithmetic
  include Verbs::Comparators
  include Verbs::Combinators

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
    @lexicon.import_words_from Verbs::Comparators, self
    @lexicon.import_words_from Verbs::Combinators, self

    @lexicon.alias_word('?dup', 'qdup')
    @lexicon.alias_word('+', 'plus')
    @lexicon.alias_word('*', 'mult')
    @lexicon.alias_word('-', 'subtract')
    @lexicon.alias_word('/', 'divide')

    @lexicon.alias_word('=', 'eq')
    @lexicon.alias_word('<>', 'noteq')
    @lexicon.alias_word('>', 'gt')
    @lexicon.alias_word('<', 'lt')

    @lexicon.alias_word('.', 'dot')
    @lexicon.alias_word('.S', 'dot_s')

    @lexicon.define_word(':') { read_and_define_word }
    @lexicon.define_word('[') { read_quotation } #+
    @lexicon.define_word('bye') { exit }

    @lexicon.define_immediate_word( '\\' ) { @s_in.readline }
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
    @lexicon.define_word(name, &p)
  end

  def read_quotation
    words = []

    while (word = @reader.read_word)
      break if word == ']'
      words << word
    end

    @stack << @compiler.compile_words(self, *words)
  end

  def resolve_word( word )
    return @lexicon[word] if @lexicon[word]

    if word[0,1] == ":"
      x = word[1..-1].to_sym
    else
      x = to_number(word)
    end

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

Russforth.new.run
