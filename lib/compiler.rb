class Compiler
  def initialize( lex )
    @lexicon = lex
  end

  def compile_words( context, *words )
    blocks = []

    words.each do |word|
      entry = context.resolve_word( word )
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

