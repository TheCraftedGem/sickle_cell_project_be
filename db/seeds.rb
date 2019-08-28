# User seeds:
User.create!(office_id: 1, first_name: 'John', last_name: 'Smith', email: 'user_1@example.com', password: 'Password123!', role: 'default', status: 'active', phone_number: '225 233-3232', confirmation_code: nil, confirmed_at: rand(10.years).seconds.ago)

# Patient seeds:
Patient.create!(first_name: 'Test1', last_name: 'Test_last1', street_address: 'Test1 Street', city: 'Denver', state: 'CO', zip_code: 00111, last_visit: DateTime.new(2019, 1, 15, 17), phone_number: '232-323-2323')
Patient.create!(first_name: 'Test2', last_name: 'Test_last2', street_address: 'Test2 Street', city: 'Denver', state: 'CO', zip_code: 00112, last_visit: DateTime.new(2019, 1, 30, 12), phone_number: '232-323-2323')
Patient.create!(first_name: 'Test3', last_name: 'Test_last3', street_address: 'Test3 Street', city: 'Denver', state: 'CO', zip_code: 00113, last_visit: DateTime.new(2019, 2, 28, 11), phone_number: '232-323-2323')

# Office seeds:
Office.create!(name: 'Test1 Office', street_address: 'Test1 Street', city: 'Denver', state: 'CO', zip_code: 00114, phone_number: '2253231999', user_id: User.find(1).id, )

# Scan seeds:
Scan.create!(result: rand(1..3), note: Faker::Hipster.paragraph(sentence_count: 4), patient_id: Patient.find(1).id)

# Appointment seeds:
Appointment.create!(date: DateTime.new(2019, 8, 15, 14), office_id: Office.find(1).id, patient_id: Patient.find(1).id, user_id: User.find(1).id, appointment_result: rand(1..6))
