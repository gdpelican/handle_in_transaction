require 'bundler/setup'
require 'active_record'
require 'temping'

require 'minitest/autorun'
require 'minitest/pride'
ActiveRecord::Base.establish_connection adapter: :sqlite3, database: ':memory:'

require 'handle_in_transaction'

class HandleInTransactionTest < MiniTest::Spec
  describe HandleInTransaction do

    before do
      Temping.create :test_model
      TestModel.send :define_method, :say_hello do |name| "Hello, #{name}!" end
      TestModel.class_eval 'extend HandleInTransaction'
      TestModel.class_eval 'handle_in_transaction :say_hello'
    end

    it "wraps a method in a Transaction" do
      TestModel.stub :transaction, "I am being transacted!" do
        result = TestModel.new.send(:say_hello, "James")
        assert_equal result, "I am being transacted!"
      end
    end

    it "can call the original method" do
      result = TestModel.new.send(:say_hello_without_transaction, "James")
      assert_equal result, "Hello, James!"
    end
  end

end
