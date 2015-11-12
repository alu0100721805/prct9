  $:.unshift File.dirname(__FILE__) + 'lib'
   require "bundler/gem_tasks" 
   require 'rspec/core/rake_task'
   RSpec::Core::RakeTask.new
   task :default => :spec
   
   desc "Pruebas unitarias de la clase Libro::Lista Libro::Node Libro::Bibliografia"
   task :tu do
  	sh "ruby -I. test/tc_bibliografia.rb"
   end
   desc "Ejecutar solo las pruebas simples"
   task :simple do
  	sh "ruby -I. test/tc_bibliografia.rb -n /simple/"
   end
   

