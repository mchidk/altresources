# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'
include Rake::DSL

E9Staging::Application.load_tasks

ssh_user    = 'ubuntu@50.16.230.36'
remote_root = '/srv/www/altresources'
ssh_key     = `echo ~/.ec2/gsg-keypair.pem`.delete("\n")
dropbox_dir = `echo ~/dropbox/e9/jobs/altresources/public`.delete("\n")

task :deploy do
  if remote_root && ssh_user
    puts "** deploying site"
    system "rsync -avz --no-l -O --rsh 'ssh -i #{ssh_key}' --delete --exclude 'uploads' public/ #{ssh_user}:#{remote_root}"
  else
    puts "you must ssh_user and remote_root in Rakefile"
  end
end

namespace :deploy do
  namespace :javascripts do
    task :clear do
      puts "** clearing compressed javascripts"
      system "rm -Rfv public/assets/*"
    end

    task :generate => :clear do
      puts "** compressing javascripts"
      system "jammit -c config/assets.yml -o public/assets -f"
    end
  end

  namespace :styles do
    task :clear do
      puts "** clearing generated styles"
      system 'find public/stylesheets -name "*.css" -exec rm {} \;'
    end

    task :generate => :clear do
      puts "** generating styles" 
      system 'compass compile -c config/compass.rb'
    end
  end

  task :prepare => %w(deploy:styles:generate deploy:javascripts:generate)
end

namespace :dropbox do
  desc "Sync images from dropbox to src"
  task :images do
    if dropbox_dir.empty?
      puts "** skipping dropbox image sync: dropbox_dir is not defined"
    else
      if not File.directory?(d = File.join(dropbox_dir, 'images'))
        puts "** skipping dropbox image sync: '#{d}' is not a directory"
      else
        puts "** synching images from dropbox"
        system("rsync -avz --delete \"#{d}\" public/")
      end
    end
  end

  desc "Sync favicon from dropbox to src"
  task :favicon do
    if dropbox_dir.empty?
      puts "** skipping dropbox favicon sync: dropbox_dir is not defined"
    else
      if not File.exists?(f = File.join(dropbox_dir, 'favicon.ico'))
        puts "** skipping favicon sync: '#{f}' does note exist"
      else
        puts "** synching favicon from dropbox"
        system("cp #{f} public/")
      end
    end
  end

  desc "Sync required files from dropbox"
  task :sync => [:images, :favicon]

end

namespace :contacts do
  desc "Import Contacts from CSV"
  task :import => :environment do
    require 'csv'

    csv = Rails.root.join('db/contacts.csv')
    raise "#{csv} does not exist. Stopping task." if !File.exists?(csv)

    FIRST_NAME = 'B'
    LAST_NAME  = 'D'
    COMPANY    = 'F'
    TITLE      = 'H'
    SUBSCRIBED = ''
    EMAIL      = ''
    PHONE      = ''
    TAGS       = ''
    INFO       = ''

    CSV.foreach(csv, :headers => true) do |row|
      puts "Importing: #{row.fields.join(' > ').inspect}"

      unless email = row[EMAIL]
        puts "    ERROR: no email found in #{row.fields.join(' > ').inspect}"
      else
        mailing_list = MailingList.default

        user = User.find_by_email(email) || begin
          User.prospects.create({
            :email         => row[EMAIL],
            :first_name    => row[FIRST_NAME],
            :last_name     => row[LAST_NAME],
            :mailing_lists => row[SUBSCRIBED].to_s.strip == 'TRUE' ? [mailing_list] : []
          })
        end
        
        unless user.persisted?
          puts "    ERROR: User record not saved #{user.errors.inspect}"
          next
        end

        unless user.contact.present?
          user.create_contact_if_missing!
          user.reload
        end

        contact = user.contact

        # basic columns
        contact.first_name   = row[FIRST_NAME].presence || contact.first_name
        contact.last_name    = row[LAST_NAME].presence  || contact.last_name
        contact.title        = row[TITLE].presence      || contact.title
        contact.info         = row[INFO].presence       || contact.info

        # company name | company generation
        contact.company_name = row[COMPANY].presence    || contact.company_name

        # phone number record attributes
        if row[PHONE].present?
          numbers = row[PHONE].to_s.split('|').map(&:strip)
          numbers = numbers - contact.phone_number_attributes.map(&:value)
          contact.phone_number_attributes_attributes = numbers.map {|num| { :value => num } }
        end

        # tags
        if row[TAGS].present?
          contact.tag_lists = {'users__h__' => row[TAGS].split('|').map(&:strip) | contact.tag_list_on('users__h__') }
        end

        if contact.save
          puts "    SUCCESS Contact #{contact.id} Imported : #{contact.name}"
        else
          puts "    ERROR Contact #{contact.id} Import Failed : #{contact.errors.inspect}"
        end
      end
    end
  end
end
