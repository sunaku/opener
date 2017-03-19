# Opener

Opener is a Ruby library for opening things in an cross-platform way.

It is a tiny (33 lines of code) alternative to the [launchy] library.

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

Open something in the background (non-blocking call):

    Opener.spawn(thing_to_open_in_background)

Open something in place of the current process:

    Opener.exec(thing_to_open_in_place)

Reveal the OS-specific command that is opening things:

    puts Opener.command()

### Suppression

Open something while detaching terminal (close STDIN):

    Opener.system(thing_to_open_in_foreground, 0 => :close)
    Opener.spawn(thing_to_open_in_background, 0 => :close)
    Opener.exec(thing_to_open_in_place, 0 => :close)

Open something while suppressing output (close STDOUT):

    Opener.system(thing_to_open_in_foreground, 1 => :close)
    Opener.spawn(thing_to_open_in_background, 1 => :close)
    Opener.exec(thing_to_open_in_place, 1 => :close)

Open something while suppressing errors (close STDERR):

    Opener.system(thing_to_open_in_foreground, 2 => :close)
    Opener.spawn(thing_to_open_in_background, 2 => :close)
    Opener.exec(thing_to_open_in_place, 2 => :close)

See Kernel#spawn() documentation for more tips and tricks.

## License

[Spare A Life]: https://sunaku.github.io/vegan-for-life.html
> Like my work? :+1:  Please [spare a life] today as thanks!
:cow::pig::chicken::fish::speak_no_evil::v::revolving_hearts:

Copyright 2013 Suraj N. Kurapati <https://github.com/sunaku>

Thanks to 2010 David A. Wheeler
<http://www.dwheeler.com/essays/open-files-urls.html>

This library is distributed under the same terms as Ruby:
<http://www.ruby-lang.org/en/about/license.txt>
