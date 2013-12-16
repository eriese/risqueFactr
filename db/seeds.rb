# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
Instrument.delete_all
Pronoun.delete_all
Disease.delete_all
instruments = Instrument.create([{part: "hand"}, {part: "genitals"}, {part: "anus"}, {part: "mouth"}, {part: "toys"}])
pronouns = Pronoun.create([{subject: "ze", object: "hir", possessive: "hir" , obj_possessive: "hirs", reflexive: "hirself"}, {subject: "she", object: "her", possessive: "her", obj_possessive: "hers", reflexive: "herself"}, {subject: "he", object: "him", possessive: "his", obj_possessive: "his", reflexive: "himself"}, {subject: "they", object: "them", possessive: "their", obj_possessive: "theirs", reflexive: "themself"}])
diseases = Disease.create([{name: "chlamydia", gestation_min: 1, gestation_max: 4 }, {name: "gonorrhea", gestation_min: 1, gestation_max: 3 }, {name: "syphillis", gestation_min: 1,gestation_max: 12}, {name: "HIV", gestation_min: 4, gestation_max: 12}, {name: "hepatitis C", gestation_min: 6, gestation_max: 12}, {name: "hepatitis B", gestation_min: 6, gestation_max: 12}, {name: "herpes", gestation_min: 3, gestation_max: 12}, {name: "hepatitis A", gestation_min: 2, gestation_max: 7}, {name: "HPV", gestation_min: 8, gestation_max: 80}, {name: "trichomoniasis", gestation_max: 4, gestation_min: 1}, {name: "cytomegalovirus", gestation_max: 12, gestation_min: 3}, {name: "molluscum contagiosum", gestation_min: 2, gestation_max: 24}, {name: "bacterial vaginosis", gestation_min: 0, gestation_max: 1}])
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
