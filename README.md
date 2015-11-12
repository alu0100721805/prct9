
# Práctica de Laboratorio #7. Programación Orientada a Objetos (TDD y POO) Juan José Gregorio Díaz Marrero CURSO 2015-2016

# Gema  Bibliografía

 Esta gema permite crear objetos Libro::Bibliografia con el fin de guardar y mostrar la información relacionada a un libro (autor,titulo,serie,editorial,edición,fecha de publicación y números de ISBN). Además se implementa una lista de este tipo de objetos.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'Bibliografia'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install Bibliografia

## Usage

 @b1 = Libro::Bibliografia.new({:autor =>['Dave Thomas', 'Andy Hunt', 'Chad Fowler'],:titulo => 'Programming Ruby 1.9 & 2.0: The Pragmatic Programmers’ Guide',:serie => 'The Facets of Ruby',:editorial => 'Pragmatic Bookshelf',:edicion => '4 edition',:fecha => 'July 7, 2013',:isbn => ['ISBN-13: 978-1937785499','ISBN-10: 1937785491']})
			
  @b1.to_s

 nodo = Libro::Node.new(@b1,nil,nil)
 l1 = Libro::Lista.new(nodo)
 l1.push(nodo)-> Entra por la cabeza de la lista
 l1.unshift(nodo) -> Entra por la cola de la lista
 nodorec = l1.pop -> Extrae el elemento apuntado por la cabeza de la lista
 nodorec = l1.shift -> Extrae el elemento apuntado por la cola de la lista
 l1.each -> Mixing Enumerable
 l1.mostrar -> Muestra salida formateada de la lista sin retornar nada
 l1.to_s -> Convierte Toda la lista en una cadena , insertando por cada nodo un "\n" 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing


1. Create your feature branch (`git checkout -b my-new-feature`)
2. Commit your changes (`git commit -am 'Add some feature'`)
3. Push to the branch (`git push origin my-new-feature`)
4. Create a new Pull Request
