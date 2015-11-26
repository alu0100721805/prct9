# encoding: utf-8
module Bibliografias

 	class Bibliografia
	  include Comparable
		def initialize(texto)
			 raise ArgumentError,'Argumento "texto" no debe ser nulo' unless texto != nil
		 	 raise ArgumentError,'Argumento "texto" debe ser un Hash' unless texto.is_a? Hash
			
			raise ArgumentError,'Argumento "titulo" no debe ser nulo' unless  texto[:titulo] != nil
			raise ArgumentError,'Argumento "titulo" debe ser String' unless texto[:titulo].is_a? String
			@titulo = texto[:titulo]
			
			raise ArgumentError,'Argumento "fecha" no debe ser nula' unless  texto[:fecha] != nil
			raise ArgumentError,'Argumento "fecha" debe ser String' unless texto[:fecha].is_a? String
			@fecha = texto[:fecha]

			 raise ArgumentError,'Argumento "autor" no debe ser nulo' unless texto[:autor] != nil
		  	 raise ArgumentError,'Argumento "autor" debe ser un Array' unless texto[:autor].is_a? Array
		  	 texto[:autor].each {|x| raise ArgumentError,'El valor del array debe ser String' unless x.is_a? String}
		  	 @autor = texto[:autor]

			
		
			raise ArgumentError,'Argumento "serie" debe ser String o nil' unless ((texto[:serie].is_a? String) || (texto[:serie] == nil))
			@serie = texto[:serie]

			raise ArgumentError,'Argumento "editorial" no debe ser nulo' unless  texto[:editorial] != nil
		        raise ArgumentError,'Argumento "editorial" debe ser String' unless texto[:editorial].is_a? String
		        @editorial = texto[:editorial]

			raise ArgumentError,'Argumento "edicion" no debe ser nulo' unless  texto[:edicion] != nil
			raise ArgumentError,'Argumento "edicion" debe ser String' unless texto[:edicion].is_a? String
		 	@edicion = texto[:edicion]

			raise ArgumentError,'Argumento "fecha" no debe ser nula' unless  texto[:fecha] != nil
			raise ArgumentError,'Argumento "fecha" debe ser String' unless texto[:fecha].is_a? String
			@fecha = texto[:fecha]

	
		end
		attr_reader :autor,:titulo,:serie,:editorial,:edicion,:fecha
		def to_s
			cadena = "" 
			cadena << @titulo
			@autor.each { |x| cadena << x}
			if(@serie != nil)
		        cadena << @serie
			end
			cadena << @editorial 
			cadena << @edicion 
			cadena << @fecha 
			return cadena
			
		end
		def mostrar


			puts
			puts "\t <<<<<<<< BIBLIOGRAFIA <<<<<<<< "
			print (" AUTOR/ES: ")
		        @autor.each{ |x| print x + (@autor[-1].equal?(x) ? ".\n" : ",") } 
			puts (" TÍTULO : " << @titulo)
			if(@serie != nil)
		        puts (" SERIE : (" << @serie << ")") 
			end
			puts (" EDITORIAL-EDICIÓN-FECHA PUBLICACIÓN : " << @editorial << "; " << @edicion << " (" << @fecha << ")")
			

		
		end
		#Se sobreescribe el operador "==" para que la clase aprenda a compararse con objetos de su misma clase
=begin		def ==(obj) 
			
			raise ArgumentError,'El agrumento pasado no debe ser nil' unless (!obj.nil?)	
			raise ArgumentError, 'El argumento pasado debe ser del tipo Bibliografias::Bibliografia' unless obj.is_a? Bibliografias::Bibliografia

				if((@autor.eql? obj.autor) && (@titulo.eql? obj.titulo) && (@serie.eql? obj.serie) && (@editorial.eql? obj.editorial) && (@edicion.eql? obj.edicion) && (@fecha.eql? obj.fecha)) then
					return true
			        end
				return false
		end
=end
		def <=>(obj)

			if(!obj.nil?)then
	raise ArgumentError, 'El argumento pasado debe ser del tipo Bibliografias::Bibliografia' unless obj.is_a? Bibliografias::Bibliografia

				self.instance_variables.each do |x|
					aobj1 = self.instance_variable_get(x)
					aobj2 = obj.instance_variable_get(x)
					if (!aobj1.eql? aobj2)then
						if (aobj1.is_a? Array)
							aobj1 = aobj1.join
						end
						if (aobj2.is_a? Array)
							aobj2 = aobj2.join
						end
					   	if( aobj1 > aobj2) then
					         #se devuelve el valor contrario para comparar por orden alfabético
							return -1
						else 
							return 1
						end
					end
				return 0
				end
			else

				return nil
			end


		end

	end
	class Lista
		Node = Struct.new(:value,:next,:prev)
		include Enumerable
		def initialize(obj)
		raise ArgumentError, "La lista no puede ser nil" unless (!obj.nil? )
		raise ArgumentError, "El argumento debe ser del tipo Bibliografias::Node o Bibliografias::Bibliografia" unless ((obj.is_a? Bibliografias::Lista::Node) ||
(obj.is_a? Bibliografias::Bibliografia ))
		if(obj.is_a? Bibliografias::Bibliografia)then
		 	obj = Bibliografias::Lista::Node.new(obj)
		
		end
		@head = obj
		@tail = @head
		@size = 1
		end
		attr_reader :head, :tail,:size
		def pop
			if(@head != nil) then
				@size -= 1
				aux = @head
		       		@head = @head.prev
		       		if (@head != nil) then
				   @head.next = nil	
			 	end
				return aux
			else
			  return nil
			end
		end
		def shift
			if(@tail != nil) then
				@size -= 1
				aux = @tail
		       		@tail = @tail.next
		       		if (@tail != nil) then
				   @tail.prev = nil
			 	end
				return aux
			else
			  return nil
			end	 
 	        end
		 def push(*args)
		    raise ArgumentError,"Se deben pasar uno o más nodos " unless args.length > 0 
			args.each do |nodo|
		    raise ArgumentError, "El argumento debe ser del tipo Bibliografias::Node o Bibliografias::Bibliografia" unless ((nodo.is_a? Bibliografias::Lista::Node) ||(nodo.is_a? Bibliografias::Bibliografia ))

			      if(nodo.is_a? Bibliografias::Bibliografia)then
				nodo = Bibliografias::Lista::Node.new(nodo)
		
			      end
			      
			      if (@head != nil) then
				@head.next = nodo
			      end
			      nodo.prev = @head
			      nodo.next = nil
			      @head = nodo
			      @size += 1
			end
		      puts
    		end
		def unshift(*args)
		     raise ArgumentError,"Se deben pasar uno o más nodos " unless args.length > 0 
		     	 args.each do |nodo|

		    raise ArgumentError, "El argumento debe ser del tipo Bibliografias::Node o Bibliografias::Bibliografia" unless ((nodo.is_a? Bibliografias::Lista::Node) ||(nodo.is_a? Bibliografias::Bibliografia ))

				if(nodo.is_a? Bibliografias::Bibliografia)then
					nodo = Bibliografias::Lista::Node.new(nodo)
		
				end
				if (@tail != nil) then
					@tail.prev = nodo
				end
				nodo.next = @tail		
				nodo.prev = nil
				@tail = nodo
				@size += 1
				end
				puts

		end
		def each
		      aux = @head
		      while aux != nil do
			yield aux.value
			aux = aux.prev
		      end
		end
		def mostrar
			self.each{ |x| x.mostrar}
		end
		def to_s
			cadena = ""
			self.each{ |x| cadena << x.to_s << "\n"}
			return cadena
		end


	end
	class Libro < Bibliografias::Bibliografia
		def initialize(texto)
		   super(texto)
		   raise ArgumentError,'Argumento "isbn" no debe ser nulo' unless texto[:isbn] != nil
		   raise ArgumentError,'Argumento "isbn" debe ser un Array' unless texto[:isbn].is_a? Array
		   texto[:isbn].each {|x| raise ArgumentError,'El valor del array debe ser String' unless x.is_a? String}
			@isbn = texto[:isbn]
		   @isbn = texto[:isbn]
		end
		attr_reader :isbn
		def mostrar
		    super
		    @isbn.each{ |x| print (" " << x << "\n")}
		    puts ""
		end
		def to_s
		   cadena = super
		   @isbn.each { |x| cadena << x}
	           return cadena
		end	
	end
	class Publicacion < Bibliografias::Bibliografia
		def initialize (texto)
		   super(texto)
		    raise ArgumentError,'Argumento "issn" no debe ser nulo' unless texto[:issn] != nil
		    raise ArgumentError,'Argumento "issn" debe ser un Array' unless texto[:issn].is_a? Array
		    texto[:issn].each {|x| raise ArgumentError,'El valor del array debe ser String' unless x.is_a? String}
		    @issn = texto[:issn]
		    
		    raise ArgumentError,'Argumento "enlace" debe ser un String o nil' unless ((texto[:enlace].is_a? String) || (texto[:enlace] == nil)) 
		    @enlace = texto[:enlace] 
	
		end
		attr_reader :issn,:enlace
		def mostrar
		    super 
		    if(@enlace != nil)
		        puts (" ENLACE : (" << @enlace << ")") 
		    end
		    @issn.each{ |x| print (" " << x << "\n")}
	            puts ""
		end
		def to_s
		   cadena = super
		   if (@enlace != nil)
		    cadena << @enlace
		   end
		   @issn.each { |x| cadena << x}
	           return cadena
		end
				
	end 



	

end
