require "./mruby"

mrb = MRuby.mrb_open

code = %{
 p "hello world from mruby!"
 3.times do |t|
   puts 'ruby'
 end
}

MRuby.mrb_load_string(mrb, code)
