# Rakefile
#
# Simple tasks for managing my .vim files

require 'open-uri'
require 'openssl'
require 'rubygems'
require 'json'


PLUGIN_LIST_TAG = '## Plugin List'
PLUGIN_LIST_NOTE = '_Note: Auto generated by `rake plugins:update_readme`_'
README_FILE = 'README.md'

FILES_TO_LINK = %w{vimrc gvimrc}

task :default => ['vim:link']

namespace :vim do
  desc 'Create symlinks'
  task :link do
    begin
      FILES_TO_LINK.each do |file|
        dot_file = File.expand_path("~/.#{file}")
        if File.exists? dot_file
          puts "#{dot_file} already exists, skipping link."
        else
          File.symlink(".vim/#{file}", dot_file)
          puts "Created link for #{file} in your home folder."
        end
      end
    rescue NotImplementedError
      puts "File.symlink not supported, you must do it manually."
      if RUBY_PLATFORM.downcase =~ /(mingw|win)(32|64)/
        puts 'Windows 7 use mklink, e.g.'
        puts '  mklink _vimrc .vim\vimrc'
      end
    end

  end
end

namespace :plugins do

  desc 'Update the list of plugins in README.md'
  task :update_readme do
    plugins = parse_plugins_from_vimrc
    delete_old_plugins_from_readme
    add_plugins_to_readme(plugins)
  end
end


# ----------------------------------------
# Helper Methods
# ----------------------------------------


# Just takes an array of strings that resolve to plugins from Vundle
def add_plugins_to_readme(plugins = [])
  lines = File.readlines(README_FILE).map{|l| l.chomp}
  index = lines.index(PLUGIN_LIST_TAG)
  unless index.nil?
    lines.insert(index+1, "\n#{PLUGIN_LIST_NOTE}\n\n")
    lines.insert(index+2, plugins.map{|p| " * [#{p[:name]}](#{p[:uri]}) - #{p[:description]}"})
    lines << "\n_That's #{plugins.length} plugins, holy crap._"
    write_lines_to_readme(lines)
  else
    puts "Error: Plugin List Tag (#{PLUGIN_LIST_TAG}) not found"
  end

end

def delete_old_plugins_from_readme
  lines = []
  File.readlines(README_FILE).map do |line|
    line.chomp!
    lines << line
    if line == PLUGIN_LIST_TAG
      break
    end
  end

  write_lines_to_readme(lines)
end

def write_lines_to_readme(lines)
  readme_file = File.open(README_FILE, 'w')
  readme_file << lines.join("\n")
  readme_file.close
end

# Returns an array of plugins denoted with Plugin
def parse_plugins_from_vimrc
  plugins = []
  File.new('vundle.vim').each do |line|
    if line =~ /^Plugin\s+["'](.+)["']/
      plugins << convert_to_link_hash($1)
      print '.'
    end
  end

  plugins
end

# Converts a Vundle link to a URI
def convert_to_link_hash(link)
  link_hash = {}

  if link =~ /([a-zA-Z0-9\-]*)\/([a-zA-Z0-9\-\._]*)/
    user = $1
    name = $2
    link_hash[:user] = user
    link_hash[:name] = name
    link_hash[:uri] = "https://github.com/#{user}/#{name}"
    link_hash[:description] = fetch_github_repo_description(user, name)
  else
    name = link
    link_hash[:name] = name
    link_hash[:uri] = "https://github.com/vim-scripts/#{name}"
    link_hash[:description] = fetch_github_repo_description('vim-scripts', name)
  end

  link_hash
end

def fetch_github_repo_description(user, name)
  response = ''
  api_url = "https://api.github.com/repos/#{user}/#{name}"

  # Without a GitHub Client / Secret token you will only be able to make 60
  # requests per hour, meaning you can only update the readme once.
  # Read more here http://developer.github.com/v3/#rate-limiting.
  if ENV['GITHUB_CLIENT_ID'] and ENV['GITHUB_CLIENT_SECRET']
    api_url += "?client_id=#{ENV['GITHUB_CLIENT_ID']}&client_secret=#{ENV['GITHUB_CLIENT_SECRET']}"
  end

  begin
    if RUBY_VERSION < '1.9'
      response = open(api_url).read
    else
      response = open(api_url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).read
    end
  rescue Exception => e
    message = "Problem fetching #{user}/#{name}."
    puts message + e.message
    return message
  end

  repo = JSON.parse response
  repo['description'].strip
end
