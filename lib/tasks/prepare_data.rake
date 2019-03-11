namespace :db do
  task prepare_data: :environment do
    if !Rails.env.development? && !Rails.env.staging?
      puts 'this script can be executed only Development or Staging Environment.'
      exit
    end

    db_config = Rails.configuration.database_configuration
    db_host = db_config[Rails.env]['host']
    db_username = db_config[Rails.env]['username']
    db_password = db_config[Rails.env]['password']
    db_database = db_config[Rails.env]['database']

    mysql_connect_cmd = "mysql --local-infile -h #{db_host} -u #{db_username} -P 3306 -D #{db_database} -p#{db_password}"

    Dir.chdir Rails.root + './lib/tasks/data' do
      puts 'Data Trancate start.'
      `#{mysql_connect_cmd} < truncate.sql`
      puts 'Data Trancate end.'
      puts 'Data Load start.'
      `#{mysql_connect_cmd} < load.sql`
      puts 'Data load end.'
    end
  end
end
