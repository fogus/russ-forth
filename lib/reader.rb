class Reader
  def initialize( i, o )
    @input = i
    @output = o
  end

  def is_space?( ch )
    /\W/ =~ ch.chr
  end

  def read_word
    result = nil
    ch = nil
    until @input.eof?
      ch = @input.readchar
      if result and is_space?(ch)
        break
      elsif result.nil?
        result = ch
      else
        result << ch
      end
    end
    return result if result
    nil
  end
end

