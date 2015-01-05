require "./mruby"

mrb = MRuby.mrb_open

code = %{
    p "hello world!"
      3.times do |t|
            puts 'x'
              end
}

MRuby.mrb_load_string(mrb, code)
