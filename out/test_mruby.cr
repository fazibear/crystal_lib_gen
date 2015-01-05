require "./mruby"

mrb = MRuby.open

code = %{
 p "hello world from mruby!"
 3.times do |t|
   puts 'ruby'
 end
}

MRuby.load_string(mrb, code)
