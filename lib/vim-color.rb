require 'fileutils'

module VimColor
  @default_input = ".vim-color.tmp"
  @default_output = @default_input + ".html"

  class << self
    def color code, options = nil
      File.open @default_input, "w" do |f|
        f.write code
      end

      color_file @default_input, options
    end

    def color_file input_file, options = {}
      run_vim input_file, options
      result options
    end

    def color_stdin options = nil
      color $stdin.read, options
    end

    private

    def result options
      if options[:output_file]
        options[:output_file]
      elsif options[:input_file]
        options[:input_file] + ".html"
      else
        colored_code = File.read @default_output
        FileUtils.rm_f @default_input
        FileUtils.rm_f @default_output
        colored_code
      end
    end

    def run_vim input_file, options
      vim_commands = set_commands(options).join(' ')

      system "vim -n -R #{vim_commands} #{input_file} &> /dev/null"
    end

    def set_commands options
      commands = ["let html_no_progress = 1"]

      if options[:syntax]
        commands << "set syntax=#{options[:syntax]}"
      end

      if options[:use_css]
        commands << "let html_use_css = 1"
      else
        commands << "let html_use_css = 0"
      end

      if options[:line_numbers]
        commands << "let html_number_lines = 1"
      end

      commands << "TOhtml"

      if options[:output_file]
        commands << "w #{options[:output_file]}"
      else
        commands << "w!"
      end

      commands << "q!" << "q!"

      commands.map { |c| "-c #{c.inspect}" }
    end
  end
end
