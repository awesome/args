args
====

Argument parsing in ruby.

```ruby
a = Args.new
a.add_arg("b", 0)
a.add_arg("c", 1)
a.add_arg("d", 1)

a.parse(["-b", "-d", "butts"]) # {"b"=>true, "d"=>"butts"}
```
