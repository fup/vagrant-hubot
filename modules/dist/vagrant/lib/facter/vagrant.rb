# This is a module added to detect whether a
# host is running in a VirtualBox instance, and by
# extension, running in a vagrant environment. Support for
# detecting a VirtualBox host via the facter virtual fact is supported
# in facter 1.6.2 or higher, however even that support is buggy. This
# is a quick hack.

Facter.add('vagrant') do
  confine :kernel => %w{Linux}

  setcode do
    %x[/usr/bin/getent passwd].include?('vagrant') == true ? true : false
  end
end
