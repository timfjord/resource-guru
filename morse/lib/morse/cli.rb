module Morse
  class Cli < Thor::Group
    class_option :file, aliases: 'f', type: :string

    def load_data
      @str = if options[:file]
        data = File.read options[:file]
        puts data
        data
      else
        ask "Please input your message:"
      end
    rescue SystemCallError
      abort 'Cannot load file'
    end

    def process
      @str.each_line do |text|
        say Text.new(text.strip).obfuscated
      end
    rescue Morse::InvalidChar => e
      abort e.message
    end
  end
end
