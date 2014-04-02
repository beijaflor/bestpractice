# Require any additional compass plugins here.

# Set this to the root of your project when deployed:
http_path = "/"
css_dir = ""
sass_dir = "sass"
images_dir = "img"
javascripts_dir = "js"
css_distination_dir = "../css"

# You can select your preferred output style here (can be overridden via the command line):
# output_style = :expanded or :nested or :compact or :compressed

# To enable relative paths to assets via compass helper functions. Uncomment:
# relative_assets = true

# To disable debugging comments that display the original location of your selectors. Uncomment:
line_comments = false
output_style = :expanded

# If you prefer the indented syntax, you might want to regenerate this
# project again passing --syntax sass, or you can uncomment this:
# preferred_syntax = :sass
# and then run:
# sass-convert -R --from scss --to sass sass scss && rm -rf sass && mv scss sass

if environment == :production
  require 'fileutils'
  require "readline"
  on_stylesheet_saved do |file|
    if File.exists?(file) && File.basename(file) =~ /.+\.css/
    	fn = File.basename(file)
      dist = File.dirname(file) + "/" + css_distination_dir + "/" + fn
      puts "Moving: \"#{fn}\" to #{dist}"
      if File.exists?(dist)
        buf = Readline.readline("This file already exists, are you sure to overwrite? [yN]")
        if buf =~ /[Y|y|yes|Yes|YES]/
          puts "Overwrite: #{dist}"
          FileUtils.mv(file, dist)
        else
          puts "Cancel overwriting"
        end
      end
    end
  end
end
