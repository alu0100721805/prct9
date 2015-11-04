require 'bibliografia.rb'
require 'spec_helper'

describe Libro do
	  before(:all) do
	    
	    @b1 = Libro::Bibliografia.new({:autor =>['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide',:serie => 'The Facets of Ruby',:editorial => 'Pragmatic Bookshelf',:edicion => '4 edition',:fecha => 'July 7, 2013',:isbn => ['ISBN-13: 978-1937785499','ISBN-10: 1937785491']})
		
		
	  end
	  
	  describe 'Expectativas clase Bibliografia' do
	    
	     it ' Expectativas instancia Bibliografia' do

		    expect(@b1).to be_instance_of(Libro::Bibliografia)

             end
	     
	     it ' Expectativa Debe existir uno o más autores' do

		   expect{b2 = Libro::Bibliografia.new({:autor => nil,:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide',:serie => 'The Facets of Ruby',:editorial => 'Pragmatic Bookshelf',:edicion => '4 edition',:fecha => 'July 7, 2013',:isbn => ['ISBN-13: 978-1937785499','ISBN-10: 1937785491']})}.to raise_error(ArgumentError)

	     end
	     
	     it ' Expectativa Debe existir un titulo ' do 
                  
                  expect{b3 = Libro::Bibliografia.new({:autor =>['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => nil,:serie => 'The Facets of Ruby',:editorial => 'Pragmatic Bookshelf',:edicion => '4 edition',:fecha => 'July 7, 2013',:isbn => ['ISBN-13: 978-1937785499','ISBN-10: 1937785491']})}.to raise_error(ArgumentError)
		 expect{b3 = Libro::Bibliografia.new({:autor =>['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => ['T1','T2'],:serie => 'The Facets of Ruby',:editorial => 'Pragmatic Bookshelf',:edicion => '4 edition',:fecha => 'July 7, 2013',:isbn => ['ISBN-13: 978-1937785499','ISBN-10: 1937785491']})}.to raise_error(ArgumentError)

	     end
	     
	     it ' Expectativa Debe existir o no una serie ' do 
     
		 expect{b4 = Libro::Bibliografia.new({:autor => ['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers',:serie => nil,:editorial => 'Pragmatic Bookshelf',:edicion => '4 edition',:fecha => 'July 7, 2013',:isbn => ['ISBN-13: 978-1937785499','ISBN-10: 1937785491']})}.not_to raise_error(ArgumentError)
              
		 expect{b4 = Libro::Bibliografia.new({:autor => ['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers',:serie => ['SERIE1','SERIE2'],:editorial => 'Pragmatic Bookshelf',:edicion => '4 edition',:fecha => 'July 7, 2013',:isbn => ['ISBN-13: 978-1937785499','ISBN-10: 1937785491']})}.to raise_error(ArgumentError)

	     end
	     
	     it ' Expectativa Debe existir una editorial ' do


		 expect{b5 = Libro::Bibliografia.new({:autor => ['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide',:serie => 'The Facets of Ruby',:editorial => nil,:edicion => '4 edition',:fecha => 'July 7, 2013',:isbn => ['ISBN-13: 978-1937785499','ISBN-10: 1937785491']})}.to raise_error(ArgumentError)
	         expect{b5 = Libro::Bibliografia.new({:autor => ['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide',:serie => 'The Facets of Ruby',:editorial => ['EDITORIAL1','EDITORIAL2'],:edicion => '4 edition',:fecha => 'July 7, 2013',:isbn => ['ISBN-13: 978-1937785499','ISBN-10: 1937785491']})}.to raise_error(ArgumentError)

	     end
		  


	  end 
 
end
