Character.delete_all

characters_data = [
  {
    name: 'Michael',
    life: 15,
    attack: 2,
    defense: 4,
    avatar: File.open('db/seeds/michael.jpg'),
  },
  {
    name: 'PinHead',
    life: 10,
    attack: 4,
    defense: 2,
    avatar: File.open('db/seeds/pinhead.jpg'),
  },
  {
    name: 'Jason',
    life: 14,
    attack: 2,
    defense: 4,
    avatar: File.open('db/seeds/jason.jpg'),
  },
  {
    name: 'Freddy',
    life: 11,
    attack: 3,
    defense: 3,
    avatar: File.open('db/seeds/freddy.jpg'),
  },
  {
    name: 'Chucky',
    life: 13,
    attack: 4,
    defense: 2,
    avatar: File.open('db/seeds/chucky.jpg'),
  },
  {
    name: 'Leatherface',
    life: 11,
    attack: 3,
    defense: 3,
    avatar: File.open('db/seeds/leatherface.jpg'),
  },
]

Character.delete_all

characters_data.each do |data|
  form = CharacterForm.new(Character.new)
  form.save if form.validate(data)
  puts form.errors.full_messages
end

weapons_data = [
  {
    name: 'Baseball bat',
    attack: 2,
    defense: 1,
    avatar: File.open('db/seeds/bat.png'),
  },
  {
    name: 'Chainsaw',
    attack: 4,
    defense: 1,
    avatar: File.open('db/seeds/chainsaw.png'),
  },
  {
    name: 'Machinegun',
    attack: 5,
    defense: 0,
    avatar: File.open('db/seeds/machinegun.png'),
  },
  {
    name: 'Machete',
    attack: 3,
    defense: 1,
    avatar: File.open('db/seeds/machete.png'),
  },
  {
    name: 'Claws',
    attack: 2,
    defense: 2,
    avatar: File.open('db/seeds/claws.png'),
  },
]

Weapon.delete_all

weapons_data.each do |data|
  form = WeaponForm.new(Weapon.new)
  form.save if form.validate(data)
end
