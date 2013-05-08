# Opener

Opener is a Ruby library for opening things in an cross-platform way.

It is a tiny (28 lines of code) alternative to Ruby's [launchy] gem.

[launchy]: http://rubygems.org/gems/launchy

## Installation

Add this line to your application's Gemfile:

    gem 'opener'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install opener

## Usage

Load this library:

    require 'opener'

Open something in the foreground (blocking call):

    Opener.system(thing_to_open_in_foreground)

Open something in the foreground while suppressing output:

    Opener.system(thing_to_open_in_foreground, 1 => :close)

Open something in the foreground while suppressing errors:

    Opener.system(thing_to_open_in_foreground, 2 => :close)

Open something in the background (non-blocking call):

    Opener.spawn(thing_to_open_in_background)

Open something in the background while suppressing output:

    Opener.spawn(thing_to_open_in_background, 1 => :close)

Open something in the background while suppressing errors:

    Opener.spawn(thing_to_open_in_background, 2 => :close)

Reveal the OS-specific command that is opening things:

    puts Opener.command()

## License

This library is distributed under the same terms as Ruby:
<http://www.ruby-lang.org/en/about/license.txt>

Copyright 2013 Suraj N. Kurapati <https://github.com/sunaku>

Thanks to 2010 David A. Wheeler <http://www.dwheeler.com/essays/open-files-urls.html>
