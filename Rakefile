require 'html-proofer'

task :test do
  #sh "bundle exec jekyll build"
  options = {
    :assume_extension => true,
    :report_invalid_tags => false,
    :verbose => true,
    :allow_hash_href => true,
    :url_swap => {
        '^/categories' => 'categories.html',
    },
    :disable_external => true
  }
  #HTMLProofer.check_directory("./_site/2018", options).run
  HTMLProofer.check_file("./_site/2021/01/alteryx-cheatsheet.html", options).run
end
