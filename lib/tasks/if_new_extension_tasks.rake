namespace :radiant do
  namespace :extensions do
    namespace :if_new do
      
      desc "Runs the migration of the If New extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          IfNewExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          IfNewExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the If New to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from IfNewExtension"
        Dir[IfNewExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(IfNewExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
