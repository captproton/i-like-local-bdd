require File.join(File.dirname(__FILE__), '../../../../config/environment')
require 'rubygems'
require 'test/unit'
begin
  require 'ruby-debug'
  Debugger.start
rescue LoadError
  # no debugger for you
end
