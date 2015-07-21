require 'dogestrings'

module Verbs
  module Interop
    def knew
      name = @stack.pop
      Kernel.const_get(name).new
    end
  end
end
