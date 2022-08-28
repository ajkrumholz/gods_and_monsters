# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@khorne = God.create(name: "Khorne", age: 20, immortal: false)
@ursun = God.create(name: "Ursun", age: 20, immortal: false)
@slaanesh = God.create(name: "Slaanesh", age: 15, immortal: true)
@bloodthirster = @khorne.monsters.create!(name: "Bloodthirster", strength_rank: 8.5, flying: true)
@hellhound = @khorne.monsters.create!(name: "Hellhound", strength_rank: 5.5, flying: false)
@elemental_bear = @ursun.monsters.create!(name: "Elemental Bear", strength_rank: 7.0, flying: false)
@daemonette = @slaanesh.monsters.create!(name: "Daemonette", strength_rank: 3.5, flying: false)
@daemon_priestess = @slaanesh.monsters.create!(name: "Daemon Priestess", strength_rank: 9.0, flying: true)
