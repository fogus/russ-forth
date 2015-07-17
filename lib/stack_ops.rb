require 'dogestrings'

module Verbs
  module StackOps
    ___ " x -- "
    def dot
      @s_out.print( @stack.pop )
    end
  end
end
