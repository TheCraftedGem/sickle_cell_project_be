# User seeds:
User.create!(office_id: 1, first_name: 'John', last_name: 'Smith', email: 'user_1@example.com', password: 'Password123!', role: 'default', status: 'active', street_address: 'UserTestAddress', city: 'Denver', state: 'CO', zip_code: 00114)

# Patient seeds:
Patient.create!(name: 'Test1', street_address: 'Test1 Street', city: 'Denver', state: 'CO', zip_code: 00111, last_visit: DateTime.new(2019, 1, 15, 17), date_of_birth: "01/1/1998")
Patient.create!(name: 'Test2', street_address: 'Test2 Street', city: 'Denver', state: 'CO', zip_code: 00112, last_visit: DateTime.new(2019, 1, 30, 12), date_of_birth: "02/7/1950")
Patient.create!(name: 'Test3', street_address: 'Test3 Street', city: 'Denver', state: 'CO', zip_code: 00113, last_visit: DateTime.new(2019, 2, 28, 11), date_of_birth: "03/17/1994")

# Office seeds:
Office.create!(name: 'Test1 Office', street_address: 'Test1 Street', city: 'Denver', state: 'CO', zip_code: 00114, phone_number: 2253231999, hours: '8 AM - 5 PM', user_id: User.find(1).id, )

# Scan seeds:
Scan.create!(result: 'Moderate severity', patient_id: Patient.find(1).id)

# Appointment seeds:
Appointment.create!(date: DateTime.new(2019, 8, 15, 14), last_visit: DateTime.new(2019, 8, 12, 12), office_id: Office.find(1).id, patient_id: Patient.find(1).id, user_id: User.find(1).id, appointment_result: Scan.find(1).id)

User.find(1).update(confirmation_code: nil)
User.find(1).update(confirmed_at: Time.now.utc)
User.find(1).update(confirmation_sent_at: Time.now.utc)
User.find_each { |user| user.update_attribute(:otp_secret_key, User.otp_random_secret) }