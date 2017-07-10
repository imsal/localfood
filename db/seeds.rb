# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# super admin
User.create(email: 'superadmin@superadmin.com', password: 'meatloaf21', password_confirmation: 'meatloaf21', first_name: 'Super', last_name:'Admin',phone_number:'661-904-5259',street_address:'23616 Mesa Ct.',suite: nil ,city:'Valencia',state:'California',zip_code:'91355',business_name:'Sals Sausages',food_category:'Italian', notes: nil,super_admin_role: true, admin_role: false , business_role: false ,customer_role: false)

# admin
User.create(email: 'admin@admin.com', password: 'meatloaf21', password_confirmation: 'meatloaf21', first_name: 'Super', last_name:'Admin',phone_number:'661-904-5259',street_address:'23616 Mesa Ct.',suite: nil ,city:'Valencia',state:'California',zip_code:'91355',business_name:'Sals Sausages',food_category:'Italian', notes: nil,super_admin_role: false, admin_role: true , business_role: false ,customer_role: false)

# business
User.create(email: 'business@business.com', password: 'meatloaf21', password_confirmation: 'meatloaf21', first_name: 'Super', last_name:'Admin',phone_number:'661-904-5259',street_address:'23616 Mesa Ct.',suite: nil ,city:'Valencia',state:'California',zip_code:'91355',business_name:'Sals Sausages',food_category:'Italian', notes: nil,super_admin_role: false, admin_role: false , business_role: true ,customer_role: false)

# customer
User.create(email: 'customer@customer.com', password: 'meatloaf21', password_confirmation: 'meatloaf21', first_name: 'Super', last_name:'Admin',phone_number:'661-904-5259',street_address:'23616 Mesa Ct.',suite: nil ,city:'Valencia',state:'California',zip_code:'91355',business_name:'Sals Sausages',food_category:'Italian', notes: nil,super_admin_role: false, admin_role: false , business_role: false ,customer_role: true)
