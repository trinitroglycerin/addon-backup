
--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Apocron", -646, 1956)
if not mod then return end
mod:RegisterEnableMob(121124)
mod.otherMenu = -619
mod.worldBoss = 121124

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		241458, -- Quake
		241498, -- Felfire Missiles
		241518, -- Sear
	}
end

function mod:OnBossEnable()
	self:ScheduleTimer("CheckForEngage", 1)
	self:RegisterEvent("BOSS_KILL")

	self:Log("SPELL_CAST_START", "Quake", 241458)
	self:Log("SPELL_CAST_START", "FelfireMissiles", 241498)
	self:Log("SPELL_CAST_START", "Sear", 241518)
	self:Log("SPELL_AURA_APPLIED", "SearApplied", 241518)

	self:Death("Win", 121124)
end

function mod:OnEngage()
	self:CheckForWipe()
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:BOSS_KILL(_, id)
	--if id == XXX then
	--	self:Win()
	--end
end

function mod:Quake(args)
	self:MessageOld(args.spellId, "orange", "warning")
	self:CDBar(args.spellId, 23.3)
end

function mod:FelfireMissiles(args)
	self:MessageOld(args.spellId, "yellow", "long")
end

function mod:Sear(args)
	self:MessageOld(args.spellId, "red", self:Melee() and "info")
	self:CDBar(args.spellId, 22)
end

function mod:SearApplied(args)
	if self:Tank() and (self:Me(args.destGUID) or self:Tank(args.destName)) then
		self:TargetMessageOld(args.spellId, args.destName, "green", "alarm", nil, nil, true)
	end
end
