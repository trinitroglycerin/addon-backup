
--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Halkias, the Sin-Stained Goliath", 2287, 2406)
if not mod then return end
mod:RegisterEnableMob(165408) -- Halkias
mod.engageId = 2401
--mod.respawnTime = 30

--------------------------------------------------------------------------------
-- Locals
--

local slamCount = 1
local debrisCount = 1

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		323001, -- Glass Shards
		{322936, "TANK"}, -- Crumbling Slam
		322943, -- Heave Debris
		322711, -- Refracted Sinlight
		339237, -- Sinlight Visions
	}, nil, {
		[322711] = CL.beams, -- Refracted Sinlight (Beams)
		[339237] = CL.fear, -- Sinlight Visions (Fear)
	}
end

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "GlassShardsDamage", 323001)
	self:Log("SPELL_PERIODIC_DAMAGE", "GlassShardsDamage", 323001)
	self:Log("SPELL_PERIODIC_MISSED", "GlassShardsDamage", 323001)
	self:Log("SPELL_CAST_START", "CrumblingSlam", 322936)
	self:Log("SPELL_CAST_SUCCESS", "HeaveDebris", 322943)
	self:Log("SPELL_CAST_START", "RefractedSinlight", 322711)
	self:Log("SPELL_AURA_APPLIED", "SinlightVisionsApplied", 339237)

	self:RegisterMessage("BigWigs_BarCreated", "BarCreated")
end

function mod:OnEngage()
	slamCount = 1
	debrisCount = 1

	self:CDBar(322936, 5) -- Crumbling Slam
	self:CDBar(322943, 12) -- Heave Debris
	self:CDBar(322711, 50, CL.beams) -- Refracted Sinlight
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local function stopAtZeroSec(bar)
		if bar.remaining < 0.15 then -- Pause at 0.0
			bar:SetDuration(0.01) -- Make the bar look full
			bar:Start()
			bar:Pause()
			bar:SetTimeVisibility(false)
		end
	end

	function mod:BarCreated(_, _, bar, _, key)
		if key == 322711 then -- Refracted Sinlight
			bar:AddUpdateFunction(stopAtZeroSec)
		end
	end
end

do
	local prev = 0
	function mod:GlassShardsDamage(args)
		if self:Me(args.destGUID) then
			local t = args.time
			if t-prev > 2 then
				prev = t
				self:PersonalMessage(args.spellId, "underyou")
				self:PlaySound(args.spellId, "underyou")
			end
		end
	end
end

function mod:CrumblingSlam(args)
	self:Message(args.spellId, "purple")
	self:PlaySound(args.spellId, "alert")
	slamCount = slamCount + 1
	self:CDBar(args.spellId, slamCount % 2 == 0 and 14 or 45)
end

function mod:HeaveDebris(args)
	self:Message(args.spellId, "yellow")
	self:PlaySound(args.spellId, "alarm")
	debrisCount = debrisCount + 1
	self:CDBar(args.spellId, debrisCount % 2 == 0 and 17 or 28)
end

function mod:RefractedSinlight(args)
	self:Message(args.spellId, "red", CL.beams)
	self:PlaySound(args.spellId, "warning")
	self:Bar(args.spellId, 45, CL.beams) -- XXX Estimated
end

function mod:SinlightVisionsApplied(args)
	self:TargetMessage(args.spellId, "orange", args.destName, CL.fear)
	self:PlaySound(args.spellId, "alert")
end
