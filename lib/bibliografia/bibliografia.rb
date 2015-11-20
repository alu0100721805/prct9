module Bibliografias

 	class Bibliografia
		def initialize(texto)
			 raise ArgumentError,'Argumento "texto" no debe ser nulo' unless texto != nil
		 	 raise ArgumentError,'Argumento "texto" debe ser un Hash' unless texto.is_a? Hash

			 raise ArgumentError,'Argumento "autor" no debe ser nulo' unless texto[:autor] != nil
		  	 raise ArgumentError,'Argumento "autor" debe ser un Array' unless texto[:autor].is_a? Array
		  	 texto[:autor].each {|x| raise ArgumentError,'El valor del array debe ser String' unless x.is_a? String}
		  	 @autor = texto[:autor]

			raise ArgumentError,'Argumento "titulo" no debe ser nulo' unless  texto[:titulo] != nil
		 	raise ArgumentError,'Argumento "titulo" debe ser String' unless texto[:titulo].is_a? String
		 	@titulo = texto[:titulo]
		
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

			raise ArgumentError,'Argumento "isbn" no debe ser nulo' unless texto[:isbn] != nil
		  	raise ArgumentError,'Argumento "isbn" debe ser un Array' unless texto[:isbn].is_a? Array
		  	texto[:isbn].each {|x| raise ArgumentError,'El valor del array debe ser String' unless x.is_a? String}
			@isbn = texto[:isbn]

		end
		attr_reader :autor,:titulo,:serie,:editorial,:edicion,:fecha,:isbn
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
                        @isbn.each { |x| cadena << x}
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
			@isbn.each{ |x| print (" " << x << "\n")}

		
		end
		#Se sobreescribe el operador "==" para que la clase aprenda a compararse con objetos de su misma clase
		def ==(obj)

			raise ArgumentError, 'El argumento pasado debe ser del tipo Libro::Bibliografia' unless obj.is_a? Bibliografias::Bibliografia

				if((@autor.eql? obj.autor) && (@titulo.eql? obj.titulo) && (@serie.eql? obj.serie) && (@editorial.eql? obj.editorial) && (@edicion.eql? obj.edicion) && (@fecha.eql? obj.fecha) && (@isbn.eql? obj.isbn)) then
					return true
			        end
				return false
		end
	end
	class Lista
		Node = Struct.new(:value,:next,:prev)
		include Enumerable
		def initialize(obj)
		raise ArgumentError, "La lista no puede ser nil" unless (obj !=nil)
		raise ArgumentError, "El argumento debe ser del tipo Libro::Node" unless (obj.is_a? Bibliografias::Lista::Node)
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
			      raise ArgumentError, "El argumento debe ser del tipo Libro::Node" unless nodo.is_a? Bibliografias::Lista::Node
			      
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

			raise ArgumentError, "El argumento debe ser del tipo Libro::Node" unless nodo.is_a? Bibliografias::Lista::Node

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
			yield aux
			aux = aux.prev
		      end
		end
		def mostrar
			self.each{ |x| x.value.mostrar}
		end
		def to_s
			cadena = ""
			self.each{ |x| cadena << x.value.to_s << "\n"}
			return cadena
		end

	end


end
