# User seeds:
User.create!(first_name: 'John', last_name: 'Smith', email: 'user_1@example.com', password: 'Password123!', role: 'default')

# Patient seeds:
Patient.create!(name: 'Test1', address: 'Test1 Street', city: 'Denver', state: 'CO', zip_code: 00111, last_visit: DateTime.new(2019, 1, 15, 17))
Patient.create!(name: 'Test2', address: 'Test2 Street', city: 'Denver', state: 'CO', zip_code: 00112, last_visit: DateTime.new(2019, 1, 30, 12))
Patient.create!(name: 'Test3', address: 'Test3 Street', city: 'Denver', state: 'CO', zip_code: 00113, last_visit: DateTime.new(2019, 2, 28, 11))

# Office seeds:
Office.create!(name: 'Test1 Office', address: 'Test1 Street', city: 'Denver', state: 'CO', zip_code: 00114, phone_number: 2253231999, hours: '8 AM - 5 PM', user_id: User.find(1).id, )

# Scan seeds:
Scan.create!(result: 'Moderate severity', patients_id: Patient.find(1).id)

# Appointment seeds:
Appointment.create!(date: DateTime.new(2019, 8, 15, 08), office_id: Office.find(1).id, patient_id: Patient.find(1).id, user_id: User.find(1).id, appointment_results: Scan.find(1).id)