require 'rbconfig'

#
# Ruby library for opening things in an cross-platform way.
#
# == Usage
#
# Load this library:
#
#   require 'opener'
#
# Open something in the foreground (blocking call):
#
#   Opener.system(thing_to_open_in_foreground)
#
# Open something in the foreground while suppressing output:
#
#   Opener.system(thing_to_open_in_foreground, 1 => :close)
#
# Open something in the foreground while suppressing errors:
#
#   Opener.system(thing_to_open_in_foreground, 2 => :close)
#
# Open something in the background (non-blocking call):
#
#   Opener.spawn(thing_to_open_in_background)
#
# Open something in the background while suppressing output:
#
#   Opener.spawn(thing_to_open_in_background, 1 => :close)
#
# Open something in the background while suppressing errors:
#
#   Opener.spawn(thing_to_open_in_background, 2 => :close)
#
# Open something in place of the current process:
#
#   Opener.exec(thing_to_open_in_this_process)
#
# Reveal the OS-specific command that is opening things:
#
#   puts Opener.command()
#
# == License
#
# This library is distributed under the same terms as Ruby:
# <http://www.ruby-lang.org/en/about/license.txt>
#
# Copyright 2013 Suraj N. Kurapati <https://github.com/sunaku>
#
# Thanks to 2010 David A. Wheeler <http://www.dwheeler.com/essays/open-files-urls.html>
#
module Opener
  class << self

    #
    # Returns an OS-specific command for opening things.
    #
    # http://www.dwheeler.com/essays/open-files-urls.html
    # http://www.par.univie.ac.at/solaris/cde-www/
    #
    def command
      @command ||=
        case RbConfig::CONFIG['host_os']
        when /darwin/i then 'open'
        when /cygwin/i then 'cygstart'
        when /linux|bsd/i then 'xdg-open'
        when /mswin|mingw/i then 'start'
        when /sunos|solaris/i then '/usr/dt/bin/sdtwebclient'
        end
    end

    #
    # Opens the given things in the foreground.
    #
    # @see Kernel#system()
    #
    def system *arguments
      insert_command_into_arguments! arguments
      super
    end

    #
    # Opens the given things in the background.
    #
    # @see Kernel#spawn()
    #
    def spawn *arguments
      insert_command_into_arguments! arguments
      super
    end

    #
    # Opens the given things in place of the current process.
    #
    # @see Kernel#exec()
    #
    def exec *arguments
      insert_command_into_arguments! arguments
      super
    end

    private

    #
    # The first argument to Kernel#system() and Kernel#spawn() can be either:
    #
    # * Hash - containing a mapping of environment variables and values
    # * String - containing the first word of the command to be executed
    #
    # This method carefully inserts our Opener.command() before that String.
    #
    def insert_command_into_arguments! arguments
      insertion_point = (arguments[0].kind_of? Hash) ? 1 : 0
      arguments.insert insertion_point, self.command
    end

  end
end
