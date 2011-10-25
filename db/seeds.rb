Dir["#{File.dirname(__FILE__)}/seeds/*.rb"].sort.each {|seed| load seed }
