namespace :db do

  task :populate_patients => :environment do
    N = 100
    puts 'Populating patients'
    N.times do
      new_patient = Patient.new(
        # set date of birth between 100 and 10 years ago
        date_of_birth: (rand(90.years) + 10.years).seconds.ago,
        blood_type: Patient::BLOOD_TYPES.sample,
        gender: Patient::GENDERS.sample
      )
      # patient_name
      new_name = Name.new(
        title: Name::TITLES.sample,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name
      )
      new_patient.name = new_name
      # patient_address
      new_address = Address.new(
        street1: Faker::Address.street_address,
        # create a secondary address 20% of the time
        street2: rand(10) < 2 ? Faker::Address.secondary_address : '',
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        zipcode: Faker::Address.zip
      )
      new_patient.address = new_address
      new_patient.save!
    end
  end

  task :define_symptoms => :environment do
    puts "Populating Symptoms"
    symptoms_f = File.open("#{Rails.root}/app/assets/data/symptoms.txt", "r")
    # puts symptoms_f.inspect
    symptoms_f.each_line do |symptom|
      Symptom.find_or_create_by!(description: symptom)
    end
    symptoms_f.close
  end

  task :generate_cases => :environment do
    puts 'Generating Cases'
    1000.times do
      # create a new case
      random_time = rand(5.years).seconds.ago
      new_case = Case.new(
        description: Faker::Lorem.sentences(1).first,
        created_at: random_time,
        updated_at: random_time
      )
      # choose up to 10 symptoms to associate
      num_symptoms = rand(10)
      num_symptoms.times do
        random_symptom = Symptom.find(rand(Symptom.count) +1)
        new_case.symptoms.push(random_symptom)
      end
      # choose a patient at random to attribute case
      random_patient = Patient.find(rand(Patient.count) +1)
      new_case.patient = random_patient
    end
  end

  task :initialize => :environment do
    Rake::Task["db:drop"].execute
    Rake::Task["db:create"].execute
    Rake::Task["db:migrate"].execute
    Rake::Task["db:populate_patients"].execute
    Rake::Task["db:define_symptoms"].execute
    Rake::Task["db:generate_cases"].execute
  end

end
