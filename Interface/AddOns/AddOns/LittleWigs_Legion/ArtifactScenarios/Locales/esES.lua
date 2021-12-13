local L = BigWigs:NewBossLocale("Tugar Bloodtotem", "esES") or BigWigs:NewBossLocale("Tugar Bloodtotem", "esMX")
if not L then return end
if L then
	L.tugar = "Tugar Tótem Sangriento"
	L.jormog = "Jormog el Behemoth"

	--L.remaining = "Scales Remaining"

	--L.submerge = "Submerge"
	--L.submerge_desc = "Submerges below the ground, summoning spitter eggs and falling spikes."

	--L.charge_desc = "When Jormog is submerged, he will periodically charge in your direction."

	--L.rupture = "{243382} (X)"
	--L.rupture_desc = "A Fel Rupture in the shape of an X appears under you. After 5 seconds it will rupture the ground, sending spikes into the air and knocking back players on top of it."

	--L.totem_warning = "The totem hit you!"
end

L = BigWigs:NewBossLocale("Raest", "esES") or BigWigs:NewBossLocale("Raest", "esMX")
if L then
	L.name = "Raest Lanzamágica"

	--L.handFromBeyond = "Hand from Beyond"

	--L.rune_desc = "Places a Rune of Summoning on the ground. If left unsoaked a Thing of Nightmare will spawn."

	--L.killed = "%s killed"

	--L.warmup_text = "Karam Magespear Active"
	--L.warmup_trigger = "You were a fool to follow me, brother. The Twisting Nether feeds my strength. I have become more powerful than you could ever imagine!"
	--L.warmup_trigger2 = "Kill this interloper, brother!"
end

L = BigWigs:NewBossLocale("Kruul", "esES") or BigWigs:NewBossLocale("Kruul", "esMX")
if L then
	L.name = "Alto señor Kruul"
	L.inquisitor = "Inquisidor Variss"
	L.velen = "Profeta Velen"

	--L.warmup_trigger = "Arrogant fools! I am empowered by the souls of a thousand conquered worlds!"
	--L.win_trigger = "So be it. You will not stand in our way any longer."

	--L.nether_aberration_desc = "Summons portals around the room, spawning Nether Aberrations."

	--L.smoldering_infernal = "Smoldering Infernal"
	--L.smoldering_infernal_desc = "Summons a Smoldering Infernal."
end

L = BigWigs:NewBossLocale("Lord Erdris Thorn", "esES") or BigWigs:NewBossLocale("Lord Erdris Thorn", "esMX")
if L then
	L.erdris = "Lord Erdris Espina"

	--L.warmup_trigger = "Your arrival is well-timed."
	--L.warmup_trigger2 = "What's... happening?" --Stage 5 Warm up

	L.mage = "Mago resucitado corrupto"
	L.soldier = "Soldado resucitado corrupto"
	L.arbalest = "Arbalesta resucitada corrupta"
end

L = BigWigs:NewBossLocale("Archmage Xylem", "esES") or BigWigs:NewBossLocale("Archmage Xylem", "esMX")
if L then
	L.name = "Archimago Xylem"
	L.corruptingShadows = "Sombra corruptora"
end

L = BigWigs:NewBossLocale("Agatha", "esES") or BigWigs:NewBossLocale("Agatha", "esMX")
if L then
	L.name = "Agatha"
	L.imp_servant = "Sirviente diablillo"
	L.fuming_imp = "Diablillo humeante"

	-- L.absorb = "Absorb"
	-- L.stacks = "Stacks"
end

L = BigWigs:NewBossLocale("Sigryn", "esES") or BigWigs:NewBossLocale("Sigryn", "esMX")
if L then
	L.sigryn = "Sigryn"
	L.jarl = "Jarl Velbrand"
	L.faljar = "Vidente de runas Faljar"

	-- L.warmup_trigger = "What's this? The outsider has come to stop me?"

	-- L.absorb = "Absorb"
end
