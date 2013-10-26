# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

languages = [
  {
    name: "Ruby",
    extensions: [".rb", ".erb"],
    ratio: 1.7
  },
  {
    name: "Javascript",
    extensions: [".js"],
    ratio: 1.3
  },
  {
    name: "CSS",
    extensions: [".css"],
    ratio: 1
  },
  {
    name: "HTML",
    extensions: [".html"],
    ratio: 1
  },
  {
    name: "C",
    extensions: [".c"],
    ratio: 2.2
  },
  {
    name: "C++",
    extensions: [".cpp"],
    ratio: 2.1
  },
  {
    name: "PHP",
    extensions: [".php"],
    ratio: 1.5
  },
  {
    name: "C#",
    extensions: [".cs"],
    ratio: 1.3
  },
  {
    name: "ASP",
    extensions: [".asp", ".aspx"],
    ratio: 1.4
  },
  {
    name: "Java",
    extensions: [".java", ".jav", ".j"],
    ratio: 1.6
  },
]

languages.each { |l| Language.create({name: l[:name], extensions: l[:extensions], ratio: l[:ratio]}) }
