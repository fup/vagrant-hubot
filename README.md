hubot-vagrant
=============

Complete bootstrap environment for testing out new Hubot modules

# What?
This is a pre-configured Vagrant/Veewee/Puppet environment to setup
a complete environment for development. IRC server is created, Hubot is
downloaded and configured, and all of the firewalls are opened. Once
up, connect your IRC client to:

irc://localhost:6667

# Why? 
Well, I didn't want to use Heroku. Also, since I planned on deploying
this in the future to my infrastructure, I might as well have the
recipes in place and whatnot to make this work properly.

# Setup
Check out the git repository and all appropriate submodules
<pre>
git clone https://github.com/fup/vagrant-hubot.git
git submodule init
</pre>

Place all of your scripts in the 'scripts' directory

Build out your Veewee Profiles
<pre>
  cd vagrant-hubot/vagrant
  vagrant buildbox build debian-squeeze-i386
  vagrant basebox export debian-squeeze-i386
  vagrant box add debian-squeeze-i386 debian-squeeze-i386.box
</pre>

Startup Veewee
<pre>
  cd vagrant-hubot/vagrant
  vagrant up hubot
</pre>

# Refreshing Scripts 
Anytime that you have a script that should be reloaded, simply 
reprovision your vagrant server.
<pre>
  cd vagrant-hubot/vagrant
  vagrant provision hubot
</pre>

# Notes
To change any of the variables on how hubot is configured, take
a look at manfiests/site.pp for more details.

# TODO
- Add Ubuntu support
- RHEL support?
