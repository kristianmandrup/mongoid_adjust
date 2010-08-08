# Mongoid adjust

Adds adjust method to Mongoid::Document so you can adjust multiple items in a collection with the same mutation.

## Install

<code>gem install mongoid_adjust</code>

## Usage

<pre>
  require 'mongoid_adjust'
  
  # adjust all items where pos > 3, adding 1 to their position
  list.items.where(:pos.gt => 3).adjust!(:pos => 1)  

  # Make name of each item uppercase 
  list.items.adjust!(:name => :upcase)  

  # Multiply all item positions by 2
  list.items.adjust!(:pos => lambda{|i| i*2})
</pre>

+Note:+

This functionality was taken from Mongo Mapper where it builds on the native multi-update functionality exposed by Mongo DB. 
Currently this project doesn't use the native Mongo DB functionality but that is a future goal!

## TODO

The adjust! should allow for an operator symbol (:add, :subtract, :multiply, :divide), defaulting to :add
<pre>
  list.items.where(:pos.gt => 3).adjust!(:subtract, :pos => 1)  
</pre>

The above can currently be achieved using <code>adjust!(:pos => -1)</code>, adding -1 to each.   

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 Kristian Mandrup. See LICENSE for details.
