//
//  MockSelectGamesService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 28.03.2021.
//

import Foundation

class MockSelectGamesService: SelectGamesServiceProtocol {
    func getGamesArray(completion: @escaping (Result<[Game], Error>) -> Void) {
        let names = ["007 Legends", "007 Квант Милосердия", "50 Cent: Blood on the Sand", "A Plague Tale: Innocence", "A Way Out", "Ace Combat 7: Skies Unknown (поддержка PS VR)", "Ace Combat: Assault Horizon", "Adventure Time: Pirates of Enchiridion", "Afro Samurai", "Agents of Mayhem", "Air Conflicts: Vietnam - Ultimate Edition", "Alan Wake", "Alice: Madness Returns", "Alien: Isolation", "Aliens vs Predator", "All-Stars Battle Royale / Звезды PlayStation: Битва сильнейших", "Alone in the Dark: Inferno", "Alpha Protocol", "Anarchy Reigns", "Angry Birds Star Wars", "Anthem", "Apache: Air Assault", "Arcana Heart 3", "Arcania: The Complete Tale", "Arizona Sunshine (только для VR)", "Armored Core 5", "Armored Core: For Answer", "Armored Core: Verdict Day", "Army Corps of Hell", "Army of Two", "Army of Two: The 40th Day", "Army of Two: The Devil’s Cartel", "Army of Two: The Devil's Cartel Overkill Edition", "Asphalt: Injection", "Assassin’s Creed. Сага о Новом Свете", "Assassin's Creed", "Assassin's Creed 2", "Assassin's Creed 2 Game of The Year", "Assassin's Creed Chronicles: Трилогия", "Assassin's Creed III", "Assassin's Creed III: Освобождение", "Assassin's Creed IV Чёрный флаг", "Assassin's Creed IV Чёрный флаг Buccaneer Edition комплект без диска", "Assassin's Creed Братство Крови", "Assassin's Creed Изгой", "Assassin's Creed Откровения", "Assassin's Creed: Единство", "Assassin's Creed: Изгой. Обновленная версия", "Assassin's Creed: Истоки", "Assassin's Creed: Одиссея", "Assassin's Creed: Синдикат", "Assassin's Creed: Эцио Аудиторе. Коллекция", "ASTRO BOT Rescue Mission (только для VR)", "Asura's Wrath", "Atelier Ayesha: Alchemist of Dusk", "Atelier Meruru: The Apprentice of Arland", "Atelier Rorona Plus: The Alchemist of Arland", "Atelier Rorona: The Alchemist of Arland", "Bakugan Battle Brawlers", "Bakugan Battle Brawlers - Defenders of the Core", "Batman Arkham Asylum", "Batman Arkham Asylum Game of the Year", "Batman: Arkham Asylum", "Batman: Arkham Asylum Game Of The Year", "Batman: Arkham City", "Batman: Arkham City Game Of The Year", "Batman: Arkham City Game of the Year", "Batman: Arkham Origins", "Batman: Arkham Origins / Летопись Аркхема", "Batman: Arkham Origins Blackgate", "Batman: Return to Arkham", "Batman: Рыцарь Аркхема", "Battlefield 1", "Battlefield 3", "Battlefield 4", "Battlefield Hardline", "Battlefield Hardline. Deluxe Edition", "Battlefield V", "Battlefield: Bad Company", "Battlefield: Bad Company 2", "Battlezone (только для VR)", "Bayonetta", "Ben 10 Galactic Racing", "Bionic Commando", "Bioshock", "BioShock", "Bioshock 2", "Bioshock Infinite", "Bioshock Ultimate Rapture Edition (Bioshock + Bioshock 2)", "BioShock: The Collection", "Birds of Steel", "BlackSite: Area 51", "Blades of Time", "Bladestorm: The Hundred Years War", "BlazBlue: Continuum Shift Extend", "Blazing Angels 2: Secret Missions of WWII", "Blazing Angels: Squadrons of WWII", "Bleach: Soul Resurreccion", "Blood Drive", "Bloodborne: Порождение крови", "Bloodborne: Порождение крови. Game of the Year Edition", "Blur", "Borderlands", "Borderlands 2", "Borderlands 2 [PS Vita, русская документация]", "Borderlands 2 Game Of The Year", "Borderlands 3", "Borderlands Collection (Borderlands GOTY Edition and Borderlands 2)", "Borderlands Game Of The Year Edition", "Borderlands: The Handsome Collection", "Borderlands: The Pre-Sequel!", "Bravo Team (только для VR)", "Brink", "Brutal Legend", "Bulletstorm", "Bulletstorm: Full Clip edition", "Burnout 4 Revenge", "Burnout Paradise", "Burnout Paradise Remastered", "Burnout Paradise The Ultimate Box", "Cabela's Survival: Shadows of Katmai", "Call of Cthulhu", "Call of Duty 4: Modern Warfare", "Call of Duty 4: Modern Warfare Game of the Year Edition", "Call of Duty Ghosts", "Call of Duty: Advanced Warfare", "Call of Duty: Black Ops", "Call of Duty: Black Ops - Declassified", "Call of Duty: Black Ops 4", "Call of Duty: Black Ops II", "Call of Duty: Black Ops III", "Call of Duty: Infinite Warfare", "Call of Duty: Modern Warfare 2", "Call Of Duty: Modern Warfare 2", "Call of Duty: Modern Warfare 2 Prestige Edition", "Call of Duty: Modern Warfare 3", "Call of Duty: Modern Warfare Remastered", "Call of Duty: World at War", "Call of Duty: WWII", "Call of Juarez 2: Bound in Blood", "Call of Juarez: Bound in Blood", "Call of Juarez: The Cartel", "Captain America: Super Soldier", "Castlevania: Lords of Shadow", "Castlevania: Lords of Shadow 2", "Catherine", "Child of Eden", "Child of Light. Complete Edition", "Clash of the Titans", "Clive Barker's Jericho", "Code Vein", "Colin McRae: DIRT", "Colin McRae: DIRT 2", "Command & Conquer 3: Tiberium Wars", "Command & Conquer: Red Alert 3", "Command & Conquer: Red Alert 3 Ultimate Edition", "Conan", "Condemned 2", "Conflict: Denied Ops", "Control", "Crackdown", "Crash Bandicoot N’sane Trilogy", "Crash Mind over Mutant", "Crash of the Titans", "Crew", "Crysis 2", "Crysis 2 (Руская версия)", "Crysis 3", "Damnation", "Dance Central 2", "Dante's Inferno", "Dark Messiah of Might and Magic: Elements", "Dark Sector", "Dark Souls", "Dark Souls II", "Dark Souls II: Scholar of The First Sin", "Dark Souls III", "Dark Souls III. The Fire Fades Edition", "Dark Souls: Prepare to Die Edition", "Dark Souls: Remastered", "Dark Void", "Darkness II", "Darksiders", "Darksiders II", "Darksiders III", "De Blob 2: The Underground", "Dead Island", "Dead Island Definitive Edition", "Dead Island Double Pack", "Dead Island Полное издание", "Dead Island: Riptide", "Dead or Alive 4", "Dead or Alive 5", "Dead or Alive 5 Ultimate", "Dead or Alive 5: Last Round", "Dead Rising", "Dead Rising 2", "Dead Rising 2: Off The Record", "Dead Rising 3", "Dead Space", "Dead Space 2", "Dead Space 3", "Dead To Rights Retribution", "Deadly Premonition: The Director's Cut", "Deadpool", "Death Stranding", "Deception IV: Blood Ties", "Deception IV: The Nightmare Princess", "Def Jam Icon", "Demon's Souls", "Destiny", "Destiny 2", "Destroy All Humans! Path of the Furon", "Deus Ex: Human Revolution", "Deus Ex: Mankind Divided", "Devil May Cry 4", "Devil May Cry 5", "Devil May Cry HD Collection", "Devil May Cry: HD Collection", "Diablo III", "Diablo III: Reaper of Souls. Ultimate Evil Edition", "DiRT 3", "DIRT 3 Complete Edition", "DiRT 3 Complete Edition", "Dirt 4", "DIRT Showdown", "DiRT: Rally", "Disgaea 5: Alliance of Vengeance", "Dishonored", "Dishonored 2", "Dishonored Game of the Year Edition", "Dishonored. Definitive Edition", "Dishonored: Death of the Outsider", "Disney DuckTales Remastered", "Disney Храбрая сердцем", "Dissidia Final Fantasy NT", "Divinity 2: The Dragon Knight Saga", "Divinity. Original Sin: Enhanced Edition", "Divinity: Original Sin II. Definitive Edition", "DmC Devil May Cry", "DmC Devil May Cry. Definitive Edition", "DOOM", "DOOM 3 BFG Edition", "Dragon Age 2", "Dragon Age II", "Dragon Age: Инквизиция", "Dragon Age: Инквизиция. Deluxe Edition", "Dragon Age: Начало", "Dragon Ball FighterZ", "Dragon Quest Heroes 2", "Dragon Quest Heroes: The World Tree's Woe and the Blight Below", "Dragon’s Crown Pro", "Dragon's Crown", "Dragon's Dogma", "Dragon's Dogma: Dark Arisen", "Drakengard 3", "Dreamcast Collection", "Driveclub", "Driveclub VR (только для VR)", "Driver San Francisco", "Driver: San Francisco", "Duke Nukem Forever", "Dungeon Hunter: Alliance", "Dungeon Siege III", "Dying Light", "Dying Light: The Following", "EA Sports MMA", "Eagle Flight (только для VR)", "eFootball PES 2020", "El Shaddai – Ascension of the Metatron", "Elder Scrolls IV: Oblivion", "Elder Scrolls IV: Oblivion - 5th Anniversary Edition", "Elder Scrolls V: Skyrim", "Elder Scrolls V: Skyrim VR (только для VR)", "Elder Scrolls V: Skyrim Legendary Edition", "Elder Scrolls V: Skyrim. Special Edition", "ELEX", "Enchanted Arms", "Enslaved: Odyssey to the West", "Epic Mickey 2: The power of two", "Epic Mickey 2: The Power of Two", "Epic Mickey: Две легенды", "Eternal Sonata", "Eve Valkyrie (только для VR)", "Evil Within 2", "F.E.A.R.", "F.E.A.R. 2 Project Origin", "F.E.A.R. 3", "F1 2013", "F1 2014", "Fable 2", "Fable 3", "Fable Anniversary", "Fable: The Journey", "FaceBreaker", "Fallout 3 (Pусская версия)", "Fallout 3 Game of the Year", "Fallout 4", "Fallout 76", "Fallout: New Vegas", "Fantastic 4: Rise of the Silver Surfer", "Far Cry 2", "Far Cry 3", "Far Cry 3. Classic Edition", "Far Cry 4", "Far Cry 4. Специальное издание", "Far Cry 5", "Far Cry Instincts: Predators", "Far Cry Primal", "Far Cry. New Dawn", "Farpoint (только для VR)", "Fast & Furious: Showdown", "Ferrari Challenge Deluxe", "Ferrari Challenge Trofeo Pirelli", "FIFA 13", "FIFA 14 Legacy Edition", "FIFA 15", "FIFA 16", "FIFA 17", "FIFA 18", "FIFA 18. Legacy Edition", "FIFA 19", "FIFA 19. Legacy Edition", "FIFA 20", "FIFA Football [PS Vita, английская версия]", "FIFA Street [Xbox 360, английская версия]", "FIFA Street 3", "Fight Night Champion", "Fight Night Champion (Русская инструкция)", "Fight Night ROUND 3", "Fight Night Round 4", "Fight Night ROUND 4", "Fighters Uncaged", "Fighting Edition (Tekken 6+Soul Calibur 5+Tekken Tag Tournament 2)", "Fighting Edition (Tekken Tag Tournamament 2/Soul Calibur V/Tekken 6)", "Final Fantasy Type-0 HD", "Final Fantasy X/X 2 HD Remaster", "Final Fantasy X/X-2 HD Remaster", "Final Fantasy XII: the Zodiac Age", "Final Fantasy XIII", "Final Fantasy XIII: Lightning Returns", "Final Fantasy XIII-2", "Final Fantasy XV", "Firewall Zero Hour (только для VR)", "Flatout: Ultimate Carnage", "Folklore", "For Honor", "Forza Horizon", "Forza Horizon 2", "Forza Horizon 3", "Forza Motorsport 2", "Forza Motorsport 3", "Forza Motorsport 4 Game of The Year", "Forza Motorsport 5", "Forza Motorsport 6", "Forza Motorsport 7", "Fracture", "Front Mission Evolved", "Frontlines: Fuel of War (Русская инструкция)", "FUEL", "Full Auto 2: Battlelines", "Fuse", "Game of Thrones", "Gears 5", "Gears Of War", "Gears of War 2", "Gears of War 3", "Gears Of War 4", "Gears of War Ultimate Edition", "Gears of War: Judgment", "Ghostbusters The Video Game", "God of War", "God of War 3", "God of War 3. Обновленная версия", "God of War Collection", "God of War Collection [PS Vita, английская версия]", "God Of War Collection 2", "God of War: Восхождение", "Godfather II", "Godfather: The Dons Edition", "Golden Axe: Beast Rider", "GoldenEye 007: Reloaded", "Gran Turismo 5 (Pусская версия)", "Gran Turismo 5 Academy Edition", "Gran Turismo 6 (Pусская версия)", "Gran Turismo 6 (Pусская версия) Юбилейное Издание", "Grand Slam Tennis 2", "Grand Theft Auto IV", "Grand Theft Auto IV Platinum", "Grand Theft Auto IV: The Complete Edition", "Grand Theft Auto V", "Grand Theft Auto: Episodes from Liberty City", "Gravity Rush [PS Vita, русская документация]", "Gravity Rush 2", "Gravity Rush. Обновленная версия", "GreedFall", "Green Lantern: Rise of the Manhunters", "GRID 2", "GRID Autosport", "Guardians of Middle-Earth", "Guitar Hero 5", "Guitar Hero Aerosmith", "Guitar Hero Greatest Hits", "Guitar Hero III: Legends of Rock", "Guitar Hero Metallica", "Guitar Hero World Tour", "Guitar Hero: Van Halen", "Guitar Hero: Warriors of Rock", "Half-Life 2: the Orange Box", "Half-Life 2: The Orange Box", "Halo 3", "Halo 3 ODST", "Halo 4 Game of the Year", "Halo 5 Guardians", "Halo Wars", "Halo: Combat Evolved Anniversary", "Halo: Reach", "Halo: The Master Chief Collection", "Happy Feet 2", "Harry Potter and the Deathly Hallows: Part 1", "Harry Potter and the Deathly Hallows: Part 2", "Harry Potter and the Half-Blood Prince", "Harry Potter and the Order of the Phoenix", "Haze", "Heavenly Sword", "Heavy Rain", "Hellblade: Senua's Sacrifice", "Hellboy: The Science of Evil", "Heroes Over Europe", "History Channel: Battle for the Pacific", "Hitman Полный первый сезон", "HITMAN 2", "Hitman Absolution", "Hitman: Blood Money", "Hitman: HD Trilogy", "Homefront", "Homefront: The Revolution", "How to Train Your Dragon", "How To Train Your Dragon", "How To Train Your Dragon 2", "Hunted: The Demon's Forge", "Hustle Kings (поддержка VR)", "Hyperdimension Neptunia", "Hyperdimension Neptunia mk2", "Ice Age 3: Dawn of the Dinosaurs", "Ice Age Continental Drift", "Ice Age: Continental Drift - Arctic Games", "ICO & Shadow of Colossus Collection", "Il-2 Sturmovik: Birds of Prey", "IL-2 Sturmovik: Birds of Prey", "Infamous: Второй сын", "Infinite Undiscovery", "Injustice 2", "Injustice: Gods Among Us", "Injustice: Gods Among Us Ultimate Edition", "Inversion", "Invizimals: Затерянный мир", "Iron Man 2", "Jak & Daxter Trilogy", "Jak and Daxter: The Trilogy HD Collection", "James Bond 007: Blood Stone", "James Bond 007: Quantum of Solace", "James Cameron's Avatar: the Game", "John Woo Presents Stranglehold", "Juiced 2: Hot Import Nights", "Just Cause 2", "Just Cause 3", "Just Cause 4", "Just Cause Collection", "Just Dance 2015", "Just Dance 2016", "Just Dance 2017", "Just Dance 2018", "Just Dance 4", "Just Dance Kids", "Kameo: Elements of Power", "Kane & Lynch 2: Dog Days", "Kane & Lynch Collection", "Kane & Lynch: Dead Men", "Kane and Lynch: Dead Men", "Katamari Forever", "Killer is Dead", "Killzone 2", "Killzone 3", "Killzone: В плену сумрака", "Killzone: Наемник", "Kinect Sports", "Kinect Sports Rivals", "Kinect Sports: Season Two", "Kinect Star Wars", "Kingdom Come: Deliverance", "Kingdom Hearts HD 1.5 2.5 ReMIX", "Kingdom Hearts HD 1.5 ReMIX", "Kingdom Hearts HD 2.5 ReMIX", "Kingdom Hearts HD 2.8 Final Chapter Prologue", "Kingdom Hearts III", "Kingdoms of Amalur: Reckoning", "Knack", "Knack 2", "Knights Contract", "Kung Fu Panda", "Kung Fu Panda 2", "L.A. Noire", "L.A.Noire", "Lair", "Last Remnant", "Left 4 Dead 2", "Left 4 Dead Game of the Year Edition", "Legend of Spyro: Dawn of the Dragon", "Legend of the Guardians: The Owls of Ga'Hoole", "Legendary", "LEGO Batman 2: DC Super Heroes", "LEGO Batman 3. Покидая Готэм", "Lego Batman 3: Beyond Gotham", "LEGO Batman 3: Beyond Gotham", "LEGO Batman: The Videogame", "LEGO CITY Undercover", "LEGO DC Super-Villains", "LEGO Harry Potter Collection", "LEGO Harry Potter: Years 1-4", "LEGO Harry Potter: Years 5-7", "LEGO Indiana Jones: The Original Adventures", "LEGO Legends of Chima: Laval's Journey", "LEGO Lord of the Rings", "LEGO Marvel Super Heroes", "LEGO Marvel Super Heroes 2", "LEGO Marvel Мстители", "LEGO Movie Videogame", "LEGO Ninjago Nindroids", "LEGO Star Wars II: The Original Trilogy", "LEGO Star Wars: The Complete Saga", "LEGO The Hobbit", "LEGO Worlds", "LEGO Гарри Поттер: годы 5-7", "LEGO Звездные войны: Пробуждение Силы", "LEGO Мир Юрского Периода", "LEGO Суперсемейка", "LEGO: Marvel Мстители", "LEGO: Ниндзяго Фильм. Видеоигра", "Life is Strange", "Life is Strange: Before the Storm", "LittleBigPlanet", "LittleBigPlanet 2", "LittleBigPlanet 2 Расширенное издание", "LittleBigPlanet 3", "LittleBigPlanet 3 Расширенное Издание", "LittleBigPlanet Karting", "LittleBigPlanet Marvel Super Hero Edition [PS Vita, ]", "Lollipop Chainsaw", "Lord of The Ring: Aragorn's Quest", "Lord of the Rings: Conquest", "Lord of the Rings: The Battle For Middle-Earth II", "Lord of the Rings: War in the North", "Lord of The Rings: War in the North", "Lords Of The Fallen", "Lost", "Lost Odyssey", "Lost Planet 2", "Lost Planet 3", "Lost Planet: Extreme Condition", "Lost Sphear", "Mad Max", "Madagascar 3: Europe's Most Wanted", "Madagascar: Escape 2 Africa", "Mafia II", "Mafia III", "MagnaCarta II", "Majin and The Forsaken Kingdom", "Marvel Ultimate Alliance", "Marvel Ultimate Alliance 2", "Marvel vs Capcom 3: Fate of Two Worlds", "Marvel vs. Capcom 3: Fate of Two Worlds", "Marvel vs. Capcom: Infinite", "Marvel Человек-паук", "Mass Effect", "Mass Effect 2", "Mass Effect 3", "Mass Effect: Andromeda", "Max Payne 3", "Medal of Honor", "Medal of Honor: Airborne", "Medal of Honor: Warfighter", "Men in Black: Alien Crisis", "Mercenaries 2: World in Flames", "Metal Gear Rising: Revengeance", "Metal Gear Solid 4 25th Anniversary Edition", "Metal Gear Solid 4: Guns of the Patriots", "Metal Gear Solid V: Ground Zeroes", "Metal Gear Solid V: The Phantom Pain", "Metal Gear Solid: HD Collection", "Metal Gear Survive", "Metro 2033", "Midnight Club Los Angeles", "Midnight Club Los Angeles Complete Edition", "Mindjack", "Minecraft", "Minecraft Story Mode Complete Adventure (Episodes 1-8)", "Minecraft. Playstation 3 Edition", "Minecraft. Playstation 4 Edition", "Minecraft: Xbox 360 Edition", "Mini Ninjas", "Mirror's Edge", "Mirror's Edge Catalyst", "Monopoly", "Monster Hunter: World", "Monster Madnes: Grave Danger", "Monsters vs. Aliens", "Mortal Kombat", "Mortal Kombat 11", "Mortal Kombat Komplete Edition", "Mortal Kombat vs. DC Universe", "Mortal Kombat X", "Mortal Kombat XL", "Motion Sports Adrenaline", "MotionSports Адреналин (Русская обложка)", "MotionSports: Play for Real", "MotorStorm", "MotorStorm Apocalipse", "MotorStorm: Pacific Rift", "Murdered: Soul Suspect", "MX vs ATV Alive", "MX vs ATV Reflex", "MX vs ATV Untamed", "Naruto 2: The Broken Bond", "Naruto Shippuden Ultimate Ninja Storm 4", "Naruto Shippuden: Ultimate Ninja Storm", "Naruto Shippuden: Ultimate Ninja Storm 2", "Naruto Shippuden: Ultimate Ninja Storm 3", "Naruto Shippuden: Ultimate Ninja Storm 3 Full Burst", "Naruto Shippuden: Ultimate Ninja Storm Generations", "Naruto Shippuden: Ultimate Ninja Storm Revolution", "Naruto Shippuden: Ultimate Ninja Storm Revolution D1 Edition", "Naruto to Boruto: Shinobi Striker", "Naruto Ultimate Ninja Storm 2", "Naruto: Rise of a Ninja", "NAtURAL DOCtRINE", "Naughty Bear", "NBA 2K15", "NBA 2K18", "NBA 2K20", "NBA Street Homecourt", "Need for Speed", "Need for Speed Carbon", "Need For Speed Carbon", "Need for Speed Heat", "Need for Speed Hot Pursuit", "Need for Speed Payback", "Need For Speed ProStreet", "Need for Speed Rivals", "Need for Speed Shift", "Need for Speed Shift 2 Unleashed", "Need for Speed The Run", "Need for Speed Undercover", "NeverDead", "NHL 15", "NHL 16. Legacy Edition", "NHL 17", "NHL 18", "NHL 19", "NHL 20", "Ni no Kuni II: Возрождение Короля", "Ni No Kuni: Wrath Of The White Witch", "Ni no Kuni: Гнев Белой ведьмы – Remastered ​", "Nier", "NieR: Automata", "Ninety-Nine Nights", "Ninety-Nine Nights II", "Ninja Gaiden 3", "Ninja Gaiden 3: Razor's Edge", "Ninja Gaiden II", "Ninja Gaiden Sigma", "Ninja Gaiden Sigma 2", "Nioh", "No Man's Sky", "Of Orcs and Men", "One Piece : Pirate Warriors", "One Piece : Pirate Warriors 2", "One Piece Unlimited World Red", "One Piece: Pirate Warriors 3", "Operation Flashpoint 2: Dragon Rising", "Operation Flashpoint Dragon Rising", "Operation Flashpoint: Red River", "Outlast Trinity", "Overlord II", "Overlord: Raising Hell", "Overwatch: Origins Edition", "Pac-Man And The Ghostly Adventures HD", "Pain", "Painkiller: Hell & Damnation", "Payday 2", "Payday 2: Crimewave Edition", "Penguins of Madagascar: Dr. Blowhole Returns Again!", "Perfect Dark Zero", "Persona 4 Arena", "Persona 5", "Peter Jackson's King Kong", "Phantasy Star Universe", "Plants vs. Zombies Garden Warfare", "Plants vs. Zombies Garden Warfare [Xbox 360, русская документация]", "Plants vs. Zombies Garden Warfare 2", "Portal 2", "Prey (2017)", "Prince of Persia", "Prince of Persia (Pусская версия)", "Prince of Persia Забытые Пески", "Prince of Persia Забытые Пески (Pусская версия)", "Pro Evolution Soccer 2015", "Pro Evolution Soccer 2016", "Pro Evolution Soccer 2018", "Pro Evolution Soccer 2019", "Project CARS", "Project Cars 2", "Project Gotham Racing 3", "Project Gotham Racing 4", "Prototype", "Prototype 2", "Pure", "Pure Football", "Quake 4", "Quantum Theory", "Rabbids Invasion", "Rabbids Invasion (только для MS Kinect)", "Race Driver: GRID Reloaded", "Rage", "RAGE 2", "Rango: The Video Game", "Rare Replay", "Ratchet & Clank", "Ratchet & Clank Future: Quest for Booty", "Ratchet & Clank Future: Tools of Destruction", "Ratchet & Clank HD Collection", "Ratchet & Clank Q-Force", "Ratchet & Clank: A Crack in Time", "Ratchet & Clank: All 4 One", "Ratchet & Clank: Nexus", "Raving Rabbids Alive & Kicking", "Rayman Legends", "Rayman Origins", "ReCore", "Red Dead Redemption", "Red Dead Redemption 2", "Red Dead Redemption Game of the Year", "Red Faction: Armageddon", "Red Faction: Guerrilla", "Remember me", "Resident Evil 2", "Resident Evil 4", "Resident Evil 5", "Resident Evil 5: Gold Edition", "Resident Evil 5: Gold/Move Edition", "Resident Evil 6", "Resident Evil 7: Biohazard", "Resident Evil 7: Biohazard (поддержка VR)", "Resident Evil HD Remaster", "Resident Evil Origins Collection", "Resident Evil. Revelations", "Resident Evil. Revelations 2", "Resident Evil: Operation Raccoon City", "Resident Evil: Revelations", "Resistance 2", "Resistance 3", "Resistance: Fall of Man", "Resonance of Fate", "Ridge Racer 7", "Ridge Racer Unbounded", "Ridge Racer Unbounded (Русская инструкция)", "RIGS: Mechanized Combat League (только для VR)", "Rio", "Rise of Nightmares", "Rise of the Argonauts", "Rise of the Guardians / Хранители Снов", "Rise of the Tomb Raider", "Risen", "Risen 2: Dark Waters", "Risen 3: Titan Lords", "Robinson:The Journey (только для VR)", "Rocksmith 2014 Edition with Cable", "Rogue Warrior", "Rune Factory: Tides of Destiny", "Sacred 2: Fallen Angel", "Sacred 3", "Saints Row 2", "Saints Row 4 Полное издание", "Saints Row IV", "Saints Row IV - Re-Elected", "Saints Row: Gat Out Of Hell", "Saints Row: The Third", "Samurai Warriors 4", "SAW", "SAW II: Flesh & Blood", "Sea of Thieves", "SEGA Mega Drive Ultimate Collection", "Sega Rally", "Sega Superstars Tennis", "SEGA Superstars Tennis", "Sekiro: Shadows Die Twice", "Sengoku BASARA: Samurai Heroes", "Shadow of the Colossus. В тени колосса", "Shadow of the Tomb Raider", "Shadow Tactics: Blades of the Shogun", "Shadow Warrior", "Shadows of the Damned", "Shaun White Skateboarding", "Shaun White Snowboarding", "Shellshock 2: Blood Trails", "Shenmue I & II", "Sherlock Holmes vs. Jack the Ripper", "Shrek Forever After", "Shrek the Third", "Sid Meiers Civilization Revolution", "Silent Hill HD Collection", "Silent Hill: Downpour", "Silent Hill: Homecoming", "Sims 4", "Singularity", "Siren Blood Curse", "Skate", "Skate 2", "Skate 3", "Sleeping Dogs", "Sleeping Dogs. Definitive Edition", "Sly Cooper: Thieves in Time", "Sniper 3 Ghost Warrior", "Sniper Elite 3", "Sniper Elite 3 Ultimate Edition", "Sniper Elite 4", "Sniper Elite V2", "Sniper: Ghost Warrior", "Sniper: Ghost Warrior 2", "Soldier of Fortune: Payback", "Sonic & All-Stars Racing Transformed", "Sonic & SEGA All-Stars Racing", "Sonic & SEGA All-Stars Racing Transformed", "Sonic Forces", "Sonic Free Riders", "Sonic Generations", "Sonic Mania Plus", "Sonic the Hedgehog", "Sonic Unleashed", "Soulcalibur IV", "SoulCalibur IV", "SoulCalibur V", "SoulCalibur VI", "South Park: Палка Истины", "Spec Ops: The Line", "Spider-Man 3", "Spider-Man Friend of Foe", "Spider-Man: Edge of Time", "Spider-Man: Shattered Dimensions", "Spider-Man: Web of Shadows", "Splatterhouse", "Spyro Reignited Trilogy", "SSX", "Star Ocean V: Integrity and Faithlessnes", "Star Ocean: The Last Hope", "Star Ocean: The Last Hope - International", "Star Trek", "Star Wars: Battlefront", "Star Wars: Battlefront II", "Stormrise", "Street Fighter IV", "Street Fighter V", "Street Fighter X Tekken", "Stuntman: Ignition", "Super Stardust Ultra (поддержка VR)", "Super Street Fighter IV", "Super Street Fighter IV: Arcade Edition", "SuperCar Challenge", "Superstars V8 Racing", "Supremacy: MMA", "Surge", "Surge 2 ​", "Syndicate", "Tales of Berseria", "Tales of Graces F", "Tales of Symphonia Chronicles", "Tales of Xillia", "Tales of Zestiria", "Team Sonic Racing", "Teenage Mutant Ninja Turtles", "Teenage Mutant Ninja Turtles Mutants in Manhattan", "Tekken 6", "Tekken 6 (Pусская версия)", "Tekken 7", "Tekken Hybrid", "Tekken Tag Tournament 2", "Terminator Salvation", "Test Drive Unlimited 2", "The Amazing Spider-man", "The Amazing Spider-Man", "The Amazing Spider-Man 2", "The Bourne Conspiracy", "The Bureau: XCOM Declassified", "The Chronicles of Riddick: Assault on Dark Athena", "The Club", "The Crew 2", "The Dark Pictures: Man of Medan", "The Darkness", "The Evil Within", "The Fight/Схватка", "The Golden Compass", "The Guided Fate Paradox", "The Incredible Hulk", "The King of Fighters XII", "The King of Fighters XIII", "The Last Guardian. Последний хранитель", "The Outer Worlds", "The Persistence (только для VR)", "The Saboteur", "The Simpsons", "The Sims 3", "The Sims 3 Pets", "The Talos Principle Deluxe Edition", "The Testament of Sherlock Holmes / Последняя воля Шерлока Холмса", "The Walking Dead", "The Walking Dead: Survival Instinct", "The Wheelman", "The Witch and the Hundred Knight", "The Witcher 2: Assassins of Kings", "Thief", "Thor: God of Thunder", "Time and Eternity", "TimeShift", "Titan Quest", "Titanfall", "Titanfall 2", "TNA Impact", "Tom Clancy's EndWar", "Tom Clancy's Ghost Recon Advanced Warfighter II", "Tom Clancy's Ghost Recon: Advanced Warfighter 2", "Tom Clancy's Ghost Recon: Breakpoint", "Tom Clancy's Ghost Recon: Future Soldier", "Tom Clancy's Ghost Recon: Future Soldier & Advanced Warfighter 2", "Tom Clancy's Ghost Recon: Wildlands", "Tom Clancy's HAWX", "Tom Clancy's HAWX 2", "Tom Clancy's Rainbow Six: Vegas", "Tom Clancy's Rainbow Six: Vegas 2", "Tom Clancy's Rainbow Six: Осада", "Tom Clancy's Splinter Cell Blacklist", "Tom Clancy's Splinter Cell Double Agent", "Tom Clancy's Splinter Cell Trilogy - Classics HD", "Tom Clancy's The Division", "Tom Clancy's The Division 2", "Tomb Raider", "Tomb Raider Trilogy - Classics HD", "Tomb Raider: Definitive Edition", "Tomb Raider: Underworld", "Tony Hawks Project 8", "Tony Hawks Proving Ground", "Tony Hawk's Proving Ground", "Too Human", "Top Spin 4", "Torment: Tides of Numenera", "Transformers: Dark of the Moon", "Transformers: Devastation", "Transformers: Fall of Cybertron", "Transformers: Revenge of the Fallen", "Transformers: Rise of the Dark Spark", "Transformers: Rise of the Dark Spark / Битва за Темную Искру", "Transformers: The Game", "Transformers: War for Cybertron", "Trials Fusion", "Trinity: Souls of Zill O'll", "Tropico 5", "Turbo: Super Stunt Squad / Турбо: Суперкоманда каскадеров", "Turning Point: Fall of Liberty", "Turok", "Twisted Metal/Скрежет металла", "Two Worlds II", "UFC", "UFC [Xbox One, английская версия]", "UFC 2", "UFC 2 [Xbox One, английская версия]", "UFC 2009: Undisputed", "UFC 2010: Undisputed", "UFC 3", "UFC Undisputed 3", "Ultimate Action Triple Pack (Just Cause 2 + Sleeping Dogs + Tomb Raider)", "Ultimate Marvel vs Capcom 3", "Ultimate Stealth Triple Pack (Hitmam Absolution + Thief + Deus Ex Human Revelation)", "Uncharted 2: Among Thieves (Pусская версия)", "Uncharted 3: Drake's Deception (Pусская версия)", "Uncharted 3: Drake's Deception Game of the Year Edition", "Uncharted 4: Путь вора", "Uncharted: Drakes Fortune", "Uncharted: Натан Дрейк. Коллекция", "Uncharted: Утраченное наследие", "Unreal Tournament 3", "Until Dawn: Rush Of Blood (только для VR)", "Untold Legends: Dark Kingdom", "Valkyria Chronicle", "Valkyria Chronicles Remastered", "Valkyria Revolution", "Vampyr", "Vanquish", "Venetica", "Viking: Battle for Asgard", "Virtua Fighter 5", "Virtua Tennis 4", "VR Worlds (только для VR)", "Wanted: Weapons of Fate", "Warhammer 40,000: Space Marine", "Warhammer: Chaosbane", "Warriors Orochi 3", "Warriors: Legends of Troy", "Wasteland 2: Director's Cut", "Watch Dogs", "Watch Dogs 2", "Watch Dogs. Специальное издание", "Watchmen: The End is Nigh", "Wet", "Winter Stars", "WipEout Omega Collection", "Wolfenstein", "Wolfenstein II: The New Colossus", "Wolfenstein: The New Order", "Wolfenstein: The New Order Occupied Edition", "Wolfenstein: The Old Blood", "Wolfenstein: Youngblood", "World of Final Fantasy", "Worms Battlegrounds", "Worms Collection", "Worms W.M.D.", "WRC: FIA World Rally Championship 4", "WWE 2K14", "WWE 2K15", "WWE 2K16", "WWE 2K18", "WWE All Stars", "XCOM 2", "XCOM: Enemy Unknown", "X-Men Destiny", "X-Men Origins: Wolverine", "Yakuza 0", "Yakuza 3", "Yakuza 4", "Yakuza 6: The Song of Life", "Yakuza Kiwami", "Yakuza Kiwami 2", "Yakuza: Dead Souls", "Yooka-Laylee", "Zombie Army Trilogy", "Zone of the Enders: HD Trilogy", "Артур и месть Урдалака", "Безумцы", "Ведьмак 3: Дикая охота", "Ведьмак 3: Дикая Охота. Издание «Игра года»", "Губка Боб Квадратные Штаны. Планктон: Месть роботов", "Дожить до рассвета. Extended Edition", "Дурная Репутация", "Дурная Репутация 2", "Жизнь После", "За гранью: Две души", "Звёздные Войны Джедаи: Павший Орден", "Звезды PlayStation: Битва сильнейших / All-Stars Battle Royale", "Как Приручить Дракона 2 / How to Train Your Dragon 2", "Книга зелий (только для PS Move)", "Коллекция Heavy Rain и За гранью: Две души", "Комплект «Assassin's Creed IV: Черный Флаг» + «Assassin's Creed: Изгой»", "Комплект «Far Cry 3» + «Far Cry 4»", "Комплект «Farpoint (только для VR) » + Контроллер прицеливания PlayStation VR", "Комплект «Rayman Legends» + «Rayman Origins»", "Комплект: Fable 2 + Halo 3", "Комплект: Halo 3 ODST + Halo 3", "Кровь и Истина (только для VR)", "Кукловод", "Легенда о Спайро: Рождение дракона", "Лови Волну", "Мадагаскар 3", "Мадзин. Забытое королевство", "Мегамозг", "Метро 2033: Возвращение", "Метро: Исход", "Метро: Луч надежды", "Новый Человек-паук", "Облачно, возможны осадки в виде фрикаделек", "Одни из Нас", "Одни из нас. Game of the Year Edition", "Орден 1886", "Остаться в живых", "Пациент (только для VR)", "Побег: Теория Заговора", "Приключения Тинтина: Тайна Единорога", "Путешествие. Коллекционное издание", "Сибирь 3", "Скрытая повестка", "Смурфики 2", "Сорванец: Развернутая история. Messenger Edition", "Средиземье: Тени войны", "Средиземье: Тени Мордора", "Средиземье: Тени Мордора / Middle-Earth: Shadow of Mordor", "Тачки 3. Навстречу победе", "ТРОН: Эволюция"]
        var games = [Game]()
        var i = 0
        for name in names {
            games.append(Game(id: i, name: name))
            i += 1
        }
        return completion(.success(games))
    }
}