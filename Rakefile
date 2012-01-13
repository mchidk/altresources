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

    FIRST_NAME = 0
    LAST_NAME  = 1
    COMPANY    = 2
    TITLE      = 3
    BIZ_1      = 4
    BIZ_2      = 5
    BIZ_3      = 6
    BIZ_4      = 7
    FAX_PHONE  = 8
    BIZ_PHONE  = 9
    MOB_PHONE  = 10
    EMAIL      = 11
    INFO       = 12
    WEBSITE    = 13

    CSV.foreach(csv, :headers => true) do |row|
      puts "Importing: #{row.fields.join(' > ').inspect}"

      unless email = row[EMAIL]
        puts "    ERROR: no email found in #{row.fields.join(' > ').inspect}"

        contact = Contact.new
      else
        mailing_list = MailingList.default

        user = User.find_by_email(email) || begin
          User.prospects.create({
            :email         => row[EMAIL],
            :first_name    => row[FIRST_NAME],
            :last_name     => row[LAST_NAME],
            :mailing_lists => [mailing_list]
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
      end

      # basic columns
      contact.first_name   = row[FIRST_NAME].presence || contact.first_name
      contact.last_name    = row[LAST_NAME].presence  || contact.last_name
      contact.title        = row[TITLE].presence      || contact.title
      contact.info         = row[INFO].presence       || contact.info

      # company name | company generation
      contact.company_name = row[COMPANY].presence    || contact.company_name

      # address
      address = [
        row[BIZ_1].presence, 
        [
          [row[BIZ_2], row[BIZ_3]].join(' ').strip.presence, 
          row[BIZ_4].presence
        ].compact.join(', ').presence
      ].join("\n")

      if address.present?
        contact.address_attributes_attributes = [{ :value => address, :options => { :type => 'Work' }}]
      end

      # phone number record attributes
      number_attrs = []

      if phone = row[BIZ_PHONE].presence
        unless contact.phone_number_attributes.map(&:value).member?(phone.strip)
          number_attrs << { :value => phone, :options => { :type => 'Work' } }
        end
      end

      if phone = row[MOB_PHONE].presence
        unless contact.phone_number_attributes.map(&:value).member?(phone.strip)
          number_attrs << { :value => phone, :options => { :type => 'Mobile' } }
        end
      end

      if phone = row[FAX_PHONE].presence
        unless contact.phone_number_attributes.map(&:value).member?(phone.strip)
          number_attrs << { :value => phone, :options => { :type => 'Fax' } }
        end
      end

      if number_attrs.any?
        contact.phone_number_attributes_attributes = number_attrs
      end

      if website = row[WEBSITE].presence
        contact.website_attributes_attributes = [{ :value => website, :options => {:type => 'Work'}}]
      end

      contact.tag_lists = {'users__h__' => ['Johns Contacts'] | contact.tag_list_on('users__h__') }

      if contact.save
        puts "    SUCCESS Contact #{contact.id} Imported : #{contact.name}"
      else
        puts "    ERROR Contact #{contact.id} Import Failed : #{contact.errors.inspect}"
      end
    end
  end
end
