require 'bibliografia/bibliografia.rb'
require 'spec_helper'

describe Libro do
	  before(:all) do
	    
	    @b1 = Libro::Bibliografia.new({:autor =>['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide',:serie => 'The Facets of Ruby',:editorial => 'Pragmatic Bookshelf',:edicion => '4 edition',:fecha => 'July 7, 2013',:isbn =>['ISBN-13: 978-1937785499','ISBN-10: 1937785491']})
			
	   puts @b1.to_s
	
	    
		
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
	     
	     it ' Expectativa Debe existir un número de edición ' do

		 expect{b6 = Libro::Bibliografia.new({:autor => ['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide',:serie => 'The Facets of Ruby',:editorial => 'Pragmatic Bookshelf',:edicion => nil,:fecha => 'July 7, 2013',:isbn => ['ISBN-13: 978-1937785499','ISBN-10: 1937785491']})}.to raise_error(ArgumentError)
		expect{b6 = Libro::Bibliografia.new({:autor => ['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide',:serie => 'The Facets of Ruby',:editorial => 'Pragmatic Bookshelf',:edicion => ['EDICION1','EDITION2'],:fecha => 'July 7, 2013',:isbn => ['ISBN-13: 978-1937785499','ISBN-10: 1937785491']})}.to raise_error(ArgumentError)

	      end
	      
	      it ' Expectativa Debe existir una fecha de publicación ' do

		expect{ b7 = Libro::Bibliografia.new({:autor => ['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide',:serie => 'The Facets of Ruby',:editorial => 'Pragmatic Bookshelf',:edicion => '4 edition',:fecha => nil,:isbn => ['ISBN-13: 978-1937785499','ISBN-10: 1937785491']})}.to raise_error(ArgumentError)
	      expect{ b7 = Libro::Bibliografia.new({:autor => ['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide',:serie => 'The Facets of Ruby',:editorial => 'Pragmatic Bookshelf',:edicion => '4 edition',:fecha => ['FECHA1','FECHA2'],:isbn => ['ISBN-13: 978-1937785499','ISBN-10: 1937785491']})}.to raise_error(ArgumentError)

	       end
	       
	       it ' Expectativa Debe existir uno o más números ISBN ' do

		expect{b8 = Libro::Bibliografia.new({:autor => ['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide',:serie => 'The Facets of Ruby',:editorial => 'Pragmatic Bookshelf',:edicion => '4 edition',:fecha => 'July 7, 2013',:isbn => nil})}.to raise_error(ArgumentError)

		
	       end
	       
	       it ' Expectativa Existe un método para obtener el listado de autores' do

		expect(@b1).to respond_to(:autor)
	        expect(@b1.autor).to contain_exactly('Dave Thomas', 'Andy Hunt', 'Chad Fowler')

	       end
	       
	       it ' Expectativa Existe un método para obtener el título' do

		expect(@b1).to respond_to(:titulo)
	        expect(@b1.titulo).to eq('Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide')

	       end
	       
	       it ' Expectativa Existe un método para obtener la serie' do

		expect(@b1).to respond_to(:serie)
	        expect(@b1.serie).to eq('The Facets of Ruby')

	       end
	       
	       it ' Expectativa Existe un método para obtener la editorial' do

		expect(@b1).to respond_to(:editorial)
	        expect(@b1.editorial).to eq('Pragmatic Bookshelf')

	       end
	       
	       it ' Expectativa Existe un método para obtener el número de edición' do

		expect(@b1).to respond_to(:edicion)
	        expect(@b1.edicion).to eq('4 edition')

	       end
		  
	       it ' Expectativa Existe un método para obtener la fecha de publicación ' do

		expect(@b1).to respond_to(:fecha)
	        expect(@b1.fecha).to eq('July 7, 2013')

	       end
	       
	       it ' Expectativa Existe un método para obtener el listado de ISBN ' do

		expect(@b1).to respond_to(:isbn)
	        expect(@b1.isbn).to contain_exactly('ISBN-13: 978-1937785499','ISBN-10: 1937785491')

	       end
	       
	       it ' Expectativa Existe un método para obtener la referencia formateada ' do

                expect(@b1).to respond_to(:to_s)
		expect(@b1.to_s).to eq('Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ GuideDave ThomasAndy HuntChad FowlerThe Facets of RubyPragmatic Bookshelf4 editionJuly 7, 2013ISBN-13: 978-1937785499ISBN-10: 1937785491')


               end


	  end 
	  
 
end
