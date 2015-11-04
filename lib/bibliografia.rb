#require "bibliografia/version"

module Libro
 	class Bibliografia
		def initialize(texto)
			 raise ArgumentError,'Argumento "texto" no debe ser nulo' unless texto != nil
		 	 raise ArgumentError,'Argumento "texto" debe ser un Hash' unless texto.is_a? Hash
		end
	end

end
