class Lexicon
  def initialize( &block )
    @entries = {}
  end

  def define_word( name, &block )
    @entries[name] = { :name => name, :block => block, :immediate => false }
    self
  end

  def define_immediate_word( name, &block )
    @entries[name] = { :name => name, :block => block, :immediate => true }
    self
  end

  def alias_word( name, old_name )
    entry = self[old_name]
    raise "No such word #{old_name}" unless entry
    new_entry = entry.dup
    new_entry[:name] = name
    @entries[name] = entry
  end

  def []( name )
    @entries[name]
  end

  def import_words_from( mod, context )
    mod.public_instance_methods(false).each do |meth|
      method_closure = context.method(meth.to_sym)
      define_word( meth.to_s, &method_closure )
    end  
  end
end
