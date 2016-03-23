require 'dogestrings'

module Verbs
  module Combinators
    def apply
      op = @stack.pop
      op.call
    end

    def dip
      op = @stack.pop
      store = @stack.pop
      op.call
      @stack << store
    end
  end
end
