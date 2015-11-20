require 'bibliografia/bibliografia.rb'
require 'spec_helper'

describe Bibliografias do
	  before(:each) do
	    
	    @b1 = Bibliografias::Bibliografia.new({:autor =>['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide',:serie => 'The Facets of Ruby',:editorial => 'Pragmatic Bookshelf',:edicion => '4 edition',:fecha => 'July 7, 2013'})
			
	
	    @nodo = Bibliografias::Lista::Node.new(@b1,nil,nil)
	    @l1 = Bibliografias::Lista.new(@nodo)
	    @nodo1 = Bibliografias::Lista::Node.new(Bibliografias::Bibliografia.new({:autor =>['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide',:serie => 'The Facets of Ruby',:editorial => 'Pragmatic Bookshelf',:edicion => '4 edition',:fecha => 'July 7, 2013'}),nil,nil)
			
	    @nodo2 = Bibliografias::Lista::Node.new(Bibliografias::Bibliografia.new({:autor =>['Scott Chacon'],:titulo =>'Pro Git 2009th Edition',:serie => 'Pro',:editorial =>'Apress',:edicion => '2009 edition',:fecha => 'August 27, 2009'}),nil,nil)
 
	    @nodo3 = Bibliografias::Lista::Node.new(Bibliografias::Bibliografia.new({:autor =>['David Flanagan','Yukihiro Matsumoto'],:titulo =>'The Ruby Programming Language',:serie => '',:editorial => 'O’Reilly Media',:edicion => '1 edition',:fecha => 'February 4, 2008'}),nil,nil)
 
	    @nodo4 = Bibliografias::Lista::Node.new(Bibliografias::Bibliografia.new({:autor =>['David Chelimsky','Dave Astels','Bryan Helmkamp','Dan North','Zach
Dennis', 'Aslak Hellesoy'],:titulo =>'The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends',:serie => 'The Facets of Ruby',:editorial => 'Pragmatic Bookshelf',:edicion => '1 edition',:fecha => 'December 25, 2010'}),nil,nil) 

	    @nodo5 = Bibliografias::Lista::Node.new(Bibliografias::Bibliografia.new({:autor =>['Richard E.'],:titulo =>'Silverman Git Pocket Guide',:serie => '',:editorial => 'O’Reilly Media',:edicion => '1 edition',:fecha => 'August 2, 2013'}),nil,nil) 

	   @libro1 = Bibliografias::Libro.new({:autor =>['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide',:serie => 'The Facets of Ruby',:editorial => 'Pragmatic Bookshelf',:edicion => '4 edition',:fecha => 'July 7, 2013',:isbn =>['ISBN-13: 978-1937785499','ISBN-10: 1937785491']})
	
		
	  end
	  
	  describe 'Expectativas clase Bibliografia' do
	    
	     it ' Expectativas instancia Bibliografia' do

		    expect(@b1).to be_instance_of(Bibliografias::Bibliografia)

             end
	     
	     it ' Expectativa Debe existir uno o más autores' do

		   expect{b2 = Bibliografias::Bibliografia.new({:autor => nil,:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide',:serie => 'The Facets of Ruby',:editorial => 'Pragmatic Bookshelf',:edicion => '4 edition',:fecha => 'July 7, 2013'})}.to raise_error(ArgumentError)

	     end
	     
	     it ' Expectativa Debe existir un titulo ' do 
                  
                  expect{b3 = Bibliografias::Bibliografia.new({:autor =>['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => nil,:serie => 'The Facets of Ruby',:editorial => 'Pragmatic Bookshelf',:edicion => '4 edition',:fecha => 'July 7, 2013'})}.to raise_error(ArgumentError)
		 expect{b3 = Bibliografias::Bibliografia.new({:autor =>['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => ['T1','T2'],:serie => 'The Facets of Ruby',:editorial => 'Pragmatic Bookshelf',:edicion => '4 edition',:fecha => 'July 7, 2013'})}.to raise_error(ArgumentError)

	     end
	     
	     it ' Expectativa Debe existir o no una serie ' do 
     
		 expect{b4 = Bibliografias::Bibliografia.new({:autor => ['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers',:serie => nil,:editorial => 'Pragmatic Bookshelf',:edicion => '4 edition',:fecha => 'July 7, 2013'})}.not_to raise_error(ArgumentError)
              
		 expect{b4 = Bibliografias::Bibliografia.new({:autor => ['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers',:serie => ['SERIE1','SERIE2'],:editorial => 'Pragmatic Bookshelf',:edicion => '4 edition',:fecha => 'July 7, 2013'})}.to raise_error(ArgumentError)

	     end
	     
	     it ' Expectativa Debe existir una editorial ' do


		 expect{b5 = Bibliografias::Bibliografia.new({:autor => ['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide',:serie => 'The Facets of Ruby',:editorial => nil,:edicion => '4 edition',:fecha => 'July 7, 2013'})}.to raise_error(ArgumentError)
	         expect{b5 = Bibliografias::Bibliografia.new({:autor => ['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide',:serie => 'The Facets of Ruby',:editorial => ['EDITORIAL1','EDITORIAL2'],:edicion => '4 edition',:fecha => 'July 7, 2013'})}.to raise_error(ArgumentError)

	     end
	     
	     it ' Expectativa Debe existir un número de edición ' do

		 expect{b6 = Bibliografias::Bibliografia.new({:autor => ['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide',:serie => 'The Facets of Ruby',:editorial => 'Pragmatic Bookshelf',:edicion => nil,:fecha => 'July 7, 2013'})}.to raise_error(ArgumentError)
		expect{b6 = Bibliografias::Bibliografia.new({:autor => ['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide',:serie => 'The Facets of Ruby',:editorial => 'Pragmatic Bookshelf',:edicion => ['EDICION1','EDITION2'],:fecha => 'July 7, 2013'})}.to raise_error(ArgumentError)

	      end
	      
	      it ' Expectativa Debe existir una fecha de publicación ' do

		expect{ b7 = Bibliografias::Bibliografia.new({:autor => ['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide',:serie => 'The Facets of Ruby',:editorial => 'Pragmatic Bookshelf',:edicion => '4 edition',:fecha => nil})}.to raise_error(ArgumentError)
	      expect{ b7 = Bibliografias::Bibliografia.new({:autor => ['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide',:serie => 'The Facets of Ruby',:editorial => 'Pragmatic Bookshelf',:edicion => '4 edition',:fecha => ['FECHA1','FECHA2']})}.to raise_error(ArgumentError)

	       end
	       
	    
	      

	  end 
	  describe 'Expectativas clase Lista de una Bibliografia' do
		it ' Expectativa Debe existir un Nodo de la lista con sus datos y su siguiente' do
		
	        expect(@nodo.value).to eql(@b1)
		expect(@nodo.next).to eql(nil)

	       end
	       it ' Expectativa Debe existir una Lista con su cabeza' do
		
	        expect{l1 = Bibliografias::Lista.new(nil)}.to raise_error(ArgumentError)
		l1 = Bibliografias::Lista.new(@nodo)
		#Se utiliza una expectativa con la comparción por identidad del objeto
		expect(l1).to respond_to(:head)
		expect(l1).to respond_to(:tail) 	
		expect(l1.head).to be(@nodo)

	       end
	       it ' Expectativa Se pueden Insertar varios elementos en la lista' do

		  expect(@l1).to respond_to(:push)
		  expect(@l1).to respond_to(:unshift)
		  @l1.push(@nodo2,@nodo3)
		  expect(@l1.size).to be == 3
		  @l1.unshift(@nodo4,@nodo5)
		  expect(@l1.size).to be == 5
	      end 
	       it ' Expectativa Se extrae el primer elemento de la lista' do
		
		expect(@l1).to respond_to(:pop)
		expect(@l1).to respond_to(:shift) 	
		expect(@l1.pop).to be(@nodo)
		expect(@l1.shift).to be(@nodo)
		
	       end
	    
	      

	  end
	
	    describe 'Expectativas Clase Libro < Bibliografia ' do
		it ' Expectativa Debe existir una clase Libro de una Bibliografia' do
		

		 expect(@libro1).to be_kind_of(Bibliografias::Libro) 
		 expect(@libro1).to be_instance_of(Bibliografias::Libro) 
		
		end
	      	
		it 'Expectativa Atributos propios de una Clase Libro' do
		   expect{@libro1 = Bibliografias::Libro.new({:autor => ['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide',:serie => 'The Facets of Ruby',:editorial => 'Pragmatic Bookshelf',:edicion => '4 edition',:fecha => 'July 7, 2013',:isbn => nil})}.to raise_error(ArgumentError)
		   expect(@libro1).to respond_to(:isbn)
	           expect(@libro1.isbn).to contain_exactly('ISBN-13: 978-1937785499','ISBN-10: 1937785491')
		end
		it 'Expectativa metodos to_s y mostrar una clase Libro' do
		   expect(@libro1).to respond_to(:mostrar)
		   expect(@libro1).to respond_to(:to_s)
		   expect(@libro1.to_s).to eql('Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ GuideDave ThomasAndy HuntChad FowlerThe Facets of RubyPragmatic Bookshelf4 editionJuly 7, 2013ISBN-13: 978-1937785499ISBN-10: 1937785491')
		end

	   end
	  
 
end
