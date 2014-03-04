# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

UserInterest.destroy_all
Interest.destroy_all

r = Interest.create(name: "Ruby")
Interest.create(name: "Python")
js = Interest.create(name: "JavaScript")

l = User.create(first_name: "Lorin", last_name: "Thwaits", username: "lorinisdashit", email: "lorin@example.com", password: "example", location: "Los Angeles")
l.user_interests.create(interest: js)

m = User.create(first_name: "Maren", last_name: "Woodruff", username: "marenishere", email: "maren@example.com", password: "example", location: "Los Angeles")
m.user_interests.create([{interest: js}, {interest: r}])