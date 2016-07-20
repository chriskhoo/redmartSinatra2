#/ use in all
require 'rubygems'
require 'bundler'
Bundler.require

# this is the model
require './models/user'
#
# can change this but better not to
# this is the controller
require './app'

#change this
run RedmarkSinatraApp
