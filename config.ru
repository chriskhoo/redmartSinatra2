#/ use in all
require 'rubygems'
require 'bundler'
require 'faker'
Bundler.require

# this is the model
require './models/user'
require './models/product'
require './models/brand'
require './models/category'
#
# can change this but better not to
# this is the controller
require './app'

#ALLOW DELETE AND PUT REQUEST
use Rack::MethodOverride

#change this
run RedmarkSinatraApp
