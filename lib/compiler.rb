class Compiler
  def initialize( lex )
    @lexicon = lex
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

  def compile_words( *words )
    blocks = []

    words.each do |word|
      entry = resolve_word( word )
      raise "no such word: #{word}" unless entry
      if entry[:immediate]
        entry[:block].call
      else
        blocks << entry[:block]
      end
    end

    proc do
      blocks.each {|b| b.call}
    end
  end
end

