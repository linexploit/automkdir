require 'fileutils'


def check_if_user_gave_input
  abort("Il manque le nom de ton dossier :)") if ARGV.empty?
end

def get_folder_name
  return folder_name = ARGV.first
end

def create_folder(name)
  Dir.mkdir(name)
end

def create_folder_lib
  Dir.mkdir("lib")
end

def create_Gemfile
  File.open("Gemfile", "w") do |file|
    file.puts("
source 'https://rubygems.org'
ruby '3.2.2'
gem 'rubocop', '~> 0.57.2'
gem 'rspec'
gem 'pry'")
  end
end

def create_dot_env_file
  File.open(".env", "w") do |file|
    file.puts("# Add your environment variables here")
  end
end

def add_dot_env_to_gitignore
  File.open(".gitignore", "a") do |file|
    file.puts(".env")
  end
end

def initialize_rspec
  system("rspec --init")
end

def bundle_install
  system("bundle install")
end

def create_readme(folder_name)
  File.open("README.md", "w") do |file|
    file.puts("# THP _ xxx \n\n")
    file.puts("Lab from [The_Hacking_Project](https://www.thehackingproject.org/?locale=fr)\n\n")
    file.puts("xxx")
  end
end

def perform
  check_if_user_gave_input
  folder_name = get_folder_name
  create_folder(folder_name) 
  Dir.chdir(folder_name) do # cd = change directory
    create_folder_lib 
    create_Gemfile 
    create_dot_env_file
    add_dot_env_to_gitignore
    initialize_rspec
    bundle_install
    create_readme(folder_name)
  end
end

perform
