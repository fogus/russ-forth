require 'dogestrings'

module Verbs
  module Combinators
    def dip
      op = @stack.pop
      store = @stack.pop
      op.call
      @stack << store
    end

    def sip
      op = @stack.pop
      store = @stack.last
      op.call
      @stack << store
    end
  end
end
