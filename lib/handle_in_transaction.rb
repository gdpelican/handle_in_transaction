require "handle_in_transaction/version"

module HandleInTransaction
  def handle_in_transaction(method_name)
    aliased, punc = method_name.to_s.sub(/([?!=])$/, ''), $1
    method = instance_method(aliased)
    define_method(:"#{aliased}_without_transaction#{punc}") { |*args| method.bind(self).call(*args) }
    define_method(:"#{aliased}#{punc}")                     { |*args| transaction { byebug; method.bind(self).call(*args) } }
  end
end
