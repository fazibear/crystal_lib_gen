class FFIGen
  def generate_cr
    writer = Writer.new "  ", "# "
    writer.puts "@[Link(\"#{@ffi_lib}\")]"
    writer.puts "lib #{@module_name}"
    writer.indent do
      defs[FFIGen::Constant].each {|d| d.write_crystal writer }
      defs[FFIGen::Enum].each {|d| d.write_crystal writer }
      defs[FFIGen::StructOrUnion].each {|d| d.write_declaration_crystal writer }
      defs[FFIGen::StructOrUnion].each {|d| d.write_crystal writer }
      defs[FFIGen::FunctionOrCallback].each {|d| d.write_crystal writer }
    end
    writer.puts "end"
    writer.output
  end

  def defs
    defs = {
      FFIGen::Constant => [],
      FFIGen::Enum => [],
      FFIGen::StructOrUnion => [],
      FFIGen::FunctionOrCallback => []
    }
    declarations.values.compact.uniq.each do |declaration|
      defs[declaration.class] << declaration
    end
    defs
  end

  def to_crystal_type(full_type)
    canonical_type = Clang.get_canonical_type full_type
    case canonical_type[:kind]
    when :void            then "Void"
    when :bool            then "Bool"
    when :u_char          then "UInt8"
    when :u_short         then "UInt16"
    when :u_int           then "UInt16"
    when :u_long          then "UInt32" 
    when :u_long_long     then "UInt64"
    when :char_s, :s_char then "UInt8"
    when :short           then "Int16"
    when :int             then "Int16"
    when :long            then "Int32"
    when :long_long       then "Int64"
    when :float           then "Float32"
    when :double          then "Float64"
    when :pointer
      pointee_type = Clang.get_pointee_type canonical_type
      result = nil
      case pointee_type[:kind]
      when :char_s
        result = "UInt8*"
      when :record
        pointee_declaration = @declarations[Clang.get_cursor_type(Clang.get_type_declaration(pointee_type))]
        if pointee_declaration
          result = "#{pointee_declaration.crystal_name}*" 
        else
          result = "Void*" 
        end
      when :function_proto
        declaration = @declarations[full_type]
        result = "Void*"
        #result = declaration.crystal_name if declaration
      end

      if result.nil?
        pointer_depth = 0
        pointer_target_name = ""
        current_type = full_type
        loop do
          declaration = Clang.get_type_declaration current_type
          pointer_target_name = Name.new self, Clang.get_cursor_spelling(declaration).to_s_and_dispose
          break if not pointer_target_name.empty?

          case current_type[:kind]
          when :pointer
            pointer_depth += 1
            current_type = Clang.get_pointee_type current_type
          when :unexposed
            break
          else
            pointer_target_name = Name.new self, Clang.get_type_kind_spelling(current_type[:kind]).to_s_and_dispose
            break
          end
        end
        if @declarations[Clang.get_cursor_type(Clang.get_type_declaration(current_type))]
          result = "#{pointer_target_name.to_crystal_classname}#{'*' * pointer_depth}"
        else
          result = "Void#{'*' * pointer_depth}"
        end
      end
      
      result
    when :enum
      declaration = @declarations[canonical_type]
      declaration ? declaration.crystal_name : "Int32"
    when :record
      declaration = @declarations[canonical_type]
      declaration ? declaration.crystal_name : "Int32"
    when :constant_array
      element_type_data = to_crystal_type Clang.get_array_element_type(canonical_type)
      size = Clang.get_array_size canonical_type
      "StaticArray(#{element_type_data}, #{size})"
    else
      raise NotImplementedError, "No translation for values of type #{canonical_type[:kind]}"
    end
  end

  class Name
    CRYSTAL_KEYWORDS = %w{alias and begin break case class def defined do else elsif end ensure false for if in module next nil not or redo rescue retry return self super then true undef unless until when while yield BEGIN END}

    def to_crystal_downcase
      format :downcase, :underscores, CRYSTAL_KEYWORDS
    end

    def to_crystal_classname
      format :camelcase, CRYSTAL_KEYWORDS
    end

    def to_crystal_constant
      format :upcase, :underscores, CRYSTAL_KEYWORDS
    end
  end

  class Enum
    def write_crystal(writer)
      writer.puts "enum #{crystal_name}"
      writer.indent do
        writer.write_array @constants do |constant|
          "#{constant[:name].to_crystal_classname} = #{constant[:value]}"
        end
      end
      writer.puts "end", ""
    end

    def crystal_name
      @name.to_crystal_classname
    end
  end

  class StructOrUnion
    def write_declaration_crystal(writer)
      writer.puts "#{@is_union ? 'union' : 'struct'} #{crystal_name}"
      writer.puts "end", ""
    end
    
    def write_crystal(writer)
      writer.puts "#{@is_union ? 'union' : 'struct'} #{crystal_name}"
      writer.indent do
        @fields.each do |field|
          writer.puts "#{field[:name].to_crystal_downcase}: #{@generator.to_crystal_type field[:type]}"
        end
      end
      writer.puts "end", ""
    end

    def crystal_name
      @crystal_name ||= @name.to_crystal_classname
    end
  end

  class FunctionOrCallback
    def write_crystal(writer)
      params = @parameters.map do |parameter|
        type = @generator.to_crystal_type parameter[:type]
        name = if !parameter[:name].empty?
                 parameter[:name].to_crystal_downcase
               else
                 type.gsub('*','').downcase
               end
        "#{name} : #{type}"
      end
    
      writer.puts "fun #{crystal_name}(#{params.join(', ')}) : #{@generator.to_crystal_type @return_type}"
    end

    def crystal_name
      @crystal_name ||= @name.to_crystal_downcase
    end
  end

  class Constant
    def write_crystal(writer)
      writer.puts "#{@name.to_crystal_constant} = #{@value}"
    end
  end
end
