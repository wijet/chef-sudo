# chef sudo resource

A chef resource which allows executing commands with sudo.


## Installation

```
gem install chef-sudo
```

## Usage in chef recipe

```ruby
require "chef-sudo"

sudo "Running sample command" do
  command "ls -lahS"
  cwd "/tmp"
  user "kate"
  group "users"
  # sudo -i
  simulate_initial_login true
end

```

## Compatibility

0.1.x gem version is compatible with chef 0.8.x

0.2.x gem version is compatible with chef 0.9.x

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2012 Mariusz Pietrzyk wijet at wijet dot pl. See LICENSE for details.
