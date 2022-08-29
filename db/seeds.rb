# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@khorne = God.create(name: "Khorne", age: 40, immortal: true)
@ursun = God.create(name: "Ursun", age: 20, immortal: false)
@slaanesh = God.create(name: "Slaanesh", age: 15, immortal: true)
@nurgle = God.create(name: "Nurgle", age: 30, immortal: true)
@sigmar = God.create(name: "Sigmar", age: 2, immortal: false)


@bloodthirster = @khorne.monsters.create!(name: "Bloodthirster", strength_rank: 9.0, flying: true)
@hellhound = @khorne.monsters.create!(name: "Hellhound", strength_rank: 5.5, flying: false)
@chaos_furies = @khorne.monsters.create!(name: "Chaos Furies", strength_rank: 3.5, flying: true)

@elemental_bear = @ursun.monsters.create!(name: "Elemental Bear", strength_rank: 8.5, flying: false)
@ice_leopard = @ursun.monsters.create!(name: "Ice Leopard", strength_rank: 4.0, flying: false)
@little_grom = @ursun.monsters.create!(name: "Little Grom", strength_rank: 6.5, flying: false)

@daemonette = @slaanesh.monsters.create!(name: "Daemonette", strength_rank: 3.5, flying: false)
@daemon_priestess = @slaanesh.monsters.create!(name: "Daemon Priestess", strength_rank: 9.0, flying: true)
@soul_grinder = @slaanesh.monsters.create!(name: "Soul Grinder", strength_rank: 8.5, flying: false)

@plague_drones = @nurgle.monsters.create!(name: "Plague Drones", strength_rank: 5.5, flying: true)
@festus = @nurgle.monsters.create!(name: "Festus", strength_rank: 8.0, flying: false)
@great_unclean = @nurgle.monsters.create!(name: "Great Unclean One", strength_rank: 7.5, flying: true)
@nurglings = @nurgle.monsters.create!(name: "Nurglings", strength_rank: 2.5, flying: false)

@deathclaw = @sigmar.monsters.create!(name: "Deathclaw", strength_rank: 9.0, flying: true)
@altdorf_gryphites = @sigmar.monsters.create!(name: "Royal Altdorf Gryphites", strength_rank: 8.0, flying: true)
@luminark = @sigmar.monsters.create!(name: "Luminark of Hysh", strength_rank: 7.5, flying: false)


