#require "bibliografia/version"

module Libro
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
		end
	end

end
