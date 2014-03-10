# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# UserInterest.destroy_all
Interest.destroy_all


Interest.create(name: "C")
Interest.create(name: "C++")
Interest.create(name: "C#")
Interest.create(name: "Java")
Interest.create(name: "JavaScript")
Interest.create(name: "PHP")
Interest.create(name: "Python")
Interest.create(name: "Ruby")


# l = User.create(first_name: "Lorin", last_name: "Thwaits", username: "lorinisdashit", email: "lorin@example.com", password: "example", location: "Los Angeles", latitude: 34.0128358, longitude: -118.495338)
# l.user_interests.create(interest: js)

# m = User.create(first_name: "Maren", last_name: "Woodruff", username: "marenishere", email: "maren@example.com", password: "example", location: "Los Angeles", latitude: 34.0128358, longitude: -118.495338)
# m.user_interests.create([{interest: js}, {interest: r}])