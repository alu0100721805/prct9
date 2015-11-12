require 'test/unit'
require 'lib/bibliografia/bibliografia.rb'

class TestBibliografia < Test::Unit::TestCase
  def setup
 	@nodo1 = Libro::Node.new(Libro::Bibliografia.new({:autor =>['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide',:serie => 'The Facets of Ruby',:editorial => 'Pragmatic Bookshelf',:edicion => '4 edition',:fecha => 'July 7, 2013',:isbn =>['ISBN-13: 978-1937785499','ISBN-10: 1937785491']}),nil,nil)
			
	    @nodo2 = Libro::Node.new(Libro::Bibliografia.new({:autor =>['Scott Chacon'],:titulo =>'Pro Git 2009th Edition',:serie => 'Pro',:editorial =>'Apress',:edicion => '2009 edition',:fecha => 'August 27, 2009',:isbn => ['ISBN-13: 978-1430218333','ISBN-10: 1430218339']}),nil,nil)
 
	    @nodo3 = Libro::Node.new(Libro::Bibliografia.new({:autor =>['David Flanagan','Yukihiro Matsumoto'],:titulo =>'The Ruby Programming Language',:serie => '',:editorial => 'O’Reilly Media',:edicion => '1 edition',:fecha => 'February 4, 2008',:isbn => ['ISBN-10: 0596516177','SBN-13: 978-0596516178']}),nil,nil)
 
	    @nodo4 = Libro::Node.new(Libro::Bibliografia.new({:autor =>['David Chelimsky','Dave Astels','Bryan Helmkamp','Dan North','Zach
Dennis', 'Aslak Hellesoy'],:titulo =>'The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends',:serie => 'The Facets of Ruby',:editorial => 'Pragmatic Bookshelf',:edicion => '1 edition',:fecha => 'December 25, 2010',:isbn => ['ISBN-10: 1934356379','ISBN-13: 978-1934356371']}),nil,nil) 

	    @nodo5 = Libro::Node.new(Libro::Bibliografia.new({:autor =>['Richard E.'],:titulo =>'Silverman Git Pocket Guide',:serie => '',:editorial => 'O’Reilly Media',:edicion => '1 edition',:fecha => 'August 2, 2013',:isbn => ['ISBN-10: 1449325866','ISBN-13: 978-1449325862']}),nil,nil) 
	    @lista = Libro::Lista.new(@nodo1)
	    @lista.push(@nodo2)
	    @lista.unshift(@nodo3)
	    @lista.unshift(@nodo4)
	    @lista.push(@nodo5)
	    #(tail)nodo4->nodo3->nodo1->nodo2->nodo5(Head)
	    @nodo6 = @lista.pop
            #nodo6 == nodo5
	    @nodo7 = @lista.shift
	    #nodo7 == nodo4
	    @nodo8 = @lista.pop
	    #nodo8 == nodo2
	    @nodo9 = @lista.shift
	    #nodo9 == nodo3
	    @nodo10 = @lista.pop
	    #nodo10 == nodo1
  end
  def test_simple

   	assert_equal( @nodo1.value.to_s,@nodo10.value.to_s)
	assert_equal( @nodo2.value.to_s,@nodo8.value.to_s)
	assert_equal( @nodo3.value.to_s,@nodo9.value.to_s)
	assert_equal( @nodo4.value.to_s,@nodo7.value.to_s)
	assert_equal( @nodo5.value.to_s,@nodo6.value.to_s)
  end
  def test_type_check

 	#Nodo creado e insertado en una lista Pruebas
 	assert_kind_of(Libro::Node,@nodo1)
	assert_instance_of(Libro::Node,@nodo1)
	assert_kind_of(Libro::Bibliografia,@nodo1.value)
        assert_instance_of(Libro::Bibliografia,@nodo1.value)
	assert_kind_of(Libro::Lista,@lista)
	assert_instance_of(Libro::Lista,@lista)
       #Nodo Devuelto por la lista Pruebas
	assert_kind_of(Libro::Node,@nodo6)
	assert_instance_of(Libro::Node,@nodo6)
  end

end
