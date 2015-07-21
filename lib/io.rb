require 'dogestrings'

module Verbs
  module Io
    def cr
      @s_out.puts
    end

    def dot_s
      @s_out.print( ">->- #{@stack} -->\n" )
    end

    def emit
      @s_out.print( @stack.last.chr )
    end
  end
end
