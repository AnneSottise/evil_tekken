Character.delete_all

characters_data = [
  {
    name: 'Michael Myers',
    life: 15,
    attack: 3,
    defense: 4,
    level: 1,
    avatar: File.open('db/seeds/michael.jpg'),
  },
  {
    name: 'PinHead',
    life: 10,
    attack: 5,
    defense: 2,
    level: 1,
    avatar: File.open('db/seeds/pinhead.jpg'),
  },
  {
    name: 'Jason Voorhees',
    life: 14,
    attack: 4,
    defense: 3,
    level: 1,
    avatar: File.open('db/seeds/jason.jpg'),
  },
  {
    name: 'Freddy Krueger',
    life: 11,
    attack: 3,
    defense: 4,
    level: 1,
    avatar: File.open('db/seeds/freddy.jpg'),
  },
  {
    name: 'Chucky',
    life: 13,
    attack: 6,
    defense: 1,
    level: 1,
    avatar: File.open('db/seeds/chucky.jpg'),
  },
  {
    name: 'Leatherface',
    life: 11,
    attack: 5,
    defense: 2,
    level: 1,
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
    avatar: File.open('db/seeds/bat.jpg'),
  },
  {
    name: 'Chainsaw',
    attack: 2,
    defense: 1,
    avatar: File.open('db/seeds/chainsaw.jpg'),
  },
  {
    name: 'DFlamethrower',
    attack: 2,
    defense: 0,
    avatar: File.open('db/seeds/flamethrower.jpg'),
  },
  {
    name: 'Machete',
    attack: 1,
    defense: 1,
    avatar: File.open('db/seeds/machete.jpg'),
  },
  {
    name: 'Claws',
    attack: 2,
    defense: 2,
    avatar: File.open('db/seeds/claws.jpg'),
  },
]

Weapon.delete_all

weapons_data.each do |data|
  form = WeaponForm.new(Weapon.new)
  if form.validate(data)
    form.save
  else
    puts form.errors.full_messages
  end
end
