
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

5.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

sub = ["Математика", "Русский язык", "Информатика", "Физика", "Химия", "Биология", "История", "Обществознание", "Литература", "Английский язык", "География"]
types = ["A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9"]
sub.each do |n|
  intime_sub = Subject.create!(:name => n, :photo =>"q")
  types.each do |m|
    TaskType.create!(
      name: m,
      subject_id: intime_sub.id
    )
  end
end
