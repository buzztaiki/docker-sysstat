require 'rake/clean'
require 'erb'

IMAGE = "buzztaiki/sysstat"
TAGS = %w(centos5 centos6 centos7)
SRC = %w(Dockerfile.erb entrypoint)
CLOBBER.include(TAGS)

task :default => :dockerfile

desc "generate all Dockerfiles"
task :dockerfile

TAGS.each do |tag|
  directory tag
  SRC.each do |src|
    name = "#{tag}/#{File.basename(src, '.erb')}"
    task :dockerfile => name
    file name => [tag, src] do
      if File.extname(src) == ".erb"
        template src, name, Vars.new(tag: tag)
      else
        cp src, name
      end
    end
  end

  namespace :image do
    desc "build all images"
    task :all => tag

    desc "build #{tag} image"
    task tag => :dockerfile do |t|
      sh "docker build -t #{IMAGE}:#{tag} #{tag}"
    end
  end
end


class Vars
  def initialize(hash)
    hash.each {|k, v| instance_variable_set("@#{k}", v)}
  end
end

def template(input, output, vars)
  puts "template #{input} #{output}"
  erb = ERB.new(File.read(input), nil, "-")
  File.write(output, erb.result(vars.instance_eval { binding }))
end

