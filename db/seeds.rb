# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
Instrument.delete_all
Pronoun.delete_all
User.delete_all
instruments = Instrument.create([{part: "hand"}, {part: "genitals"}, {part: "anus"}, {part: "mouth"}, {part: "toys"}])
pronouns = Pronoun.create([{subject: "ze", object: "hir", possessive: "hir" , obj_possessive: "hirs", reflexive: "hirself"}, {subject: "she", object: "her", possessive: "her", obj_possessive: "hers", reflexive: "herself"}, {subject: "he", object: "him", possessive: "his", obj_possessive: "his", reflexive: "himself"}, {subject: "they", object: "them", possessive: "their", obj_possessive: "theirs", reflexive: "themself"}])
u1 = User.create({name: "Enoch Riese", email:"enoch@enoch.com", password: "pass", password_confirmation: "pass"})
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
