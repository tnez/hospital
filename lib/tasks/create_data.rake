task :create_data => :environment do

  puts "Populating Symptoms"
  symptoms_f = File.open("#{Rails.root}/app/assets/data/symptoms.txt", "r")
  # puts symptoms_f.inspect
  symptoms_f.each_line do |symptom|
    Symptom.find_or_create_by!(description: symptom)
  end
  symptoms_f.close

end
