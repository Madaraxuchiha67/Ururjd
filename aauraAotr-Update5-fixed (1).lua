do
    local ALLOWED_PLACES = {
        [13379208636] = true,
        [14916516914] = true,
        [13379349730] = true,
        [14012874501] = true,
        [13904207646] = true,
        [14638336319] = true,
        [15220308770] = true,
        [17688739434] = true,
        [15824912319] = true,
        [126678335159530] = true,
    }
    local allowed = ALLOWED_PLACES[game.PlaceId] == true
    if not allowed then
        pcall(function()
            if not game:IsLoaded() then game.Loaded:Wait() end
            local assets = game:GetService("ReplicatedStorage"):WaitForChild("Assets", 5)
            local remotes = assets and assets:WaitForChild("Remotes", 5)
            allowed = remotes ~= nil and remotes:FindFirstChild("GET") ~= nil and remotes:FindFirstChild("POST") ~= nil
        end)
    end
    if not allowed then
        pcall(function()
            game:GetService("Players").LocalPlayer:Kick("This script works only in Attack on Titan Revolution.")
        end)
        return
    end
end
local MENU_PLACE_ID = 13379208636
local MIN_DELAY, MAX_DELAY = 5, 60
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local GuiService = game:GetService("GuiService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local IN_MENU = (game.PlaceId == MENU_PLACE_ID)
local SH = { DEV = false }
function SH.say(...) print("[Aotr:Update[5]]", ...) end
function SH.dbg(...) if SH.DEV then print(...) end end
function SH.Guard(name, fn)
    local ok, err = xpcall(fn, function(e) return tostring(e) .. "\n" .. debug.traceback() end)
    if not ok then warn("[Aotr:Update[5]] block " .. tostring(name) .. " failed to load: " .. tostring(err)) end
end
SH.say("Loading Aotr:Update[5] | Attack on Titan Revolution (" .. (IN_MENU and "Lobby" or "In-game") .. ") ...")
if type(_G.AotrUpdate5Cleanup) == "function" then pcall(_G.AotrUpdate5Cleanup) end
local token = {}
_G.AotrUpdate5ReplayToken = token
local function Alive() return _G.AotrUpdate5ReplayToken == token end
local AppRef = nil
_G.AotrUpdate5Cleanup = function()
    pcall(function() if AppRef and AppRef.Destroy then AppRef:Destroy() end end)
end
local Cfg = {
    Slot = 1,
    AutoSelect = false,
    AutoJoin = false,
    JoinDelay = 10,
    AutoClaimMain = true,
    AutoClaimSide = true,
    AutoClaimAchievements = true,
    AutoClaimWeekly = true,
    AutoClaimDaily = true,
    AutoOpenPages = true,
    AutoQuestThunder = false,
    AutoQuestThunderR1 = false,
    AutoQuestThunderR2 = false,
    AutoQuestThunderR3 = false,
    QuestR3Played = 0,
    AutoUpgradeBlade = false,
    AutoUpgradeThunder = false,
    AutoEquipThunder = false,
    AutoEquipBlade = false,
    UseThunderSpears = false,
    MissionSelect = "Shiganshina",
    MissionObjective = "Skirmish",
    MissionDifficulty = {},
    MissionModifiers = {},
    AutoBestGrade = false,
    AutoBoostMission = false,
    AutoCreateMission = false,
    AutoStartMission = false,
    MissionLevel = "Easy (E- Grade)",
    MissionJoinDelay = 10,
    RaidSelect = "Attack Titan",
    RaidModifiers = {},
    RaidLevel = "Hard",
    AutoCreateRaid = false,
    AutoStartRaid = false,
    RaidJoinDelay = 10,
    WaveSelect = "Trost",
    WaveLevel = "Easy (E- Grade)",
    AutoCreateWave = false,
    AutoStartWave = false,
    WaveJoinDelay = 10,
    AutoRefillWave = false,
    AutoRollBlessing = false,
    RollStopOnMatch = true,
    AutoHealInjuries = false,
    AutoUpgradeChar = false,
    AutoUpgradeBlades = false,
    UpgMaxHP = true,
    UpgRegen = true,
    UpgReplenish = false,
    UpgRefills = false,
    UpgRevive = false,
    AutoLootCrate = false,
    AutoShop = false,
    ShopPerk = true,
    ShopArtifact = false,
    ShopMemory = false,
    ShopCrates = false,
    ShopStar1 = true, ShopStar2 = true, ShopStar3 = true, ShopStar4 = true, ShopStar5 = true,
    ShopPerkStar1 = true, ShopPerkStar2 = true, ShopPerkStar3 = true, ShopPerkStar4 = true, ShopPerkStar5 = true,
    ShopArtifactStar1 = true, ShopArtifactStar2 = true, ShopArtifactStar3 = true, ShopArtifactStar4 = true, ShopArtifactStar5 = true,
    ShopMemoryStar1 = true, ShopMemoryStar2 = true, ShopMemoryStar3 = true, ShopMemoryStar4 = true, ShopMemoryStar5 = true,
    ShopPriority = "Highest star first",
    ShopMaxPrice = 0,
    ShopReserve = 0,
    WaveMinGold = 0,
    AutoSpin = false,
    SpinStopRarity = "Epic",
    SpinShowList = false,
    SpinListSize = 15,
    SpinUseDelay = true,
    SpinDelay = 3,
    SpinOnKeep = "Stop",
    SpinFamilyRules = "",
    AutoFarm = false,
    AutoPlay = false,
    AutoClearWave = false,
    ClearWaveRange = 300,
    AutoFarmThunder = false,
    ThunderTargets = 200,
    ThunderRange = 10000,
    AutoFarmSmart = false,
    FarmMode = "Smart",
    RefillEnabled = false,
    RefillPickBlade = true,
    RefillPickThunder = true,
    SafeFarm = false,
    AutoReload = false,
    AutoRefillsBlade = false,
    AutoRefillsThunder = false,
    DamageMultiplier = false,
    SafeTime = 32,
    FailSafeAt = 20,
    AutoFailSafe = false,
    Streak = 0,
    NoClip = true,
    HitAllParts = true,
    AutoM1 = false,
    NearFallback = true,
    MultiHit = true,
    MultiHitTargets = 10,
    MultiHitRange = 10000,
    FlySpeed = 600,
    StartDelay = 4,
    PartCooldown = 7,
    FlyHeight = 230,
    WaitForBoss = false,
    BossSettle = 5,
    AttackSpeed = 0,
    AutoOpenChestFree = false,
    AutoCannon = false,
    CannonFarmSmall = false,
    AutoDefendEren = false,
    DefendErenRadius = 400,
    AutoFinishChest = false,
    AutoOpenChestPremium = false,
    AutoSkipCutscene = false,
    AutoRetry = false,
    AutoLeave = false,
    AutoReady = false,
    AutoVoteSkip = false,
    AutoLeaveAtWave = false,
    LeaveAtWave = 10,
    AutoSkill1 = false, AutoSkill2 = false, AutoSkill3 = false, AutoSkill4 = false, AutoSkill5 = false,
    AutoSkillMode1 = "Instant", AutoSkillMode2 = "Instant", AutoSkillMode3 = "Instant", AutoSkillMode4 = "Instant", AutoSkillMode5 = "Instant",
    AutoSkillHoldTime = 3,
    AutoSkillDelay = 2,
    RetryAmount = 3,
    RetryDone = 0,
    AutoLeaveWhenRetryComplete = false,
    AutoUpgradeSkills = false,
    SkillLeft = false,
    SkillMiddle = false,
    SkillRight = false,
    SkillLeftPick = "Regen VI",
    SkillMiddlePick = "Damage V",
    SkillRightPick = "Tank VIII",
    SkillLeftPriority = 1,
    SkillMiddlePriority = 2,
    SkillRightPriority = 1,
    AutoCraftPerks = false,
    CraftCommonRare = false,
    CraftRareEpic = false,
    CraftEpicLegendary = false,
    CraftLegendaryMythic = false,
    CraftChanceCommonRare = 100,
    CraftChanceRareEpic = 100,
    CraftChanceEpicLegendary = 100,
    CraftChanceLegendaryMythic = 100,
    AutoPrestige = false,
    PrestigeBoost1 = "Luck",
    PrestigeBoost2 = "Luck",
    PrestigeBoost3 = "Luck",
    PrestigeBoost4 = "Luck",
    PrestigeBoost5 = "Luck",
    PrestigeStopAt = 3,
}
function SH.PlayOn() return Cfg.AutoPlay == true end
SH.Coord = { jobs = {}, last = nil }
function SH.Coord.Register(name, prio, pending, busy, giveUp)
    SH.Coord.jobs[name] = { prio = prio, pending = pending, busy = busy, giveUp = giveUp or 240, since = nil, seen = nil, warned = false }
end
function SH.Coord.Blocker(askerPrio)
    local now = os.clock()
    local found = nil
    for name, j in pairs(SH.Coord.jobs) do
        local okB, isBusy = pcall(j.busy)
        local okP, isPending = pcall(j.pending)
        isBusy = okB and isBusy == true
        isPending = okP and isPending == true
        if isBusy or isPending then
            j.since = j.since or now
            if j.seen and now - j.seen > 5 then j.since = now end
            j.seen = now
            if (not isBusy) and now - j.since > j.giveUp then
                if not j.warned then
                    j.warned = true
                    SH.say(name .. " is taking too long - continuing with the other features")
                end
            elseif j.prio < askerPrio and not found then
                found = name
            end
        else
            j.since, j.seen, j.warned = nil, nil, false
        end
    end
    SH.Coord.last = found
    return found
end
local FARM_RANGES = {
    SafeTime = { 0, 300 },
    FailSafeAt = { 0, 100 },
    FlySpeed = { 600, 2000 },
    StartDelay = { 0, 60 },
    PartCooldown = { 4, 10 },
    FlyHeight = { 10, 500 },
    MultiHitTargets = { 1, 100 },
    MultiHitRange = { 50, 10000 },
    BossSettle = { 0, 30 },
    LeaveAtWave = { 1, 50 },
    ShopMaxPrice = { 0, 1000000 },
    ShopReserve = { 0, 1000000 },
    ClearWaveRange = { 50, 2000 },
    WaveMinGold = { 0, 10000000 },
    AutoSkillHoldTime = { 1, 10 },
    AutoSkillDelay = { 1, 30 },
    AttackSpeed = { 0, 5 },
    RetryAmount = { 1, 50 },
    SpinListSize = { 5, 100 },
    DefendErenRadius = { 50, 2000 },
    ThunderTargets = { 0, 200 },
    ThunderRange = { 50, 10000 },
    SkillLeftPriority = { 1, 3 },
    SkillMiddlePriority = { 1, 3 },
    SkillRightPriority = { 1, 3 },
    CraftChanceCommonRare = { 0, 100 },
    CraftChanceRareEpic = { 0, 100 },
    CraftChanceEpicLegendary = { 0, 100 },
    CraftChanceLegendaryMythic = { 0, 100 },
    PrestigeStopAt = { 1, 5 },
}
SH.Memories = {
    { Id = "Thanatophobia", Name = "[Defense] Thanatophobia", Stars = 4, Desc = "When below 40.0% HEALTH: +25.0% DMG RED., +15.0% INJURY CHANCE RED. and heal an injury every 15s" },
    { Id = "Necromantic", Name = "[Defense] Necromantic", Stars = 4, Desc = "Upon ignoring death, gain +20.0% DMG, +25.0% HEALTH and +15.0% SPEED" },
    { Id = "SteelFrame", Name = "[Defense] Steel Frame", Stars = 3, Desc = "All explosions deal 25.0% less self DMG and grant immunity to any explosions for 5s" },
    { Id = "Resilience", Name = "[Defense] Resilience", Stars = 3, Desc = "Ignore up to 1 killing blows per match" },
    { Id = "Vengeflare", Name = "[Defense] Vengeflare", Stars = 3, Desc = "Reflect 50.0% of any incoming damage for the next 20s when Tough As Nails is active" },
    { Id = "Aegisurge", Name = "[Defense] Aegisurge", Stars = 2, Desc = "Gain a temporary shield that has 15.0% of your MAX HEALTH for 20s after a titan kill" },
    { Id = "Riposte", Name = "[Defense] Riposte", Stars = 2, Desc = "Successful counters instantly execute a titan" },
    { Id = "Guardian", Name = "[Defense] Guardian", Stars = 1, Desc = "Ignore up to 2 injuries per match" },
    { Id = "Deflectra", Name = "[Defense] Deflectra", Stars = 1, Desc = "5.0% chance to completely block incoming damage" },
    { Id = "Afterimages", Name = "[Offense] Afterimages", Stars = 4, Desc = "Explosions create a smaller explosion in their wake, doing 40.0% DMG (4s CD)" },
    { Id = "Overslash", Name = "[Offense] Overslash", Stars = 4, Desc = "30.0% of any excess DMG from a finishing blow applies to other titans in a 125m radius (4s CD)" },
    { Id = "Gambler", Name = "[Offense] Gambler", Stars = 4, Desc = "All DMG dealt fluctuates between 75.0% - 130.0% (Perfect Form makes this 85.0% - 140.0%)" },
    { Id = "Supernova", Name = "[Offense] Supernova", Stars = 3, Desc = "Increase TS DMG by 25.0%, but for every 100m away from your explosion, lose 2.5% TS DMG" },
    { Id = "Amputation", Name = "[Offense] Amputation", Stars = 3, Desc = "Critical hits dealt to non-boss type titans' limbs disables limb regeneration" },
    { Id = "Assassin", Name = "[Offense] Assassin", Stars = 3, Desc = "Blade skills deal 25.0% more DMG and have +15.0% SKILL CD REDUCTION" },
    { Id = "Quakestrike", Name = "[Offense] Quakestrike", Stars = 3, Desc = "Each kill increases DMG by 1.5%, resets after reloading" },
    { Id = "Furyforge", Name = "[Offense] Furyforge", Stars = 3, Desc = "Increase DMG by 0.4% for every 1.0% of HEALTH lost" },
    { Id = "Stormcharged", Name = "[Offense] Stormcharged", Stars = 2, Desc = "DMG increases by 3.0% for each shifter currently active in a match" },
    { Id = "Stalwart", Name = "[Offense] Stalwart", Stars = 2, Desc = "BLADE DURABILITY increases by 3.0% for every broken segment" },
    { Id = "Surgeshot", Name = "[Offense] Surgeshot", Stars = 1, Desc = "Holding your Spears M1 for longer increases the BLAST RADIUS" },
    { Id = "Swiftshot", Name = "[Offense] Swiftshot", Stars = 1, Desc = "Refilling your gas and blades is 25.0% faster" },
    { Id = "Crescendo", Name = "[Offense] Crescendo", Stars = 1, Desc = "Deal an additional 20.0% DMG to titans that are stunned" },
    { Id = "Blitzblade", Name = "[Offense] Blitzblade", Stars = 1, Desc = "Holding your Blades M1 for longer increases the total DMG" },
    { Id = "Bloodthief", Name = "[Support] Bloodthief", Stars = 4, Desc = "Being hooked onto an enemy titan recovers 3.0% HEALTH every 2s" },
    { Id = "Apotheosis", Name = "[Support] Apotheosis", Stars = 4, Desc = "Awakening Bar fills 15.0% faster, can shift at 60.0% bar and +1.25% DMG for every 10.0% of Bar filled" },
    { Id = "Tactician", Name = "[Support] Tactician", Stars = 3, Desc = "All support skill effects are multiplied by 1.15x" },
    { Id = "Omnirange", Name = "[Support] Omnirange", Stars = 3, Desc = "Any ranged skills now affect all players, regardless of range" },
    { Id = "Flashstep", Name = "[Support] Flashstep", Stars = 3, Desc = "Dashes/Flips now have I-Frames" },
    { Id = "GemFiend", Name = "[Support] Gem Fiend", Stars = 2, Desc = "Obtain +10.0% more Gems from AFK Zone/Mission Streak" },
    { Id = "Vitalize", Name = "[Support] Vitalize", Stars = 2, Desc = "Saving a teammate heals both of you for 10.0% HEALTH, each dealing 25.0% more DMG next hit" },
    { Id = "Lifefeed", Name = "[Support] Lifefeed", Stars = 2, Desc = "Gain 2.0% of your HEALTH back per titan kill" },
    { Id = "CooldownBlitz", Name = "[Support] Cooldown Blitz", Stars = 1, Desc = "SKILL COOLDOWN REDUCTION increases by 10.0%" },
    { Id = "Mendmaster", Name = "[Support] Mendmaster", Stars = 1, Desc = "Gain 1 extra bandage after refilling your gas and blades" },
}
for _, m in ipairs(SH.Memories) do
    m.Key = "Mem_" .. m.Id
    Cfg[m.Key] = 5
    FARM_RANGES[m.Key] = { 0, 10 }
end
local UiSync = { Defaults = { Cfg = {}, Hub = {} }, Refreshers = {} }
for key, value in pairs(Cfg) do
    if type(value) == "table" then
        local copy = {}
        for i, item in ipairs(value) do copy[i] = item end
        UiSync.Defaults.Cfg[key] = copy
    else
        UiSync.Defaults.Cfg[key] = value
    end
end
function UiSync.Add(fn)
    UiSync.Refreshers[#UiSync.Refreshers + 1] = fn
end
function UiSync.Link(control, tbl, key, extra)
    UiSync.Add(function()
        local want = tbl[key]
        if control.Value ~= want then control.Value = want end
        if extra then extra(control, want) end
    end)
    return control
end
function UiSync.Refresh()
    for _, fn in ipairs(UiSync.Refreshers) do pcall(fn) end
end
local SAVE_DIR = "AotrUpdate5"
local LEGACY_PATH = SAVE_DIR .. "/AOTR_Menu_" .. tostring(LocalPlayer.UserId) .. ".json"
local canSave = type(writefile) == "function" and type(readfile) == "function" and type(isfile) == "function"
local function ClampDelay(v)
    v = tonumber(v) or 10
    return math.clamp(math.floor(v + 0.5), MIN_DELAY, MAX_DELAY)
end
local function ApplyCfgData(data)
    if type(data) ~= "table" then return end
    if type(data.Slot) == "number" and data.Slot >= 1 and data.Slot <= 3 then Cfg.Slot = math.floor(data.Slot) end
    if data.JoinDelay ~= nil then Cfg.JoinDelay = ClampDelay(data.JoinDelay) end
    if data.MissionJoinDelay ~= nil then Cfg.MissionJoinDelay = ClampDelay(data.MissionJoinDelay) end
    if data.RaidJoinDelay ~= nil then Cfg.RaidJoinDelay = ClampDelay(data.RaidJoinDelay) end
    if data.WaveJoinDelay ~= nil then Cfg.WaveJoinDelay = ClampDelay(data.WaveJoinDelay) end
    for _, key in ipairs({
        "AutoSelect", "AutoJoin", "AutoSpin", "SpinUseDelay", "SpinShowList",
        "AutoClaimMain", "AutoClaimSide", "AutoClaimAchievements", "AutoClaimWeekly", "AutoClaimDaily", "AutoOpenPages", "AutoQuestThunder", "AutoQuestThunderR1", "AutoQuestThunderR2", "AutoQuestThunderR3",
        "AutoUpgradeBlade", "AutoUpgradeThunder", "AutoEquipThunder", "AutoEquipBlade",
        "AutoBestGrade", "AutoBoostMission", "AutoCreateMission", "AutoStartMission", "AutoCreateRaid", "AutoStartRaid", "AutoCreateWave", "AutoStartWave", "AutoLootCrate", "AutoRefillWave", "AutoRollBlessing", "RollStopOnMatch", "AutoHealInjuries", "AutoUpgradeChar", "AutoUpgradeBlades", "UpgMaxHP", "UpgRegen", "UpgReplenish", "UpgRefills", "UpgRevive",
        "AutoShop", "ShopPerk", "ShopArtifact", "ShopMemory", "ShopCrates", "ShopStar1", "ShopStar2", "ShopStar3", "ShopStar4", "ShopStar5",
        "ShopPerkStar1", "ShopPerkStar2", "ShopPerkStar3", "ShopPerkStar4", "ShopPerkStar5", "ShopArtifactStar1", "ShopArtifactStar2", "ShopArtifactStar3", "ShopArtifactStar4", "ShopArtifactStar5", "ShopMemoryStar1", "ShopMemoryStar2", "ShopMemoryStar3", "ShopMemoryStar4", "ShopMemoryStar5",
        "AutoFarm", "WaitForBoss", "AutoPlay", "AutoClearWave", "AutoFarmThunder", "AutoFarmSmart", "RefillEnabled", "RefillPickBlade", "RefillPickThunder", "SafeFarm", "AutoReload", "AutoRefillsBlade", "AutoRefillsThunder", "DamageMultiplier", "AutoFailSafe", "NoClip", "HitAllParts", "AutoM1", "NearFallback", "MultiHit",
        "AutoRetry", "AutoLeave", "AutoLeaveWhenRetryComplete", "AutoReady", "AutoVoteSkip", "AutoLeaveAtWave", "AutoSkipCutscene", "AutoOpenChestFree", "AutoOpenChestPremium", "AutoFinishChest", "AutoCannon", "CannonFarmSmall", "AutoDefendEren", "UseThunderSpears",
        "AutoSkill1", "AutoSkill2", "AutoSkill3", "AutoSkill4", "AutoSkill5", "AutoUpgradeSkills", "SkillLeft", "SkillMiddle", "SkillRight",
        "AutoCraftPerks", "CraftCommonRare", "CraftRareEpic", "CraftEpicLegendary", "CraftLegendaryMythic", "AutoPrestige",
    }) do
        if type(data[key]) == "boolean" then Cfg[key] = data[key] end
    end
    for i = 1, 5 do
        local old = data["ShopStar" .. i]
        if type(old) == "boolean" then
            for _, p in ipairs({ "ShopPerkStar", "ShopArtifactStar", "ShopMemoryStar" }) do
                if data[p .. i] == nil then Cfg[p .. i] = old end
            end
        end
    end
    if type(data.RetryDone) == "number" and data.RetryDone == data.RetryDone and data.RetryDone >= 0 then
        Cfg.RetryDone = math.floor(data.RetryDone)
    end
    if type(data.QuestR3Played) == "number" and data.QuestR3Played == data.QuestR3Played and data.QuestR3Played >= 0 then
        Cfg.QuestR3Played = math.floor(data.QuestR3Played)
    end
    if type(data.Streak) == "number" and data.Streak == data.Streak and data.Streak >= 0 then
        Cfg.Streak = math.floor(data.Streak)
    end
    for key, range in pairs(FARM_RANGES) do
        if type(data[key]) == "number" and data[key] == data[key] then
            Cfg[key] = math.clamp(math.floor(data[key] + 0.5), range[1], range[2])
        end
    end
    if type(data.SpinDelay) == "number" and data.SpinDelay == data.SpinDelay then
        Cfg.SpinDelay = math.clamp(math.floor(data.SpinDelay * 2 + 0.5) / 2, 0.5, 10)
    end
    if data.AutoCreateMission == nil and type(data.RememberAutoCreate) == "boolean" then Cfg.AutoCreateMission = data.RememberAutoCreate end
    if data.AutoStartMission == nil and type(data.RememberAutoStart) == "boolean" then Cfg.AutoStartMission = data.RememberAutoStart end
    for _, key in ipairs({ "FarmMode", "MissionSelect", "MissionObjective", "MissionLevel", "RaidSelect", "RaidLevel", "WaveSelect", "WaveLevel", "ShopPriority", "SpinStopRarity", "SpinOnKeep", "SpinFamilyRules", "AutoSkillMode1", "AutoSkillMode2", "AutoSkillMode3", "AutoSkillMode4", "AutoSkillMode5", "SkillLeftPick", "SkillMiddlePick", "SkillRightPick", "PrestigeBoost1", "PrestigeBoost2", "PrestigeBoost3", "PrestigeBoost4", "PrestigeBoost5" }) do
        if type(data[key]) == "string" then Cfg[key] = data[key] end
    end
    for _, key in ipairs({ "MissionDifficulty", "MissionModifiers", "RaidModifiers" }) do
        if type(data[key]) == "table" then
            local names = {}
            for _, v in ipairs(data[key]) do
                if type(v) == "string" then names[#names + 1] = v end
            end
            Cfg[key] = names
        end
    end
end
local function ReadLegacyCfg()
    if not canSave then return nil end
    local ok, data = pcall(function()
        if not isfile(LEGACY_PATH) then return nil end
        return HttpService:JSONDecode(readfile(LEGACY_PATH))
    end)
    if ok and type(data) == "table" then return data end
    return nil
end
local saveHook = nil
local saveQueued = false
local function Save()
    if saveQueued then return end
    saveQueued = true
    task.delay(0.4, function()
        saveQueued = false
        if saveHook then pcall(saveHook) end
    end)
end
local ConfigStore = {
    DEFAULT_NAME = "Aotr:Update[5] | Default",
        DEFAULT_LOOK = { Theme = "Red", Accent = "Red", UIBlur = true, Dropshadow = true, Keybind = "B" },
}
do
    local DEFAULT_CONFIG_NAME = ConfigStore.DEFAULT_NAME
    local DEFAULT_LOOK = ConfigStore.DEFAULT_LOOK
    local PATH = SAVE_DIR .. "/AOTR_Configs_" .. tostring(LocalPlayer.UserId) .. ".json"
    local data = { Autoload = nil, Active = nil, AutoSync = true, List = {} }
    local sigs = {}
    local defaultSnap = nil
    local function Flush()
        if not canSave then return false end
        return (pcall(function()
            if type(makefolder) == "function" and type(isfolder) == "function" and not isfolder(SAVE_DIR) then
                makefolder(SAVE_DIR)
            end
            writefile(PATH, HttpService:JSONEncode(data))
        end))
    end
    local function CopyValue(v)
        if type(v) == "table" then
            local out = {}
            for _, item in ipairs(v) do
                if type(item) == "string" then out[#out + 1] = item end
            end
            return out
        end
        return v
    end
    function ConfigStore.Reload()
        data = { Autoload = nil, Active = nil, AutoSync = true, List = {} }
        sigs = {}
        if defaultSnap then data.List[DEFAULT_CONFIG_NAME] = defaultSnap end
        if not canSave then return end
        local ok, decoded = pcall(function()
            if not isfile(PATH) then return nil end
            return HttpService:JSONDecode(readfile(PATH))
        end)
        if ok and type(decoded) == "table" then
            if type(decoded.List) == "table" then
                for name, snap in pairs(decoded.List) do
                    if type(name) == "string" and type(snap) == "table" and name ~= DEFAULT_CONFIG_NAME then data.List[name] = snap end
                end
            end
            if type(decoded.Autoload) == "string" and data.List[decoded.Autoload] then data.Autoload = decoded.Autoload end
            if type(decoded.Active) == "string" and data.List[decoded.Active] then data.Active = decoded.Active end
            if decoded.AutoSync == false then data.AutoSync = false end
        end
    end
    function ConfigStore.Names()
        local names = {}
        for name in pairs(data.List) do names[#names + 1] = name end
        table.sort(names, function(a, b)
            if a == DEFAULT_CONFIG_NAME then return b ~= DEFAULT_CONFIG_NAME end
            if b == DEFAULT_CONFIG_NAME then return false end
            return a:lower() < b:lower()
        end)
        return names
    end
    function ConfigStore.IsDefault(name) return name == DEFAULT_CONFIG_NAME end
    function ConfigStore.Exists(name) return data.List[name] ~= nil end
    function ConfigStore.Get(name) return data.List[name] end
    function ConfigStore.Autoload() return data.Autoload end
    function ConfigStore.Active() return data.Active end
    function ConfigStore.AutoloadSnapshot() return data.Autoload and data.List[data.Autoload] or nil end
    function ConfigStore.Snapshot(hub)
        local snap = { Cfg = {}, Hub = {} }
        for k, v in pairs(Cfg) do snap.Cfg[k] = CopyValue(v) end
        if hub then
            for k, v in pairs(hub) do
                local t = type(v)
                if t == "boolean" or t == "number" or t == "string" then snap.Hub[k] = v end
            end
        end
        if ConfigStore.GetUI then
            local okUi, ui = pcall(ConfigStore.GetUI)
            if okUi and type(ui) == "table" then snap.UI = ui end
        end
        return snap
    end
    function ConfigStore.Put(name, snap)
        if name == DEFAULT_CONFIG_NAME then return false end
        data.List[name] = snap
        sigs[name] = nil
        return Flush()
    end
    function ConfigStore.Delete(name)
        if name == DEFAULT_CONFIG_NAME then return false end
        data.List[name] = nil
        sigs[name] = nil
        if data.Autoload == name then data.Autoload = nil end
        if data.Active == name then data.Active = nil end
        return Flush()
    end
    function ConfigStore.SetAutoload(name)
        if name ~= nil and not data.List[name] then return false end
        data.Autoload = name
        return Flush()
    end
    function ConfigStore.SetActive(name)
        if name ~= nil and not data.List[name] then return false end
        if data.Active == name then return true end
        data.Active = name
        return Flush()
    end
    function ConfigStore.SyncActive(hub)
        if data.AutoSync == false then return false end
        local name = data.Active
        if not name or not data.List[name] then return false end
        if name == DEFAULT_CONFIG_NAME then return false end
        local snap = ConfigStore.Snapshot(hub)
        local okSig, sig = pcall(function() return HttpService:JSONEncode(snap) end)
        if not okSig or sigs[name] == sig then return false end
        data.List[name] = snap
        if Flush() then sigs[name] = sig return true end
        return false
    end
    function ConfigStore.AutoSync() return data.AutoSync ~= false end
    function ConfigStore.SetAutoSync(value)
        data.AutoSync = value and true or false
        return Flush()
    end
    function ConfigStore.SaveActive(hub)
        local name = data.Active
        if not name or not data.List[name] then return false, nil end
        if name == DEFAULT_CONFIG_NAME then return false, name end
        local snap = ConfigStore.Snapshot(hub)
        data.List[name] = snap
        sigs[name] = nil
        local ok = Flush()
        if ok then
            local okSig, sig = pcall(function() return HttpService:JSONEncode(snap) end)
            if okSig then sigs[name] = sig end
        end
        return ok, name
    end
    local function SameValue(x, y)
        if type(x) ~= type(y) then return false end
        if type(x) == "table" then
            if #x ~= #y then return false end
            for i = 1, #x do
                if x[i] ~= y[i] then return false end
            end
            return true
        end
        return x == y
    end
    local function SameMap(current, saved)
        if type(saved) ~= "table" then return true end
        for k, v in pairs(current) do
            if saved[k] ~= nil and not SameValue(v, saved[k]) then return false end
        end
        return true
    end
    function ConfigStore.IsDirty(hub)
        local name = data.Active
        local saved = name and data.List[name]
        if not saved then return false end
        local snap = ConfigStore.Snapshot(hub)
        return not (SameMap(snap.Cfg, saved.Cfg) and SameMap(snap.Hub, saved.Hub) and SameMap(snap.UI or {}, saved.UI))
    end
    function ConfigStore.ApplyCfg(snap)
        if type(snap) ~= "table" or type(snap.Cfg) ~= "table" then return end
        local saved = snap.Cfg
        for k, v in pairs(saved) do
            local cur = Cfg[k]
            if cur ~= nil and type(cur) == type(v) then
                if type(v) == "table" then
                    Cfg[k] = CopyValue(v)
                elseif k == "JoinDelay" or k == "MissionJoinDelay" or k == "RaidJoinDelay" or k == "WaveJoinDelay" then
                    Cfg[k] = ClampDelay(v)
                elseif k == "Slot" then
                    Cfg[k] = math.clamp(math.floor(v), 1, 3)
                elseif k == "SpinDelay" and v == v then
                    Cfg[k] = math.clamp(math.floor(v * 2 + 0.5) / 2, 0.5, 10)
                elseif FARM_RANGES[k] and v == v then
                    Cfg[k] = math.clamp(math.floor(v + 0.5), FARM_RANGES[k][1], FARM_RANGES[k][2])
                else
                    Cfg[k] = v
                end
            end
        end
        if saved.AutoCreateMission == nil and type(saved.RememberAutoCreate) == "boolean" then Cfg.AutoCreateMission = saved.RememberAutoCreate end
        if saved.AutoStartMission == nil and type(saved.RememberAutoStart) == "boolean" then Cfg.AutoStartMission = saved.RememberAutoStart end
    end
    function ConfigStore.ApplyHub(hub, snap)
        if type(snap) ~= "table" or type(snap.Hub) ~= "table" then return end
        for k, v in pairs(snap.Hub) do
            if hub[k] ~= nil and type(hub[k]) == type(v) then hub[k] = v end
        end
    end
    function ConfigStore.ApplyUI(snap)
        if type(snap) ~= "table" or type(snap.UI) ~= "table" then return end
        if ConfigStore.UIApplier then pcall(ConfigStore.UIApplier, snap.UI) end
    end
    function ConfigStore.BuildDefault(hubDefaults)
        local snap = { Cfg = {}, Hub = {}, UI = {} }
        for k, v in pairs(UiSync.Defaults.Cfg) do snap.Cfg[k] = CopyValue(v) end
        if hubDefaults then
            for k, v in pairs(hubDefaults) do
                local t = type(v)
                if t == "boolean" or t == "number" or t == "string" then snap.Hub[k] = v end
            end
        end
        for k, v in pairs(DEFAULT_LOOK) do snap.UI[k] = v end
        defaultSnap = snap
        data.List[DEFAULT_CONFIG_NAME] = snap
        sigs[DEFAULT_CONFIG_NAME] = nil
    end
    ConfigStore.BuildDefault()
    ConfigStore.Reload()
end
-- ============================================================
--  Aotr:Update[5] | Obsidian UI adapter
--  Maps the menu-building calls used by this script onto the Obsidian UI library.
-- ============================================================
local Cascade
do
    local OBSIDIAN_REPO = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
    local okLib, Library = pcall(function()
        return loadstring(game:HttpGet(OBSIDIAN_REPO .. "Library.lua"))()
    end)
    if not okLib or type(Library) ~= "table" then
        SH.say("Could not load the interface. Check your internet connection.")
        pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Aotr:Update[5]", Text = "Could not load the UI library (check your internet / GitHub).", Duration = 8,
            })
        end)
        return
    end

    local uid = 0
    local function nextId(prefix) uid = uid + 1 return prefix .. uid end
    local function clean(s) return (tostring(s or ""):gsub("\u{200B}", "")) end
    local function nonEmpty(s) s = clean(s) if s == "" then return nil end return s end
    local function safe(fn, ...) local ok, err = pcall(fn, ...) if not ok then SH.dbg("[UI]", tostring(err)) end return ok end
    local allGroupboxes = {}

    -- A row that never received a control becomes a plain text label.
    local function flushRow(row)
        if row._done then return end
        row._done = true
        local text = row.title or ""
        if row.subtitle and row.subtitle ~= "" then text = text .. ((text ~= "") and "\n" or "") .. row.subtitle end
        if text == "" then return end
        row._label = row._gb:AddLabel(text, true)
    end
    local function flushGroupbox(gb)
        local row = gb._open
        gb._open = nil
        if row then flushRow(row) end
    end
    local function flushAll()
        for _, gb in ipairs(allGroupboxes) do flushGroupbox(gb) end
    end

    -- Generic control object: Value / Text / Label / Options act like properties.
    local function newControl(getters, setters)
        local obj = { _getters = getters, _setters = setters, _born = os.clock() + 0.25 }
        return setmetatable(obj, {
            __index = function(t, k)
                local g = rawget(t, "_getters")[k]
                if g then return g(t) end
                return nil
            end,
            __newindex = function(t, k, v)
                local s = rawget(t, "_setters")[k]
                if s then s(t, v) else rawset(t, k, v) end
            end,
        })
    end
    local function muted(obj)
        return rawget(obj, "_silent") or os.clock() < (rawget(obj, "_born") or 0)
    end
    local function setSilently(obj, fn)
        rawset(obj, "_silent", true)
        pcall(fn)
        rawset(obj, "_silent", false)
    end
    local function fakeInstance(obj)
        local callbacks = {}
        rawset(obj, "_clicks", callbacks)
        local proxy = { MouseButton1Click = {
            Connect = function(_, fn)
                callbacks[#callbacks + 1] = fn
                return { Disconnect = function()
                    for i, f in ipairs(callbacks) do if f == fn then table.remove(callbacks, i) break end end
                end }
            end,
        } }
        return {
            FindFirstChildWhichIsA = function() return proxy end,
            FindFirstChild = function() return nil end,
            MouseButton1Click = proxy.MouseButton1Click,
        }
    end

    local Side = {}
    Side.__index = Side

    local function takeRow(side)
        local row = side._row
        row._done = true
        if row._gb._open == row then row._gb._open = nil end
        return row, row._gb
    end

    function Side:TitleStack(o)
        local row = self._row
        row.title = nonEmpty(o and o.Title)
        row.subtitle = nonEmpty(o and o.Subtitle)
        local stack = newControl({
            Title = function() return row.title or "" end,
            Subtitle = function() return row.subtitle or "" end,
        }, {
            Title = function(_, v)
                row.title = nonEmpty(v)
                if row._label then safe(function() row._label:SetText((row.title or "") .. ((row.subtitle and ("\n" .. row.subtitle)) or "")) end) end
            end,
            Subtitle = function(_, v)
                row.subtitle = nonEmpty(v)
                if row._label then safe(function() row._label:SetText((row.title or "") .. ((row.subtitle and ("\n" .. row.subtitle)) or "")) end) end
            end,
        })
        return stack
    end

    function Side:Label(o)
        local row, gb = takeRow(self)
        local text = tostring(o and o.Text or "")
        local prefix = row.title and (row.title .. ": ") or ""
        local el = gb:AddLabel(prefix .. text, true)
        local obj
        obj = newControl({
            Text = function() return text end,
            Value = function() return text end,
        }, {
            Text = function(_, v) text = tostring(v) safe(function() el:SetText(prefix .. text) end) end,
            Value = function(_, v) text = tostring(v) safe(function() el:SetText(prefix .. text) end) end,
        })
        rawset(obj, "__instance", el.TextLabel)
        return obj
    end

    function Side:Toggle(o)
        local row, gb = takeRow(self)
        local value = (o and o.Value) and true or false
        local obj, el
        obj = newControl({ Value = function() return value end }, {
            Value = function(t, v)
                v = v and true or false
                if v == value then return end
                value = v
                if el then setSilently(t, function() el:SetValue(v) end) end
            end,
        })
        el = gb:AddToggle(nextId("T"), {
            Text = row.title or "Toggle",
            Tooltip = row.subtitle,
            Default = value,
            Callback = function(v)
                value = v and true or false
                if muted(obj) then return end
                if o and o.ValueChanged then task.spawn(o.ValueChanged, obj, value) end
            end,
        })
        return obj
    end

    function Side:Button(o)
        local row, gb = takeRow(self)
        local label = tostring(o and o.Label or "")
        local text = row.title or ((label ~= "") and label or "Run")
        local obj
        obj = newControl({ Label = function() return label end, Text = function() return text end }, {
            Label = function(_, v) label = tostring(v) end,
            Text = function(_, v) label = tostring(v) end,
        })
        rawset(obj, "__instance", fakeInstance(obj))
        gb:AddButton({
            Text = text,
            Tooltip = row.subtitle,
            Func = function()
                if o and o.Callback then task.spawn(o.Callback, obj) end
                for _, fn in ipairs(rawget(obj, "_clicks") or {}) do task.spawn(fn) end
            end,
        })
        return obj
    end

    local function makeDropdown(self, o, multi)
        local row, gb = takeRow(self)
        local values = {}
        for i, v in ipairs(o and o.Options or {}) do values[i] = tostring(v) end
        local idx, list = nil, {}
        if multi then
            local src = o and o.Value
            if type(src) == "number" then src = { src } end
            for _, i in ipairs(type(src) == "table" and src or {}) do if values[i] then list[#list + 1] = i end end
        else
            local v = o and o.Value
            if type(v) == "table" then v = v[1] end
            if type(v) == "number" and values[v] then idx = v end
        end
        local obj, el
        local function toDict(lst)
            local d = {}
            for _, i in ipairs(lst) do if values[i] then d[values[i]] = true end end
            return d
        end
        obj = newControl({
            Value = function() if multi then return list end return idx end,
            Label = function() return idx and values[idx] or "" end,
            Options = function() return values end,
        }, {
            Value = function(t, v)
                if multi then
                    if type(v) == "number" then v = { v } end
                    list = {}
                    for _, i in ipairs(type(v) == "table" and v or {}) do if values[i] then list[#list + 1] = i end end
                    if el then setSilently(t, function() el:SetValue(toDict(list)) end) end
                else
                    if type(v) == "table" then v = v[1] end
                    idx = (type(v) == "number" and values[v]) and v or nil
                    if el and idx then setSilently(t, function() el:SetValue(values[idx]) end) end
                end
            end,
            Label = function() end,
            Options = function(t, v)
                values = {}
                for i, x in ipairs(v or {}) do values[i] = tostring(x) end
                if el then setSilently(t, function() el:SetValues(values) end) end
            end,
        })
        rawset(obj, "__instance", fakeInstance(obj))
        el = gb:AddDropdown(nextId(multi and "M" or "D"), {
            Values = values,
            Default = (not multi) and idx or nil,
            Multi = multi,
            Text = row.title or "Select",
            Tooltip = row.subtitle,
            AllowNull = multi,
            Callback = function(v)
                if muted(obj) then return end
                if multi then
                    local picked = {}
                    for i, name in ipairs(values) do if type(v) == "table" and v[name] then picked[#picked + 1] = i end end
                    list = picked
                    if o and o.ValueChanged then task.spawn(o.ValueChanged, obj, picked) end
                else
                    local i = table.find(values, v)
                    if not i then return end
                    idx = i
                    if o and o.ValueChanged then task.spawn(o.ValueChanged, obj, i) end
                end
            end,
        })
        if multi and #list > 0 then setSilently(obj, function() el:SetValue(toDict(list)) end) end
        return obj
    end
    function Side:PullDownButton(o) return makeDropdown(self, o, false) end
    function Side:PopUpButton(o) return makeDropdown(self, o, true) end

    function Side:Slider(o)
        local row, gb = takeRow(self)
        local min, max = tonumber(o.Minimum) or 0, tonumber(o.Maximum) or 100
        local value = tonumber(o.Value) or min
        local whole = (min % 1 == 0) and (max % 1 == 0) and (value % 1 == 0)
        local obj, el
        obj = newControl({ Value = function() return value end }, {
            Value = function(t, v)
                v = tonumber(v)
                if not v or v == value then return end
                value = v
                if el then setSilently(t, function() el:SetValue(v) end) end
            end,
        })
        el = gb:AddSlider(nextId("S"), {
            Text = row.title or "Value",
            Tooltip = row.subtitle,
            Default = math.clamp(value, min, max),
            Min = min, Max = max,
            Rounding = whole and 0 or 2,
            Callback = function(v)
                value = v
                if muted(obj) then return end
                if o.ValueChanged then task.spawn(o.ValueChanged, obj, v) end
            end,
        })
        return obj
    end

    function Side:TextField(o)
        local row, gb = takeRow(self)
        local value = tostring(o and o.Value or "")
        local obj, el
        obj = newControl({ Value = function() return value end, Text = function() return value end }, {
            Value = function(t, v)
                v = tostring(v or "")
                if v == value then return end
                value = v
                if el then setSilently(t, function() el:SetValue(v) end) end
            end,
            Text = function(t, v) t.Value = v end,
        })
        el = gb:AddInput(nextId("I"), {
            Text = row.title or "Text",
            Tooltip = row.subtitle,
            Default = value,
            Placeholder = o and o.Placeholder or "",
            Finished = true,
            Callback = function(v)
                value = tostring(v or "")
                if muted(obj) then return end
                if o and o.TextChanged then task.spawn(o.TextChanged, obj, value) end
                if o and o.ValueChanged then task.spawn(o.ValueChanged, obj, value) end
            end,
        })
        return obj
    end

    function Side:KeybindField(o)
        local row, gb = takeRow(self)
        local key = (o and o.Value) or Enum.KeyCode.LeftAlt
        local host = gb:AddLabel(row.title or "Keybind")
        local obj, picker
        obj = newControl({ Value = function() return key end }, {
            Value = function(t, v)
                if typeof(v) ~= "EnumItem" or v == key then return end
                key = v
                if picker then setSilently(t, function() picker:SetValue({ v.Name, "Toggle" }) end) end
            end,
        })
        picker = host:AddKeyPicker(nextId("K"), {
            Default = key.Name,
            Mode = "Toggle",
            Text = row.title or "Keybind",
            NoUI = true,
            Callback = function()
                if o and o.BindPressed then task.spawn(o.BindPressed, obj, key, true, false) end
            end,
        })
        pcall(function()
            picker:OnChanged(function()
                if muted(obj) then return end
                local ok, newKey = pcall(function() return Enum.KeyCode[picker.Value] end)
                if ok and newKey and newKey ~= key then
                    key = newKey
                    if o and o.ValueChanged then task.spawn(o.ValueChanged, obj, newKey) end
                end
            end)
        end)
        return obj
    end

    local Row = {}
    Row.__index = Row
    function Row:Left() return setmetatable({ _row = self }, Side) end
    function Row:Right() return setmetatable({ _row = self }, Side) end

    local FormAPI = {}
    FormAPI.__index = FormAPI
    function FormAPI:Row()
        local gb = self._gb
        flushGroupbox(gb)
        local row = setmetatable({ _gb = gb }, Row)
        gb._open = row
        return row
    end

    local SectionAPI = {}
    SectionAPI.__index = SectionAPI
    function SectionAPI:Form() return setmetatable({ _gb = self._gb }, FormAPI) end

    local TabAPI = {}
    TabAPI.__index = TabAPI
    function TabAPI:PageSection(o)
        flushAll()
        local title = clean(o and o.Title)
        if title == "" then title = " " end
        local gb
        if self._n % 2 == 0 then gb = self._tab:AddLeftGroupbox(title) else gb = self._tab:AddRightGroupbox(title) end
        self._n = self._n + 1
        local sub = nonEmpty(o and o.Subtitle)
        if sub then gb:AddLabel(sub, true) end
        allGroupboxes[#allGroupboxes + 1] = gb
        return setmetatable({ _gb = gb }, SectionAPI)
    end

    local WindowAPI = {}
    WindowAPI.__index = function(w, k)
        if k == "Minimized" then return not Library.Toggled end
        if k == "Maximized" then return false end
        return rawget(WindowAPI, k) or rawget(w, "_p_" .. tostring(k))
    end
    WindowAPI.__newindex = function(w, k, v)
        if k == "Minimized" then
            local wantShown = not v
            if (Library.Toggled and true or false) ~= wantShown then pcall(function() Library:Toggle() end) end
        elseif k == "Maximized" then
            return
        else
            rawset(w, "_p_" .. tostring(k), v)
        end
    end
    local function makeTab(win, o)
        flushAll()
        local tab = win._win:AddTab(clean(o and o.Title))
        return setmetatable({ _tab = tab, _n = 0 }, TabAPI)
    end
    function WindowAPI:Tab(o) return makeTab(self, o) end

    local AppAPI = {}
    AppAPI.__index = AppAPI
    function AppAPI:Window(o)
        local win = Library:CreateWindow({
            Title = "Aotr:Update[5]",
            Footer = tostring(o and o.Title or "Attack on Titan Revolution"),
            Size = o and o.Size or UDim2.fromOffset(720, 560),
            Center = true,
            AutoShow = true,
            ShowCustomCursor = false,
            NotifySide = "Right",
            ToggleKeybind = Enum.KeyCode.RightControl,
        })
        return setmetatable({ _win = win }, WindowAPI)
    end
    function AppAPI:Destroy() pcall(function() Library:Unload() end) end

    Cascade = {
        Accents = {}, Themes = { Dark = {} }, Symbols = {},
        New = function() return setmetatable({}, AppAPI) end,
        Components = {
            Section = function(window, o)
                return { Tab = function(_, t) return makeTab(window, t) end }
            end,
        },
        FlushAll = flushAll,
    }
end
local function Icon(...)
    for _, name in ipairs({ ... }) do
        if Cascade.Symbols[name] then return Cascade.Symbols[name] end
    end
    return Cascade.Symbols["boltFill"]
end
local function BindButton(btn, fn)
    local last = 0
    local function run()
        if os.clock() - last < 0.5 then return end
        last = os.clock()
        task.spawn(fn)
    end
    pcall(function()
        if btn.__instance then
            local obj = btn.__instance:FindFirstChildWhichIsA("TextButton", true) or btn.__instance
            obj.MouseButton1Click:Connect(run)
        end
    end)
    return run
end
local SettingsStore = {}
do
    local HttpService = game:GetService("HttpService")
    local owner = game:GetService("Players").LocalPlayer
    local ROOT = "AotrUpdate5"
    local DIR = ROOT .. "/" .. tostring(owner.UserId)
    local canSave = type(writefile) == "function" and type(readfile) == "function" and type(isfile) == "function"
    local canFolder = type(makefolder) == "function" and type(isfolder) == "function"
    local flushers = {}
    function SettingsStore.Path(fileName)
        if canFolder then
            return DIR .. "/" .. fileName .. ".json"
        end
        return ROOT .. "_" .. tostring(owner.UserId) .. "_" .. fileName .. ".json"
    end
    local function ensureFolder()
        if not canFolder then return end
        pcall(function()
            if not isfolder(ROOT) then makefolder(ROOT) end
            if not isfolder(DIR) then makefolder(DIR) end
        end)
    end
    local function copy(value)
        if type(value) ~= "table" then return value end
        local out = {}
        for k, v in pairs(value) do
            out[k] = copy(v)
        end
        return out
    end
    local function clean(value, depth)
        depth = depth or 0
        local kind = type(value)
        if kind == "string" or kind == "boolean" then return value end
        if kind == "number" then
            if value ~= value or value == math.huge or value == -math.huge then return nil end
            return value
        end
        if kind ~= "table" or depth > 6 then return nil end
        local count, isArray = 0, true
        for k in pairs(value) do
            count = count + 1
            if type(k) ~= "number" then isArray = false end
        end
        if isArray then
            for i = 1, count do
                if value[i] == nil then
                    isArray = false
                    break
                end
            end
        end
        local out = {}
        if isArray then
            for i = 1, count do
                local c = clean(value[i], depth + 1)
                if c ~= nil then table.insert(out, c) end
            end
        else
            for k, v in pairs(value) do
                local c = clean(v, depth + 1)
                if c ~= nil then out[tostring(k)] = c end
            end
        end
        return out
    end
    function SettingsStore.Load(fileName)
        if not canSave then return {} end
        local ok, data = pcall(function()
            local path = SettingsStore.Path(fileName)
            if not isfile(path) then return nil end
            return HttpService:JSONDecode(readfile(path))
        end)
        if ok and type(data) == "table" then return data end
        return {}
    end
    function SettingsStore.Write(fileName, data)
        if not canSave then return false end
        ensureFolder()
        local ok = pcall(function()
            writefile(SettingsStore.Path(fileName), HttpService:JSONEncode(data))
        end)
        return ok
    end
    function SettingsStore.Restore(target, saved)
        if type(target) ~= "table" or type(saved) ~= "table" then return end
        for key, default in pairs(target) do
            local value = saved[key]
            if value ~= nil then
                if type(default) == "table" then
                    if type(value) == "table" then
                        if next(default) == nil then
                            target[key] = copy(value)
                        else
                            SettingsStore.Restore(default, value)
                        end
                    end
                elseif type(default) == type(value) then
                    target[key] = value
                end
            end
        end
    end
    function SettingsStore.IndexOf(options, name, fallback)
        return table.find(options, name) or fallback or 1
    end
    function SettingsStore.IndexesFromMap(options, map)
        local out = {}
        if type(map) == "table" then
            for i, name in ipairs(options) do
                if map[name] then table.insert(out, i) end
            end
        end
        return out
    end
    function SettingsStore.ValidIndexes(list, max)
        local out, seen = {}, {}
        if type(list) == "table" then
            for _, index in ipairs(list) do
                if type(index) == "number" and index >= 1 and index <= max and index % 1 == 0 and not seen[index] then
                    seen[index] = true
                    table.insert(out, index)
                end
            end
        end
        return out
    end
    function SettingsStore.StartAutoSave(fileName, getData, interval)
        if flushers[fileName] then return end
        local last = nil
        local function flush()
            local ok, snapshot = pcall(function()
                return clean(getData())
            end)
            if not ok or type(snapshot) ~= "table" then return end
            local okSig, signature = pcall(function()
                return HttpService:JSONEncode(snapshot)
            end)
            if not okSig or signature == last then return end
            snapshot.SavedAt = os.time()
            snapshot.Account = owner.Name
            if SettingsStore.Write(fileName, snapshot) then
                last = signature
                if SettingsStore.OnSaved then pcall(SettingsStore.OnSaved, snapshot.SavedAt) end
            end
        end
        flushers[fileName] = flush
        task.spawn(function()
            while true do
                task.wait(interval or 1.5)
                flush()
            end
        end)
    end
    function SettingsStore.Flush(fileName)
        local flush = flushers[fileName]
        if flush then pcall(flush) end
    end
end
local SavedData = SettingsStore.Load("AOTR")
local SavedUi = type(SavedData.UI) == "table" and SavedData.UI or {}
do
    local autoSnap = ConfigStore.AutoloadSnapshot()
    if autoSnap and type(autoSnap.UI) == "table" then
        for k, v in pairs(autoSnap.UI) do SavedUi[k] = v end
    end
end
if type(SavedData.Cfg) == "table" then ApplyCfgData(SavedData.Cfg) else ApplyCfgData(ReadLegacyCfg()) end
if ConfigStore.AutoloadSnapshot() then
    ConfigStore.ApplyCfg(ConfigStore.AutoloadSnapshot())
    ConfigStore.SetActive(ConfigStore.Autoload())
end
-- ============================================================
-- ============================================================
SH.Legacy = {}
do
    local function Clamp(n, lo, hi) return math.max(lo, math.min(hi, n)) end

    local function Parse(src)
        src = tostring(src or "")
        if #src > 300000 then return nil, "Config text is too large" end
        local pos, len = 1, #src
        local ParseValue
        local function skip()
            while pos <= len do
                local c = src:sub(pos, pos)
                if c:match("%s") then
                    pos = pos + 1
                elseif src:sub(pos, pos + 1) == "--" then
                    local lb = src:match("^%-%-%[(=*)%[", pos)
                    if lb then
                        local close = "]" .. lb .. "]"
                        local e = src:find(close, pos, true)
                        pos = e and (e + #close) or (len + 1)
                    else
                        local e = src:find("\n", pos, true)
                        pos = e and (e + 1) or (len + 1)
                    end
                else
                    break
                end
            end
        end
        local ESC = { n = "\n", t = "\t", r = "\r", ["\\"] = "\\", ['"'] = '"', ["'"] = "'" }
        local function ParseString()
            local q = src:sub(pos, pos)
            pos = pos + 1
            local buf = {}
            while pos <= len do
                local c = src:sub(pos, pos)
                if c == q then
                    pos = pos + 1
                    return table.concat(buf)
                end
                if c == "\\" then
                    local n = src:sub(pos + 1, pos + 1)
                    buf[#buf + 1] = ESC[n] or n
                    pos = pos + 2
                else
                    buf[#buf + 1] = c
                    pos = pos + 1
                end
            end
            error("unterminated string")
        end
        local function ParseTable(depth)
            if depth > 12 then error("table nested too deep") end
            pos = pos + 1 -- {
            local t, arr = {}, 0
            while true do
                skip()
                local c = src:sub(pos, pos)
                if c == "" then error("unexpected end of text") end
                if c == "}" then
                    pos = pos + 1
                    return t
                elseif c == "," or c == ";" then
                    pos = pos + 1
                elseif c == "[" and not src:match("^%[=*%[", pos) then
                    pos = pos + 1
                    skip()
                    local key = ParseValue(depth + 1)
                    skip()
                    if src:sub(pos, pos) ~= "]" then error("expected ]") end
                    pos = pos + 1
                    skip()
                    if src:sub(pos, pos) ~= "=" then error("expected =") end
                    pos = pos + 1
                    local value = ParseValue(depth + 1)
                    if key ~= nil then t[key] = value end
                else
                    local name = src:match("^([%a_][%w_]*)%s*=[^=]", pos)
                    if name then
                        pos = pos + #name
                        skip()
                        pos = pos + 1 -- =
                        t[name] = ParseValue(depth + 1)
                    else
                        arr = arr + 1
                        t[arr] = ParseValue(depth + 1)
                    end
                end
            end
        end
        ParseValue = function(depth)
            skip()
            local c = src:sub(pos, pos)
            if c == "{" then
                return ParseTable(depth)
            elseif c == '"' or c == "'" then
                return ParseString()
            elseif c == "[" then
                local lb = src:match("^%[(=*)%[", pos)
                if not lb then error("unexpected [") end
                local close = "]" .. lb .. "]"
                local s = pos + #lb + 2
                local e = src:find(close, s, true)
                if not e then error("unterminated string") end
                pos = e + #close
                return src:sub(s, e - 1)
            end
            local numStr = src:match("^%-?%d[%d%._eE%+%-]*", pos)
            if numStr then
                local n = tonumber((numStr:gsub("_", "")))
                if not n then error("bad number") end
                pos = pos + #numStr
                return n
            end
            local word = src:match("^[%a_][%w_]*", pos)
            if word == "true" then pos = pos + 4 return true end
            if word == "false" then pos = pos + 5 return false end
            if word == "nil" then pos = pos + 3 return nil end
            error("unsupported value near position " .. pos)
        end
        local s = src:find("{", 1, true)
        if not s then return nil, "No config table { ... } found" end
        pos = s
        local ok, res = pcall(ParseTable, 1)
        if not ok then return nil, "Can't read config text: " .. tostring(res):gsub("^.-:%d+:%s*", "") end
        return res
    end

    local function Norm(s) return (tostring(s):lower():gsub("[^%w]", "")) end
    local function G(t, key)
        if type(t) ~= "table" then return nil end
        local want = Norm(key)
        for k, v in pairs(t) do
            if type(k) == "string" and Norm(k) == want then return v end
        end
        return nil
    end
    local SLOT_NUM = { A = 1, B = 2, C = 3 }
    local SKILL_PICKS = {
        Left = { "Regen VI", "Injury III" },
        Middle = { "Damage V", "Crit Damage V" },
        Right = { "Tank VIII", "Health XI" },
    }
    local function Has(list, v)
        for _, x in ipairs(list) do if x == v then return true end end
        return false
    end
    local UNSUPPORTED = {
        "Codes", "Sell Cosmetics", "Remove Perks", "Equip Perks", "Join Private Server", "Webhook",
    }

    local function Translate(tbl)
        local cfg, hub, applied, skipped = {}, {}, {}, {}
        local function Set(key, value, label)
            if Cfg[key] ~= nil and type(Cfg[key]) == type(value) then
                cfg[key] = value
                applied[#applied + 1] = label or key
            else
                skipped[#skipped + 1] = label or key
            end
        end
        local function Skip(label) skipped[#skipped + 1] = label end
        local function Bool(v) if type(v) == "boolean" then return v end return nil end
        local function Num(v) if type(v) == "number" and v == v then return v end return nil end

        local v = Bool(G(tbl, "Auto Thunder Spears"))
        if v ~= nil then Set("UseThunderSpears", v, "Auto Thunder Spears") end

        local p = G(tbl, "Auto Prestige")
        if type(p) == "table" then
            local e = Bool(G(p, "Enabled"))
            if e ~= nil then Set("AutoPrestige", e, "Auto Prestige") end
            local s = Num(G(p, "Prestige Stop At"))
            if s then Set("PrestigeStopAt", Clamp(math.floor(s + 0.5), 1, 5), "Prestige Stop At") end
            if G(p, "Gold Requirement") ~= nil then Skip("Prestige Gold Requirement") end
        end

        local slot = G(tbl, "Farm Slot")
        local slotN = type(slot) == "string" and SLOT_NUM[slot:upper()] or (Num(slot) and Clamp(math.floor(slot), 1, 3)) or nil
        if slotN then
            Set("Slot", slotN, "Farm Slot")
            Set("AutoSelect", true, "Auto Select Slot")
        end

        if G(tbl, "Colossal Raid") == true then
            Set("RaidSelect", "Colossal Titan", "Colossal Raid")
            Set("RaidLevel", "Aberrant", "Colossal Raid (level)")
            Set("AutoCreateRaid", true, "Colossal Raid (auto create)")
            Set("AutoStartRaid", true, "Colossal Raid (auto start)")
        end

        local fam = G(tbl, "Families")
        if type(fam) == "table" then
            local rules, any = {}, false
            local function AddFamilies(list)
                if type(list) ~= "table" then return end
                for _, name in ipairs(list) do
                    if type(name) == "string" then
                        name = name:gsub("[=;]", ""):match("^%s*(.-)%s*$")
                        if name ~= "" then rules[name:upper()] = "Keep" any = true end
                    end
                end
            end
            local roll = G(fam, "Auto Roll")
            if type(roll) == "table" then
                local e = Bool(G(roll, "Enabled"))
                if e ~= nil then Set("AutoSpin", e, "Auto Roll") end
                AddFamilies(G(roll, "Families"))
                if G(roll, "Lock Spins") ~= nil then Skip("Auto Roll > Lock Spins") end
            end
            local st = G(fam, "Auto Storage")
            if type(st) == "table" and G(st, "Enabled") == true then
                Set("SpinOnKeep", "Store", "Auto Storage")
                AddFamilies(G(st, "Families"))
            end
            if any then
                local parts = {}
                for k, r in pairs(rules) do parts[#parts + 1] = k .. "=" .. r end
                table.sort(parts)
                Set("SpinFamilyRules", table.concat(parts, ";"), "Families")
            end
        end

        local cp = G(tbl, "Craft Perks")
        if type(cp) == "table" then
            local e = Bool(G(cp, "Enabled"))
            if e ~= nil then Set("AutoCraftPerks", e, "Craft Perks") end
            local ch = G(cp, "Chance")
            if type(ch) == "table" then
                for src, key in pairs({ Rare = "CraftChanceCommonRare", Epic = "CraftChanceRareEpic",
                        Legendary = "CraftChanceEpicLegendary", Mythic = "CraftChanceLegendaryMythic" }) do
                    local n = Num(G(ch, src))
                    if n then Set(key, Clamp(math.floor(n + 0.5), 0, 100), "Craft Chance " .. src) end
                end
            end
            for src, key in pairs({ Epic = "CraftRareEpic", Legendary = "CraftEpicLegendary", Mythic = "CraftLegendaryMythic" }) do
                local b = Bool(G(cp, "Craft " .. src))
                if b ~= nil then Set(key, b, "Craft " .. src) end
            end
        end

        local sk = G(tbl, "Skill Trees")
        if type(sk) == "table" then
            local e = Bool(G(sk, "Enabled"))
            if e ~= nil then Set("AutoUpgradeSkills", e, "Skill Trees") end
            for _, lane in ipairs({ "Left", "Middle", "Right" }) do
                local node = G(sk, lane)
                if type(node) == "table" then
                    local on = Bool(G(node, "Enabled"))
                    if on ~= nil then Set("Skill" .. lane, on, "Skill " .. lane) end
                    local pick = G(node, "Skill")
                    if type(pick) == "string" then
                        if Has(SKILL_PICKS[lane], pick) then Set("Skill" .. lane .. "Pick", pick, "Skill " .. lane .. " Path")
                        else Skip("Skill " .. lane .. " Path (" .. pick .. ")") end
                    end
                end
            end
            if G(sk, "Upgrade Priority") ~= nil then Skip("Skill Upgrade Priority") end
        end

        local perf = G(tbl, "Performance")
        if type(perf) == "table" then
            local lock = G(perf, "FPS Lock")
            if type(lock) == "table" then
                local on = Bool(G(lock, "Enabled"))
                if on ~= nil then hub.EnableFPSLock = on applied[#applied + 1] = "FPS Lock" end
                local f = Num(G(lock, "FPS"))
                if f then hub.FPSLimit = Clamp(math.floor(f + 0.5), 1, 9999) applied[#applied + 1] = "FPS Limit" end
            end
            if G(perf, "FPS Boost") ~= nil then Skip("FPS Boost") end
        end

        for _, name in ipairs(UNSUPPORTED) do
            if G(tbl, name) ~= nil then Skip(name) end
        end
        return { cfg = cfg, hub = hub, applied = applied, skipped = skipped }
    end

    SH.Legacy.Parse = Parse
    SH.Legacy.Translate = Translate
    function SH.Legacy.Summary(res)
        local s = #res.applied .. " applied"
        if #res.skipped > 0 then s = s .. ", " .. #res.skipped .. " not supported" end
        return s
    end

    local okEnv, genv = pcall(function() return type(getgenv) == "function" and getgenv() or nil end)
    local legacy = okEnv and genv and genv.Configs or nil
    if type(legacy) == "table" then
        local ok, res = pcall(Translate, legacy)
        if ok and res then
            ConfigStore.ApplyCfg({ Cfg = res.cfg })
            SH.LegacyHub = res.hub
            SH.say("Loaded getgenv().Configs: " .. SH.Legacy.Summary(res))
            if #res.skipped > 0 then SH.say("Not supported (skipped): " .. table.concat(res.skipped, ", ")) end
        end
    end
end
Cfg.JoinDelay = ClampDelay(Cfg.JoinDelay)
Cfg.MissionJoinDelay = ClampDelay(Cfg.MissionJoinDelay)
Cfg.RaidJoinDelay = ClampDelay(Cfg.RaidJoinDelay)
Cfg.WaveJoinDelay = ClampDelay(Cfg.WaveJoinDelay)
local AccentOrder
local function CopyText(text)
    pcall(function()
        if setclipboard then setclipboard(text)
        elseif toclipboard then toclipboard(text)
        elseif syn and syn.write_clipboard then syn.write_clipboard(text)
        elseif Clipboard and Clipboard.set then Clipboard.set(text) end
    end)
end
local function StyleDropdown() end
local App = Cascade.New({ Name = "Aotr:Update[5]" })
AppRef = App
local WindowSize = UDim2.fromOffset(850, 530)
pcall(function()
    local cam = workspace.CurrentCamera
    if cam then
        local vp = cam.ViewportSize
        WindowSize = UDim2.fromOffset(math.clamp(vp.X - 30, 320, 850), math.clamp(vp.Y - 30, 240, 530))
    end
end)
local Window = App:Window({
    Title = "Attack on Titan Revolution",
    Subtitle = "Aotr:Update[5] | Version 11.5",
    Size = WindowSize,
    Resizable = true,
    Draggable = true,
    UIBlur = true
})
UiSync.Defaults.UIBlur = false
UiSync.Defaults.Dropshadow = Window.Dropshadow
-- [aotr] Auto Hide Menu: hide right away from the saved setting, don't wait for the whole script to load
SH.MenuTouched = false
SH.MenuEarlyHidden = false
do
    local hub = type(SavedData) == "table" and SavedData.Hub
    if type(hub) == "table" and hub.AutoHideMenu == true then
        local ok = pcall(function() Window.Minimized = true end)
        SH.MenuEarlyHidden = ok
    end
end
pcall(function() Window.Maximized = false end)
task.delay(4, function()
    pcall(function() if Window.Maximized then Window.Maximized = false end end)
end)
local MenuCategory = Cascade.Components.Section(Window, {
    Title = "Menu",
    Disclosure = false
})
local CharTab = MenuCategory:Tab({
    Title = "Menu Lobby",
    Icon = Icon("houseDoorFill", "houseFill", "personCircleFill"),
})
local StatusSection = CharTab:PageSection({
    Title = "📋 Status",
    Subtitle = IN_MENU and "You are in the menu place." or "Not in the menu place - menu features are idle."
})
local StatusForm = StatusSection:Form()
local StatusRow = StatusForm:Row()
StatusRow:Left():TitleStack({ Title = "Status", Subtitle = "What the script is doing right now." })
local StatusLabel = StatusRow:Right():Label({ Text = IN_MENU and "Idle" or "N/A" })
local function SetStatus(text)
    pcall(function() StatusLabel.Text = tostring(text) end)
end
local SLOT_LETTERS = { "A", "B", "C" }
local SlotOptions = { "Slot A", "Slot B", "Slot C" }
local function TextOf(o)
    local t = o.Text or ""
    t = t:gsub("<[^>]->", "")
    t = t:gsub("^%s+", ""):gsub("%s+$", "")
    return t:upper()
end
local function IsTextObj(o)
    return o:IsA("TextLabel") or o:IsA("TextButton")
end
local function IsShown(obj)
    local cur = obj
    while cur and cur ~= PlayerGui do
        if cur:IsA("GuiObject") and not cur.Visible then return false end
        if cur:IsA("ScreenGui") and not cur.Enabled then return false end
        cur = cur.Parent
    end
    return obj:IsA("GuiObject") and obj.AbsoluteSize.X > 0 and obj.AbsoluteSize.Y > 0
end
local function ToButton(o)
    if o:IsA("GuiButton") then return o end
    local cur = o.Parent
    for _ = 1, 3 do
        if not cur then break end
        if cur:IsA("GuiButton") then return cur end
        cur = cur.Parent
    end
    local p = o.Parent
    if p then return p:FindFirstChildWhichIsA("GuiButton", true) end
    return nil
end
local function FindSelectIn(container)
    for _, d in ipairs(container:GetDescendants()) do
        if IsTextObj(d) and TextOf(d) == "SELECT" and IsShown(d) then
            local b = ToButton(d)
            if b then return b end
        end
    end
    return nil
end
local function FindSlotButton(letter)
    local want = "SLOT " .. letter
    for _, d in ipairs(PlayerGui:GetDescendants()) do
        if IsTextObj(d) and TextOf(d) == want and IsShown(d) then
            local cur = d.Parent
            for _ = 1, 6 do
                if not cur or cur == PlayerGui then break end
                local btn = FindSelectIn(cur)
                if btn then return btn end
                cur = cur.Parent
            end
        end
    end
    return nil
end
local function SlotScreenVisible()
    for _, d in ipairs(PlayerGui:GetDescendants()) do
        if IsTextObj(d) and TextOf(d) == "SLOT A" and IsShown(d) then return true end
    end
    return false
end
local function ActivateButton(btn)
    pcall(function() GuiService.SelectedObject = btn end)
    task.wait(0.15)
    pcall(function()
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
        task.wait(0.05)
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
    end)
    task.wait(1.0)
    if btn.Parent and IsShown(btn) then
        pcall(function()
            if type(firesignal) == "function" then
                firesignal(btn.MouseButton1Click)
                firesignal(btn.Activated)
            end
        end)
    end
    pcall(function()
        if GuiService.SelectedObject == btn then GuiService.SelectedObject = nil end
    end)
end
local selecting = false
local function SelectCharacter()
    if selecting then return false end
    if not IN_MENU then SetStatus("N/A") return false end
    selecting = true
    local letter = SLOT_LETTERS[Cfg.Slot] or "A"
    local btn = FindSlotButton(letter)
    local result = false
    if btn then
        SetStatus("Selecting Slot " .. letter .. "...")
        ActivateButton(btn)
        SetStatus("Selected Slot " .. letter)
        result = true
    else
        SetStatus("Slot " .. letter .. " UI not found")
    end
    selecting = false
    return result
end
local CharSection = CharTab:PageSection({
    Title = "🎭 Character Selection",
    Subtitle = "Pick one slot. The script presses its SELECT button for you."
})
local CharForm = CharSection:Form()
local SlotRow = CharForm:Row()
SlotRow:Left():TitleStack({ Title = "Slot", Subtitle = "Choose which character slot to use (one at a time)." })
UiSync.Slot = SlotRow:Right():PullDownButton({
    Label = SlotOptions[Cfg.Slot],
    Options = SlotOptions,
    Value = Cfg.Slot,
    ValueChanged = function(self, index)
        if type(index) == "table" then index = index[1] end
        if type(index) ~= "number" or not SlotOptions[index] then return end
        Cfg.Slot = index
        self.Label = SlotOptions[index]
        Save()
    end
})
UiSync.Add(function()
    local i = SlotOptions[Cfg.Slot] and Cfg.Slot or 1
    UiSync.Slot.Value = i
    UiSync.Slot.Label = SlotOptions[i]
end)
local AutoSelRow = CharForm:Row()
AutoSelRow:Left():TitleStack({
    Title = "Select Character",
    Subtitle = "Automatically press SELECT on the chosen slot when the screen shows up."
})
UiSync.Link(AutoSelRow:Right():Toggle({
    Value = Cfg.AutoSelect,
    ValueChanged = function(self, value)
        Cfg.AutoSelect = value and true or false
        Save()
    end
}), Cfg, "AutoSelect")
local SelNowRow = CharForm:Row()
SelNowRow:Left():TitleStack({ Title = "Select Now", Subtitle = "Press SELECT on the chosen slot once." })
local SelNowBtn = SelNowRow:Right():Button({
    Label = "Select",
    Callback = function() end
})
BindButton(SelNowBtn, SelectCharacter)
local function GetLobbyRemote()
    local ok, remote = pcall(function()
        local assets = ReplicatedStorage:WaitForChild("Assets", 5)
        local remotes = assets and assets:WaitForChild("Remotes", 5)
        return remotes and remotes:WaitForChild("GET", 5)
    end)
    return ok and remote or nil
end
local cachedRemote = nil
local lastRequestAt = 0
local function JoinLobby()
    if not IN_MENU then SetStatus("N/A") return end
    if os.clock() - lastRequestAt < 3 then return end
    lastRequestAt = os.clock()
    task.spawn(function()
        local remote = cachedRemote
        if not remote or not remote.Parent then
            remote = GetLobbyRemote()
            cachedRemote = remote
        end
        if not remote then SetStatus("Lobby remote not found") return end
        SetStatus("Joining lobby...")
        local ok, err = pcall(function()
            return remote:InvokeServer("Functions", "Teleport", "Lobby", nil)
        end)
        SetStatus(ok and "Join request sent" or ("Join failed: " .. tostring(err)))
    end)
end
local JoinSection = CharTab:PageSection({
    Title = "🚪 Auto Join Lobby",
    Subtitle = "Repeatedly requests the lobby. Delay is " .. MIN_DELAY .. " - " .. MAX_DELAY .. " seconds."
})
local JoinForm = JoinSection:Form()
local AutoJoinRow = JoinForm:Row()
AutoJoinRow:Left():TitleStack({
    Title = "Auto Join Lobby",
    Subtitle = "Send the join-lobby request every Join Delay seconds."
})
UiSync.Link(AutoJoinRow:Right():Toggle({
    Value = Cfg.AutoJoin,
    ValueChanged = function(self, value)
        Cfg.AutoJoin = value and true or false
        Save()
    end
}), Cfg, "AutoJoin")
local DelayRow = JoinForm:Row()
DelayRow:Left():TitleStack({
    Title = "Join Delay",
    Subtitle = "Seconds between requests (" .. MIN_DELAY .. " - " .. MAX_DELAY .. "). Minimum is " .. MIN_DELAY .. "s so it can't spam by accident."
})
local DelayRight = DelayRow:Right()
local DelayLabel = DelayRight:Label({ Text = Cfg.JoinDelay .. "s" })
UiSync.Link(DelayRight:Slider({
    Minimum = MIN_DELAY,
    Maximum = MAX_DELAY,
    Value = Cfg.JoinDelay,
    ValueChanged = function(self, value)
        Cfg.JoinDelay = ClampDelay(value)
        pcall(function() DelayLabel.Text = Cfg.JoinDelay .. "s" end)
        Save()
    end
}), Cfg, "JoinDelay", function(_, want)
    pcall(function() DelayLabel.Text = want .. "s" end)
end)
local CountdownRow = JoinForm:Row()
CountdownRow:Left():TitleStack({
    Title = "Next Join",
    Subtitle = "Countdown until the next join-lobby request."
})
local CountdownLabel = CountdownRow:Right():Label({ Text = "Off" })
local lastCountdownText = nil
local function SetCountdown(text)
    if text == lastCountdownText then return end
    lastCountdownText = text
    pcall(function() CountdownLabel.Text = text end)
end
local JoinNowRow = JoinForm:Row()
JoinNowRow:Left():TitleStack({ Title = "Join Now", Subtitle = "Send the join-lobby request once." })
local JoinNowBtn = JoinNowRow:Right():Button({
    Label = "Join",
    Callback = function() end
})
BindButton(JoinNowBtn, JoinLobby)
do
    local RANK = { COMMON = 1, UNCOMMON = 2, RARE = 3, EPIC = 4, LEGENDARY = 5, MYTHIC = 6, SECRET = 7, EXCLUSIVE = 8 }
    local STOP_OPTIONS = { "Rare", "Epic", "Legendary", "Mythic", "Off" }
    if not table.find(STOP_OPTIONS, Cfg.SpinStopRarity) then Cfg.SpinStopRarity = "Epic" end
    local KEEP_ACTIONS = { "Stop", "Store", "Ask" }
    local KEEP_LABELS = { "Stop spinning", "Store & keep spinning", "Ask me" }
    if not table.find(KEEP_ACTIONS, Cfg.SpinOnKeep) then Cfg.SpinOnKeep = "Stop" end
    local FAMILY_RARITY = {
        HELOS = "MYTHIC", FRITZ = "MYTHIC",
        YEAGER = "LEGENDARY", ACKERMAN = "LEGENDARY", REISS = "LEGENDARY",
        GALLIARD = "EPIC", ZOE = "EPIC", LEONHART = "EPIC", TYBUR = "EPIC",
        KSAVER = "EPIC", BRAUN = "EPIC", FINGER = "EPIC", ARLERT = "EPIC",
        BRAUS = "RARE", KRUGER = "RARE", AZUMABITO = "RARE", SMITH = "RARE",
        GRICE = "RARE", SPRINGER = "RARE", KIRSTEIN = "RARE",
    }
    local function Cap(s)
        return (tostring(s):lower():gsub("^%l", string.upper))
    end
    local function Pretty(name)
        return (tostring(name):lower():gsub("(%a)([%w_']*)", function(a, b) return a:upper() .. b end))
    end
    local FAMILY_LIST, FAMILY_LABELS = {}, {}
    for key, rar in pairs(FAMILY_RARITY) do FAMILY_LIST[#FAMILY_LIST + 1] = { key = key, rarity = rar } end
    table.sort(FAMILY_LIST, function(a, b)
        if RANK[a.rarity] ~= RANK[b.rarity] then return RANK[a.rarity] > RANK[b.rarity] end
        return a.key < b.key
    end)
    for i, f in ipairs(FAMILY_LIST) do FAMILY_LABELS[i] = Pretty(f.key) .. " (" .. Cap(f.rarity) .. ")" end
    local rulesSrc, rulesCache = nil, {}
    local function Rules()
        if rulesSrc ~= Cfg.SpinFamilyRules then
            rulesSrc = Cfg.SpinFamilyRules
            rulesCache = {}
            for key, rule in tostring(rulesSrc):gmatch("([^=;]+)=(%a+)") do
                if rule == "Keep" or rule == "Skip" or rule == "Ask" then rulesCache[key:upper()] = rule end
            end
        end
        return rulesCache
    end
    local function WriteRules(map)
        local parts = {}
        for k, v in pairs(map) do parts[#parts + 1] = k .. "=" .. v end
        table.sort(parts)
        Cfg.SpinFamilyRules = table.concat(parts, ";")
        Save()
    end
    local function SetRule(name, rule)
        local copy = {}
        for k, v in pairs(Rules()) do copy[k] = v end
        copy[tostring(name):upper()] = rule
        WriteRules(copy)
    end
    local function RulesSummary()
        local keep, skip, ask = {}, {}, {}
        for key, rule in pairs(Rules()) do
            local list = (rule == "Keep" and keep) or (rule == "Skip" and skip) or ask
            list[#list + 1] = Pretty(key)
        end
        local function J(l)
            table.sort(l)
            return #l > 0 and table.concat(l, ", ") or "-"
        end
        return ("Always keep: %s | Never keep: %s | Always ask: %s"):format(J(keep), J(skip), J(ask))
    end
    local function Decide(name, rarity)
        local rule = Rules()[tostring(name):upper()]
        if rule == "Skip" then return "roll" end
        if rule == "Ask" then return "ask" end
        local stopRank = Cfg.SpinStopRarity == "Off" and math.huge or (RANK[Cfg.SpinStopRarity:upper()] or RANK.EPIC)
        local keeper = rule == "Keep" or (RANK[tostring(rarity):upper()] or 0) >= stopRank
        if not keeper then return "roll" end
        if Cfg.SpinOnKeep == "Store" then return "store" end
        if Cfg.SpinOnKeep == "Ask" then return "ask" end
        return "stop"
    end
    SH.Spin = SH.Spin or {}
    SH.Spin.Decide = Decide
    SH.Spin.SetRule = SetRule
    local SpinForm = CharTab:PageSection({
        Title = "🎰 Roll Family",
        Subtitle = "Auto roll your family."
    }):Form()
    local RuleForm = CharTab:PageSection({
        Title = "⚙️ Settings Roll",
        Subtitle = "Choose which families to keep."
    }):Form()
    local ShowForm = CharTab:PageSection({
        Title = "📜 Show Roll",
        Subtitle = "Your roll history."
    }):Form()
    local spinToggle
    local spinRow = SpinForm:Row()
    spinRow:Left():TitleStack({
        Title = "Auto Spin [ Lucky999+ ]",
        Subtitle = "Keeps pressing ROLL for you."
    })
    spinToggle = UiSync.Link(spinRow:Right():Toggle({
        Value = Cfg.AutoSpin,
        ValueChanged = function(self, value)
            Cfg.AutoSpin = value and true or false
            Save()
        end
    }), Cfg, "AutoSpin")
    local statusRow = SpinForm:Row()
    statusRow:Left():TitleStack({ Title = "Spin Status", Subtitle = "What Auto Spin is doing now." })
    local statusLabel = statusRow:Right():Label({ Text = "Off" })
    local lastStatus = nil
    local function Status(text)
        text = tostring(text)
        if text == lastStatus then return end
        lastStatus = text
        pcall(function() statusLabel.Text = text end)
    end
    local lastRow = SpinForm:Row()
    local lastStack = lastRow:Left():TitleStack({ Title = "Last Roll", Subtitle = "No rolls yet." })
    local lastLabel = lastRow:Right():Label({ Text = "-" })
    local stopRow = RuleForm:Row()
    stopRow:Left():TitleStack({
        Title = "Keep Rarity",
        Subtitle = "Keep this rarity or higher. Off = never stop for rarity."
    })
    local function StopIndex()
        return table.find(STOP_OPTIONS, Cfg.SpinStopRarity) or 2
    end
    local stopDrop = stopRow:Right():PullDownButton({
        Label = STOP_OPTIONS[StopIndex()],
        Options = STOP_OPTIONS,
        Value = StopIndex(),
        ValueChanged = function(self, index)
            if type(index) == "table" then index = index[1] end
            if type(index) ~= "number" or not STOP_OPTIONS[index] then return end
            Cfg.SpinStopRarity = STOP_OPTIONS[index]
            self.Label = STOP_OPTIONS[index]
            Save()
        end
    })
    UiSync.Add(function()
        local i = StopIndex()
        stopDrop.Value = i
        stopDrop.Label = STOP_OPTIONS[i]
    end)
    local keepRow = RuleForm:Row()
    keepRow:Left():TitleStack({
        Title = "When I Get A Keeper",
        Subtitle = "Stop, store it and keep rolling, or ask me."
    })
    local function KeepIndex()
        return table.find(KEEP_ACTIONS, Cfg.SpinOnKeep) or 1
    end
    local keepDrop = keepRow:Right():PullDownButton({
        Label = KEEP_LABELS[KeepIndex()],
        Options = KEEP_LABELS,
        Value = KeepIndex(),
        ValueChanged = function(self, index)
            if type(index) == "table" then index = index[1] end
            if type(index) ~= "number" or not KEEP_ACTIONS[index] then return end
            Cfg.SpinOnKeep = KEEP_ACTIONS[index]
            self.Label = KEEP_LABELS[index]
            Save()
        end
    })
    local rulePickers, syncingRules, rulesStack = {}, false, nil
    local function PickedIndexes(rule)
        local picked = {}
        for i, f in ipairs(FAMILY_LIST) do
            if Rules()[f.key] == rule then picked[#picked + 1] = i end
        end
        return picked
    end
    local function RefreshRulePickers()
        if rulesStack then pcall(function() rulesStack.Subtitle = RulesSummary() end) end
        syncingRules = true
        for rule, p in pairs(rulePickers) do
            if p.multi then pcall(function() p.btn.Value = PickedIndexes(rule) end) end
        end
        syncingRules = false
    end
    local function ApplyPicked(rule, indexes)
        local picked = {}
        for _, i in ipairs(SettingsStore.ValidIndexes(indexes, #FAMILY_LIST)) do picked[FAMILY_LIST[i].key] = true end
        local copy = {}
        for k, v in pairs(Rules()) do copy[k] = v end
        for _, f in ipairs(FAMILY_LIST) do
            if picked[f.key] then
                copy[f.key] = rule
            elseif copy[f.key] == rule then
                copy[f.key] = nil
            end
        end
        WriteRules(copy)
        RefreshRulePickers()
    end
    local function AddRulePicker(title, subtitle, rule)
        local row = RuleForm:Row()
        row:Left():TitleStack({ Title = title, Subtitle = subtitle })
        local ok, btn = pcall(function()
            return row:Right():PopUpButton({
                Options = FAMILY_LABELS,
                Maximum = #FAMILY_LABELS,
                Value = PickedIndexes(rule),
                ValueChanged = function(self, value)
                    if syncingRules then return end
                    ApplyPicked(rule, type(value) == "table" and value or { value })
                end
            })
        end)
        if ok and btn then
            rulePickers[rule] = { btn = btn, multi = true }
        else
            btn = row:Right():PullDownButton({
                Label = "Tap a family to add / remove",
                Options = FAMILY_LABELS,
                Value = 1,
                ValueChanged = function(self, index)
                    if syncingRules then return end
                    if type(index) == "table" then index = index[1] end
                    if type(index) ~= "number" or not FAMILY_LIST[index] then return end
                    local picked = PickedIndexes(rule)
                    local at = table.find(picked, index)
                    if at then table.remove(picked, at) else picked[#picked + 1] = index end
                    ApplyPicked(rule, picked)
                    self.Label = (at and "Removed " or "Added ") .. FAMILY_LABELS[index]
                end
            })
            rulePickers[rule] = { btn = btn, multi = false }
        end
        StyleDropdown(btn)
    end
    AddRulePicker("Always Keep Families",
        "Always keep these, even below Keep Rarity.", "Keep")
    AddRulePicker("Always Ask Families",
        "Ask me every time these roll.", "Ask")
    AddRulePicker("Never Keep Families",
        "Never keep these, even above Keep Rarity.", "Skip")
    local rulesRow = RuleForm:Row()
    rulesStack = rulesRow:Left():TitleStack({ Title = "Saved Rules", Subtitle = RulesSummary() })
    UiSync.Add(function()
        local i = KeepIndex()
        keepDrop.Value = i
        keepDrop.Label = KEEP_LABELS[i]
        RefreshRulePickers()
    end)
    local useDelayRow = SpinForm:Row()
    useDelayRow:Left():TitleStack({
        Title = "Use Spin Delay",
        Subtitle = "On: wait after every roll. Off: go on as soon as the result shows."
    })
    UiSync.Link(useDelayRow:Right():Toggle({
        Value = Cfg.SpinUseDelay ~= false,
        ValueChanged = function(self, value)
            Cfg.SpinUseDelay = value and true or false
            Save()
        end
    }), Cfg, "SpinUseDelay")
    local delayRow = SpinForm:Row()
    delayRow:Left():TitleStack({
        Title = "Spin Delay",
        Subtitle = "Seconds to wait after each roll (0.5 - 10)."
    })
    local delayRight = delayRow:Right()
    local delayLabel = delayRight:Label({ Text = Cfg.SpinDelay .. "s" })
    UiSync.Link(delayRight:Slider({
        Minimum = 0.5,
        Maximum = 10,
        Value = Cfg.SpinDelay,
        ValueChanged = function(self, value)
            Cfg.SpinDelay = math.clamp(math.floor((tonumber(value) or 3) * 2 + 0.5) / 2, 0.5, 10)
            pcall(function() delayLabel.Text = Cfg.SpinDelay .. "s" end)
            Save()
        end
    }), Cfg, "SpinDelay", function(_, want)
        pcall(function() delayLabel.Text = want .. "s" end)
    end)
    local history, stats = {}, { rolls = 0, byRarity = {} }
    SH.Spin.History = history
    local RARITY_ORDER = { "EXCLUSIVE", "SECRET", "MYTHIC", "LEGENDARY", "EPIC", "UNCOMMON", "RARE", "COMMON" }
    local RefreshList = function() end
    local showListRow = ShowForm:Row()
    showListRow:Left():TitleStack({
        Title = "Show Rolled Families",
        Subtitle = "Show or hide the list."
    })
    UiSync.Link(showListRow:Right():Toggle({
        Value = Cfg.SpinShowList == true,
        ValueChanged = function(self, value)
            Cfg.SpinShowList = value and true or false
            Save()
            RefreshList()
        end
    }), Cfg, "SpinShowList", function() RefreshList() end)
    local sizeRow = ShowForm:Row()
    sizeRow:Left():TitleStack({
        Title = "List Size",
        Subtitle = "Recent rolls to show (5 - 100)."
    })
    local sizeRight = sizeRow:Right()
    local sizeLabel = sizeRight:Label({ Text = tostring(Cfg.SpinListSize) })
    UiSync.Link(sizeRight:Slider({
        Minimum = 5,
        Maximum = 100,
        Value = Cfg.SpinListSize,
        ValueChanged = function(self, value)
            Cfg.SpinListSize = math.clamp(math.floor((tonumber(value) or 15) + 0.5), 5, 100)
            pcall(function() sizeLabel.Text = tostring(Cfg.SpinListSize) end)
            Save()
            RefreshList()
        end
    }), Cfg, "SpinListSize", function(_, want)
        pcall(function() sizeLabel.Text = tostring(want) end)
        RefreshList()
    end)
    local listRow = ShowForm:Row()
    local listStack = listRow:Left():TitleStack({ Title = "Rolled Families", Subtitle = "Nothing rolled yet." })
    local function ListText()
        local lines = {}
        for i = #history, math.max(1, #history - (math.clamp(tonumber(Cfg.SpinListSize) or 15, 5, 100) - 1)), -1 do
            local e = history[i]
            lines[#lines + 1] = (e.n == 0 and "Start" or ("#" .. e.n)) .. "   " .. e.name .. " (" .. e.rarity .. ")"
        end
        return #lines > 0 and table.concat(lines, "\n") or "Nothing rolled yet."
    end
    local function SummaryText()
        local parts = {}
        for _, r in ipairs(RARITY_ORDER) do
            local n = stats.byRarity[r]
            if n and n > 0 then parts[#parts + 1] = Cap(r) .. " " .. n end
        end
        return ("%d rolls%s"):format(stats.rolls, #parts > 0 and (" | " .. table.concat(parts, " · ")) or "")
    end
    RefreshList = function()
        pcall(function()
            if Cfg.SpinShowList then
                listStack.Subtitle = ListText()
            elseif #history > 0 then
                listStack.Subtitle = "Hidden | " .. SummaryText()
            else
                listStack.Subtitle = "Hidden. Turn on 'Show Rolled Families'."
            end
        end)
    end
    RefreshList()
    local function LogResult(name, rarity, isStart)
        if not isStart then
            stats.rolls += 1
            stats.byRarity[rarity] = (stats.byRarity[rarity] or 0) + 1
        end
        local stamp = ""
        pcall(function() stamp = os.date("%H:%M:%S") end)
        local entry = { n = isStart and 0 or stats.rolls, name = Pretty(name), rarity = Cap(rarity), time = stamp }
        history[#history + 1] = entry
        if #history > 300 then table.remove(history, 1) end
        SH.dbg(("[AotrUpdate5] Spin %s: %s (%s)"):format(isStart and "(start)" or ("#" .. entry.n), entry.name, entry.rarity))
        pcall(function()
            lastLabel.Text = entry.name .. " (" .. entry.rarity .. ")"
            lastStack.Subtitle = (isStart and "Current family when you started" or ("Roll #" .. entry.n)) .. " | " .. SummaryText()
        end)
        RefreshList()
    end
    local function HistoryText()
        local lines = {}
        for _, e in ipairs(history) do
            lines[#lines + 1] = ("%s  %s  %s (%s)"):format(e.n == 0 and "start" or ("#" .. e.n), e.time, e.name, e.rarity)
        end
        lines[#lines + 1] = "--- " .. SummaryText()
        return table.concat(lines, "\n")
    end
    function SH.Spin.PrintHistory() SH.dbg(HistoryText()) end
    function SH.Spin.Clear()
        for i = #history, 1, -1 do history[i] = nil end
        stats.rolls, stats.byRarity = 0, {}
        pcall(function() lastLabel.Text = "-" lastStack.Subtitle = "No rolls yet." end)
        RefreshList()
    end
    local copyRow = ShowForm:Row()
    copyRow:Left():TitleStack({ Title = "Spin Log", Subtitle = "Copy all rolls to the clipboard." })
    local copyBtn = copyRow:Right():Button({ Label = "Copy", Callback = function() end })
    BindButton(copyBtn, function()
        local text = HistoryText()
        pcall(function()
            if type(setclipboard) == "function" then setclipboard(text) elseif type(toclipboard) == "function" then toclipboard(text) end
        end)
        SH.dbg(text)
    end)
    local rollObj, rollScanAt = nil, 0
    local function FindRoll()
        if rollObj and rollObj.Parent and IsShown(rollObj) then return rollObj end
        rollObj = nil
        if os.clock() - rollScanAt < 1 then return nil end
        rollScanAt = os.clock()
        local n = 0
        for _, d in ipairs(PlayerGui:GetDescendants()) do
            n += 1
            if n % 800 == 0 then task.wait() end
            if IsTextObj(d) and TextOf(d):match("^ROLL") and IsShown(d) then
                rollObj = d
                return d
            end
        end
        return nil
    end
    local function RollCount(obj)
        return tonumber(TextOf(obj):match("%((%d+)%)"))
    end
    local famObj, famScanAt = nil, 0
    local function ParseFamily(o)
        local name, rarity = TextOf(o):match("^(.-)%s*%((%a+)%)$")
        if name and RANK[rarity] then return name, rarity end
        return nil
    end
    local function ReadFamily()
        if famObj and famObj.Parent and IsShown(famObj) then
            local n, r = ParseFamily(famObj)
            if n then return n, r end
        end
        famObj = nil
        if os.clock() - famScanAt < 0.4 then return nil end
        famScanAt = os.clock()
        local n = 0
        for _, d in ipairs(PlayerGui:GetDescendants()) do
            n += 1
            if n % 800 == 0 then task.wait() end
            if IsTextObj(d) and IsShown(d) then
                local name, rarity = ParseFamily(d)
                if name then
                    famObj = d
                    return name, rarity
                end
            end
        end
        return nil
    end
    local function WaitForNewFamily(nameBefore, rarityBefore, maxWait)
        local t0 = os.clock()
        local seenKey, seenAt = nil, 0
        while os.clock() - t0 < maxWait do
            if not Alive() or not Cfg.AutoSpin then return false end
            local n, r = ReadFamily()
            if n and (n ~= nameBefore or r ~= rarityBefore) then
                local key = n .. "|" .. r
                if key ~= seenKey then
                    seenKey, seenAt = key, os.clock()
                elseif os.clock() - seenAt >= 0.3 then
                    return true
                end
            else
                seenKey = nil
            end
            task.wait(0.05)
        end
        return false
    end
    task.spawn(function()
        local lastKey, scanAt, hinted = nil, 0, false
        while Alive() do
            task.wait(0.15)
            local n, r
            if famObj and famObj.Parent and IsShown(famObj) then
                n, r = ParseFamily(famObj)
            elseif IN_MENU and os.clock() - scanAt >= 3 then
                scanAt = os.clock()
                n, r = ReadFamily()
            end
            if n then
                hinted = false
                local key = n .. "|" .. r
                if key ~= lastKey then
                    lastKey = key
                    pcall(function()
                        lastLabel.Text = Pretty(n) .. " (" .. Cap(r) .. ")"
                        lastStack.Subtitle = "Live - your current family | " .. SummaryText()
                    end)
                end
            elseif not hinted and lastKey == nil and #history == 0 then
                hinted = true
                pcall(function() lastStack.Subtitle = "Open the Family page to see your current family live." end)
            end
        end
    end)
    local pressPref = 1
    local PRESS_METHODS = {
        { name = "Enter", run = function(btn)
            pcall(function() GuiService.SelectedObject = btn end)
            task.wait(0.1)
            pcall(function()
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                task.wait(0.05)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
            end)
            return true
        end },
        { name = "Activated signal", run = function(btn)
            if type(firesignal) ~= "function" then return false end
            return (pcall(firesignal, btn.Activated))
        end },
        { name = "Click signal", run = function(btn)
            if type(firesignal) ~= "function" then return false end
            return (pcall(firesignal, btn.MouseButton1Click))
        end },
        { name = "Mouse click", run = function(btn)
            local gui = btn:FindFirstAncestorOfClass("ScreenGui")
            local inset = (gui and gui.IgnoreGuiInset) and Vector2.zero or GuiService:GetGuiInset()
            local pos = btn.AbsolutePosition + btn.AbsoluteSize / 2 + inset
            return (pcall(function()
                VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, true, game, 0)
                task.wait(0.05)
                VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, false, game, 0)
            end))
        end },
        { name = "Gamepad A", run = function(btn)
            pcall(function() GuiService.SelectedObject = btn end)
            task.wait(0.1)
            return (pcall(function()
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.ButtonA, false, game)
                task.wait(0.05)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.ButtonA, false, game)
            end))
        end },
    }
    local function PressRoll(obj, attempt)
        local btn = ToButton(obj)
        if not btn then return nil end
        local count = #PRESS_METHODS
        for step = 0, count - 1 do
            local idx = ((pressPref - 1 + (attempt or 0) + step) % count) + 1
            local m = PRESS_METHODS[idx]
            if m.run(btn) then return idx, m.name end
        end
        return nil
    end
    local function WaitCountDrop(obj, before, maxWait, nameBefore, rarityBefore)
        local t0 = os.clock()
        while os.clock() - t0 < maxWait do
            if not (obj.Parent) then return true end
            local now = RollCount(obj)
            if now ~= nil and now < before then return true end
            if nameBefore and famObj and famObj.Parent then
                local n, r = ParseFamily(famObj)
                if n and (n ~= nameBefore or r ~= rarityBefore) then return true end
            end
            task.wait(0.1)
        end
        return false
    end
    local function PressButton(btn)
        pcall(function() GuiService.SelectedObject = btn end)
        task.wait(0.1)
        pcall(function()
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
            task.wait(0.05)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
        end)
    end
    local function FindShownButton(match)
        local n = 0
        for _, d in ipairs(PlayerGui:GetDescendants()) do
            n += 1
            if n % 800 == 0 then task.wait() end
            if d:IsA("GuiButton") and IsShown(d) and match(d) then return d end
        end
        return nil
    end
    local function FindBottomIcon()
        local cam = workspace.CurrentCamera
        local vp = cam and cam.ViewportSize or Vector2.new(1920, 1080)
        local cands, n = {}, 0
        for _, d in ipairs(PlayerGui:GetDescendants()) do
            n += 1
            if n % 800 == 0 then task.wait() end
            if d:IsA("GuiButton") and IsShown(d) then
                local s = d.AbsoluteSize
                if s.X >= 40 and s.X <= 220 and s.Y >= 40 and s.Y <= 220 and math.abs(s.X / s.Y - 1) <= 0.2 then
                    local c = d.AbsolutePosition + s / 2
                    if c.X < vp.X * 0.3 then cands[#cands + 1] = { btn = d, y = c.Y } end
                end
            end
        end
        if #cands < 4 then return nil end
        table.sort(cands, function(a, b) return a.y > b.y end)
        return cands[1].btn
    end
    local function ClickableFor(o)
        if o:IsA("GuiButton") then return o end
        local cur = o.Parent
        for _ = 1, 3 do
            if not cur or cur == PlayerGui then break end
            if cur:IsA("GuiButton") then return cur end
            cur = cur.Parent
        end
        local c = o.AbsolutePosition + o.AbsoluteSize / 2
        local best, bestArea = nil, math.huge
        for _, d in ipairs(PlayerGui:GetDescendants()) do
            if d:IsA("GuiButton") and IsShown(d) then
                local pos, size = d.AbsolutePosition, d.AbsoluteSize
                if c.X >= pos.X and c.X <= pos.X + size.X and c.Y >= pos.Y and c.Y <= pos.Y + size.Y then
                    local area = size.X * size.Y
                    if area < bestArea then best, bestArea = d, area end
                end
            end
        end
        return best
    end
    local function FindMainMenuCustomize()
        local custObj, hasPlay, hasCodes = nil, false, false
        local n = 0
        for _, d in ipairs(PlayerGui:GetDescendants()) do
            n += 1
            if n % 800 == 0 then task.wait() end
            if IsTextObj(d) and IsShown(d) then
                local t = TextOf(d)
                if t == "CUSTOMIZATION" then custObj = d
                elseif t == "PLAY" then hasPlay = true
                elseif t == "CODES" then hasCodes = true end
            end
        end
        if custObj and hasPlay and hasCodes then return ClickableFor(custObj) end
        return nil
    end
    local navAt, navTries = 0, 0
    local function OpenFamilyPage()
        if os.clock() - navAt < 2.5 then return end
        navAt = os.clock()
        if navTries >= 8 then
            Status("Couldn't open the Family page - open it once yourself")
            return
        end
        local famBtn = FindShownButton(function(d)
            if not d.Name:lower():find("family", 1, true) then return false end
            local t = d:IsA("TextButton") and TextOf(d) or ""
            return not t:find("X2", 1, true) and t ~= "BACK"
        end)
        if famBtn then
            navTries += 1
            Status("Opening the Family page...")
            PressButton(famBtn)
            return
        end
        local iconBtn = FindBottomIcon()
        if iconBtn then
            navTries += 1
            Status("Opening the Family page (F icon)...")
            PressButton(iconBtn)
            return
        end
        local custBtn = FindMainMenuCustomize()
        if custBtn then
            navTries += 1
            Status("Opening Customization...")
            PressButton(custBtn)
            return
        end
        Status("Open the Family page (menu buttons not found)")
    end
    SH.Spin = SH.Spin or {}
    function SH.Spin.DumpButtons()
        local lines = { "=== visible buttons (path | class | text | image) ===" }
        for _, d in ipairs(PlayerGui:GetDescendants()) do
            if d:IsA("GuiButton") and IsShown(d) then
                local path = d:GetFullName():gsub("^Players%.[^%.]+%.PlayerGui%.", "")
                local t = d:IsA("TextButton") and (d.Text or "") or ""
                local img = d:IsA("ImageButton") and tostring(d.Image) or ""
                lines[#lines + 1] = path .. " | " .. d.ClassName .. " | " .. t .. " | " .. img
            end
        end
        local text = table.concat(lines, "\n")
        pcall(function()
            if type(setclipboard) == "function" then setclipboard(text) elseif type(toclipboard) == "function" then toclipboard(text) end
        end)
        pcall(function() if type(writefile) == "function" then writefile("AotrUpdate5_buttons.txt", text) end end)
        SH.dbg(text)
        return #lines - 1
    end
    local function Notify(text)
        pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Aotr:Update[5] - Auto Spin", Text = text, Duration = 8,
            })
        end)
    end
    local getRemote = nil
    local function InvokeGet(...)
        if not getRemote or not getRemote.Parent then getRemote = GetLobbyRemote() end
        if not getRemote then return false, "remote not found" end
        local remote, args = getRemote, table.pack(...)
        local done, ok, res = false, false, nil
        task.spawn(function()
            ok, res = pcall(function() return remote:InvokeServer(table.unpack(args, 1, args.n)) end)
            done = true
        end)
        local t0 = os.clock()
        while not done and os.clock() - t0 < 8 do task.wait(0.05) end
        if not done then return false, "timeout" end
        return ok, res
    end
    local function StoreCurrent(name, rarity)
        Status(("Storing %s..."):format(Pretty(name)))
        local ok, res = InvokeGet("Family", "Store")
        SH.dbg("[AotrUpdate5] Auto Spin: Store ->", ok, res)
        if not ok then return false, tostring(res) end
        local t0 = os.clock()
        while os.clock() - t0 < 4 do
            task.wait(0.4)
            if not Alive() or not Cfg.AutoSpin then return false, "stopped" end
            local n2, r2 = ReadFamily()
            if n2 == nil or n2 ~= name or r2 ~= rarity then return true end
        end
        return false, "your family didn't change after Store"
    end
    local function AskUser(name, rarity)
        local gui = Instance.new("ScreenGui")
        gui.Name = "AotrUpdate5SpinAsk"
        gui.ResetOnSpawn = false
        gui.DisplayOrder = 10000
        gui.IgnoreGuiInset = true
        local parented = false
        for _, getParent in ipairs({
            function() return type(gethui) == "function" and gethui() or nil end,
            function() return game:GetService("CoreGui") end,
            function() return PlayerGui end,
        }) do
            local okP, parent = pcall(getParent)
            if okP and parent and pcall(function() gui.Parent = parent end) and gui.Parent then
                parented = true
                break
            end
        end
        if not parented then gui:Destroy() return nil end
        local frame = Instance.new("Frame")
        frame.AnchorPoint = Vector2.new(0.5, 0.5)
        frame.Position = UDim2.fromScale(0.5, 0.35)
        frame.Size = UDim2.fromOffset(400, 200)
        frame.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
        frame.Parent = gui
        local corner = Instance.new("UICorner") corner.CornerRadius = UDim.new(0, 12) corner.Parent = frame
        local stroke = Instance.new("UIStroke") stroke.Color = Color3.fromRGB(70, 70, 80) stroke.Thickness = 1 stroke.Parent = frame
        local function Label(text, y, h, size, color, bold)
            local l = Instance.new("TextLabel")
            l.BackgroundTransparency = 1
            l.Position = UDim2.fromOffset(16, y)
            l.Size = UDim2.new(1, -32, 0, h)
            l.Font = bold and Enum.Font.GothamBold or Enum.Font.Gotham
            l.TextSize = size
            l.TextColor3 = color
            l.Text = text
            l.TextXAlignment = Enum.TextXAlignment.Left
            l.Parent = frame
            return l
        end
        Label("You rolled a family", 14, 20, 14, Color3.fromRGB(160, 160, 170), false)
        Label(Pretty(name) .. "  -  " .. Cap(rarity), 36, 34, 24, Color3.fromRGB(255, 255, 255), true)
        Label("Do you want to keep it?", 76, 20, 14, Color3.fromRGB(200, 200, 210), false)
        local choice = nil
        local function Button(text, x, w, color, value)
            local b = Instance.new("TextButton")
            b.Position = UDim2.fromOffset(x, 118)
            b.Size = UDim2.fromOffset(w, 52)
            b.BackgroundColor3 = color
            b.AutoButtonColor = true
            b.Font = Enum.Font.GothamBold
            b.TextSize = 13
            b.TextColor3 = Color3.fromRGB(255, 255, 255)
            b.TextWrapped = true
            b.Text = text
            b.Parent = frame
            local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0, 8) c.Parent = b
            b.MouseButton1Click:Connect(function() choice = value end)
        end
        Button("Keep it and stop", 16, 116, Color3.fromRGB(46, 125, 80), "stop")
        Button("Store it and keep spinning", 142, 116, Color3.fromRGB(45, 95, 170), "store")
        Button("Discard and roll again", 268, 116, Color3.fromRGB(150, 60, 60), "roll")
        while choice == nil and Alive() and Cfg.AutoSpin do task.wait(0.1) end
        gui:Destroy()
        return choice
    end
    local function StopSpin(message)
        Cfg.AutoSpin = false
        Save()
        pcall(function() spinToggle.Value = false end)
        Status(message)
        SH.dbg("[AotrUpdate5] Auto Spin:", message)
        pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Aotr:Update[5] - Auto Spin", Text = message, Duration = 10,
            })
        end)
    end
    task.spawn(function()
        local fails = 0
        local pendingLog, startLogged = false, false
        local emptySlotOk, storesSinceRoll = false, 0
        while Alive() do
            task.wait(0.4)
            if not Cfg.AutoSpin then
                fails, pendingLog, startLogged, emptySlotOk, storesSinceRoll = 0, false, false, false, 0
                Status("Off")
            else
                local roll = FindRoll()
                if not roll then
                    OpenFamilyPage()
                else
                    navTries = 0
                    local rolls = RollCount(roll)
                    local name, rarity = ReadFamily()
                    if name then
                        if not startLogged then
                            startLogged = true
                            LogResult(name, rarity, true)
                        elseif pendingLog then
                            pendingLog = false
                            LogResult(name, rarity, false)
                        end
                    end
                    local canRoll = false
                    if not name then
                        if emptySlotOk then
                            canRoll = true
                        else
                            Status("Can't read your current family yet...")
                        end
                    else
                        emptySlotOk = false
                        local label = ("%s (%s)"):format(Pretty(name), Cap(rarity))
                        local action = Decide(name, rarity)
                        if action == "ask" then
                            Status("Waiting for your choice: " .. label)
                            Notify("You rolled " .. label .. " - keep it? Answer in the box on screen.")
                            local choice = AskUser(name, rarity)
                            action = choice or "wait"
                            if choice == nil and Cfg.AutoSpin then
                                StopSpin("Stopped: couldn't show the question box, so you keep " .. label)
                                action = "wait"
                            end
                        end
                        if action == "stop" then
                            StopSpin("Stopped: you have " .. label)
                        elseif action == "store" then
                            if storesSinceRoll >= 2 then
                                StopSpin("Stopped: Store doesn't clear your family slot, so you keep " .. label)
                            else
                                local ok, why = StoreCurrent(name, rarity)
                                if ok then
                                    storesSinceRoll += 1
                                    emptySlotOk = true
                                    SH.dbg("[AotrUpdate5] Auto Spin: stored " .. label)
                                    Notify("Stored " .. label)
                                elseif why ~= "stopped" then
                                    StopSpin(("Stopped: couldn't store %s (%s)"):format(label, why))
                                end
                            end
                        elseif action == "roll" then
                            canRoll = true
                        end
                    end
                    if canRoll then
                        if rolls ~= nil and rolls <= 0 then
                            StopSpin("Stopped: no rolls left")
                        else
                            Status(("Rolling... (%s left)"):format(rolls ~= nil and tostring(rolls) or "?"))
                            local before = rolls
                            local idx, used = PressRoll(roll, fails)
                            local registered = true
                            if idx == nil then
                                registered, used = false, "no usable press method"
                            elseif before ~= nil then
                                registered = WaitCountDrop(roll, before, 4, name, rarity)
                            end
                            if not registered then
                                fails += 1
                                SH.dbg(("[AotrUpdate5] Auto Spin: roll didn't register (%d/%d) via %s"):format(fails, #PRESS_METHODS, tostring(used)))
                                Status(("Roll didn't register (%d/%d) via %s"):format(fails, #PRESS_METHODS, tostring(used)))
                                if fails >= #PRESS_METHODS then StopSpin("Stopped: ROLL button doesn't respond (tried every press method)") end
                            else
                                if idx then pressPref = idx end
                                fails = 0
                                pendingLog = true
                                emptySlotOk, storesSinceRoll = false, 0
                                if Cfg.SpinUseDelay ~= false then
                                    for _ = 1, math.floor(Cfg.SpinDelay * 10) do
                                        if not Alive() or not Cfg.AutoSpin then break end
                                        task.wait(0.1)
                                    end
                                else
                                    WaitForNewFamily(name, rarity, 2.5)
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
end
local ReplicatedStorageSvc = game:GetService("ReplicatedStorage")
local StatusCategory = Cascade.Components.Section(Window, {
    Title = "Status",
    Disclosure = false
})
local AccountTab = StatusCategory:Tab({
    Title = "Account",
    Icon = Icon("bookmarkFill", "bookmark"),
    Selected = true
})
local OverviewTab = AccountTab
local OverviewSection = OverviewTab:PageSection({
    Title = "📊 Account Overview",
    Subtitle = "Read from your player data. N/A = this value was not found."
})
local OverviewForm = OverviewSection:Form()
local function FindGui(path)
    local cur = PlayerGui
    for seg in path:gmatch("[^%.]+") do
        cur = cur and cur:FindFirstChild(seg)
        if not cur then return nil end
    end
    return cur
end
local function CountShards()
    local items = FindGui("Interface.Inventory.Main.Holder.Items")
    if not items then return nil end
    local total = 0
    for _, c in ipairs(items:GetChildren()) do
        if c.Name:lower():find("shard", 1, true) then
            local q = 1
            local label = c:FindFirstChild("Quantity", true)
            if label and (label:IsA("TextLabel") or label:IsA("TextButton")) then
                q = tonumber((label.Text:gsub("[^%d]", ""))) or 1
            end
            total += q
        end
    end
    return total
end
local function CurrentFamily()
    local items = FindGui("Interface.Inventory.Main.Holder.Items")
    if not items then return nil end
    for _, c in ipairs(items:GetChildren()) do
        local id, name = c.Name:match("^(%d+)%s*%-%s*(.+)$")
        if id and tonumber(id) % 100 == 2 then
            local main = c:FindFirstChild("Main")
            local eq = main and main:FindFirstChild("Equipped")
            if eq and eq:IsA("GuiObject") and eq.Visible then
                local check = eq:FindFirstChild("Checkmark")
                local on = true
                if check and check:IsA("ImageLabel") and check.ImageTransparency >= 1 then on = false end
                if on then return name end
            end
        end
    end
    return "None"
end
local function AttrTrue(v)
    if type(v) == "boolean" then return v end
    if type(v) == "number" then return v ~= 0 end
    if type(v) == "string" then
        local x = v:lower()
        return x == "true" or x == "yes" or x == "1"
    end
    return false
end
local hiddenLabelCache, hiddenLabelAt = nil, 0
local function FindWarningLabel()
    if os.clock() - hiddenLabelAt < 15 then return hiddenLabelCache end
    hiddenLabelAt = os.clock()
    hiddenLabelCache = false
    local n = 0
    for _, d in ipairs(PlayerGui:GetDescendants()) do
        n += 1
        if n % 600 == 0 then task.wait() end
        if d:IsA("TextLabel") or d:IsA("TextButton") then
            local t = (d.Text or ""):lower()
            if t:find("exploiter", 1, true) or t:find("shadow ban", 1, true) or t:find("shadowban", 1, true) then
                hiddenLabelCache = d:GetFullName():gsub("^Players%.[^%.]+%.PlayerGui%.", "")
                break
            end
        end
    end
    return hiddenLabelCache
end
local function ShadowStatus()
    if FindWarningLabel() then return "✅" end
    if AttrTrue(LocalPlayer:GetAttribute("Exploiter")) or AttrTrue(LocalPlayer:GetAttribute("Blacklisted")) then
        return "✅"
    end
    return "❌"
end
local function FlagCompare()
    local others, flagged = 0, 0
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            others += 1
            if AttrTrue(plr:GetAttribute("Exploiter")) or AttrTrue(plr:GetAttribute("Blacklisted")) then
                flagged += 1
            end
        end
    end
    local mine = (AttrTrue(LocalPlayer:GetAttribute("Exploiter")) or AttrTrue(LocalPlayer:GetAttribute("Blacklisted"))) and "flagged" or "clear"
    return ("You: %s | Others flagged: %d/%d"):format(mine, flagged, others)
end
local FIELDS = {
    { key = "ShadowBan", title = "🛠️ Shadow Ban", raw = true, aliases = {}, calc = ShadowStatus,
      colors = { ["✅"] = Color3.fromRGB(80, 200, 120), ["❌"] = Color3.fromRGB(235, 87, 87) } },
    { key = "FlagCompare", title = "🔍 Flag Compare", raw = true, aliases = {}, calc = FlagCompare },
    { key = "Blacklisted", title = "🚫 Blacklisted", flag = true, aliases = { "blacklisted" } },
    { key = "Exploiter", title = "⚠️ Exploiter Flag", flag = true, aliases = { "exploiter" } },
    { key = "Level",     title = "▶️ Level",    aliases = { "level", "lvl", "playerlevel" } },
    { key = "XP",        title = "📈 XP",       aliases = {}, strip = "^XP:%s*",
      gui = "Interface.Gear_Up.XP.Percentage" },
    { key = "Prestige",  title = "🔺 Prestige", aliases = { "prestige", "prestigelevel" } },
    { key = "Gold",      title = "💰 Gold",     aliases = { "gold", "coins", "money" },
      gui = "Interface.Topbar.Main.Currencies.Gold.Amount" },
    { key = "Gems",      title = "💎 Gems",     aliases = { "gems", "gem" },
      gui = "Interface.Topbar.Main.Currencies.Gems.Amount" },
    { key = "Family",    title = "⚡ Family",   aliases = { "family", "familyname", "clan" }, calc = CurrentFamily },
    { key = "Title",     title = "🏷️ Title",    aliases = { "title" }, pretty = true },
    { key = "Shards",    title = "✨ Shards",   aliases = { "shards", "shard" }, calc = CountShards },
}
for _, f in ipairs(FIELDS) do
    local row = OverviewForm:Row()
    row:Left():TitleStack({ Title = f.title })
    f.label = row:Right():Label({ Text = "..." })
    f.last = nil
end
local function NormName(s)
    return (tostring(s):lower():gsub("[^%w]", ""))
end
local function Fmt(v)
    if type(v) == "number" then
        if v ~= math.floor(v) then return string.format("%.2f", v) end
        local s = tostring(math.floor(v))
        local neg = s:sub(1, 1) == "-"
        if neg then s = s:sub(2) end
        s = s:reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
        return (neg and "-" or "") .. s
    end
    return tostring(v)
end
local function Truthy(v)
    if type(v) == "boolean" then return v end
    if type(v) == "number" then return v ~= 0 end
    if type(v) == "string" then
        local s = v:lower()
        return s == "true" or s == "yes" or s == "1"
    end
    return false
end
local dataRoots = { LocalPlayer }
local lastRootScan = 0
local function ScanRoots(force)
    if not force and os.clock() - lastRootScan < 15 then return end
    lastRootScan = os.clock()
    local roots = { LocalPlayer }
    local uid = tostring(LocalPlayer.UserId)
    local n = 0
    for _, d in ipairs(ReplicatedStorageSvc:GetDescendants()) do
        n += 1
        if n % 500 == 0 then task.wait() end
        if d.Name == LocalPlayer.Name or d.Name == uid then
            table.insert(roots, d)
        end
    end
    dataRoots = roots
end
local SKIP_NAMES = { PlayerGui = true, PlayerScripts = true }
local function CollectEntries()
    local entries = {}
    local function keep(v)
        local t = type(v)
        return t == "number" or t == "string" or t == "boolean"
    end
    local function walk(inst, depth)
        pcall(function()
            for k, v in pairs(inst:GetAttributes()) do
                if keep(v) then
                    entries[#entries + 1] = { name = k, value = v, path = inst:GetFullName() .. " @" .. k }
                end
            end
            if inst:IsA("ValueBase") then
                local ok, v = pcall(function() return inst.Value end)
                if ok and keep(v) then
                    entries[#entries + 1] = { name = inst.Name, value = v, path = inst:GetFullName() }
                end
            end
        end)
        if depth >= 6 then return end
        for _, c in ipairs(inst:GetChildren()) do
            if not SKIP_NAMES[c.Name] then walk(c, depth + 1) end
        end
    end
    for _, root in ipairs(dataRoots) do
        if root and root.Parent then walk(root, 0) end
    end
    return entries
end
local function IsExcludedPath(path)
    return path:find("%.Boosts") ~= nil or path:find("%.Gamepasses") ~= nil
end
local function LookupField(entries, field)
    for _, alias in ipairs(field.aliases) do
        for _, e in ipairs(entries) do
            if NormName(e.name) == alias and not IsExcludedPath(e.path) then
                return e.value
            end
        end
    end
    return nil
end
local function ReadGui(path)
    local cur = FindGui(path)
    if cur and (cur:IsA("TextLabel") or cur:IsA("TextButton")) then
        local t = (cur.Text or ""):gsub("<[^>]->", "")
        t = t:gsub("^%s+", ""):gsub("%s+$", "")
        if t ~= "" then return t end
    end
    return nil
end
local function LabelObject(label)
    local inst = label and label.__instance
    if not inst then return nil end
    if inst:IsA("TextLabel") then return inst end
    return inst:FindFirstChildWhichIsA("TextLabel", true)
end
local lastEntries = {}
local function RefreshOverview()
    ScanRoots(false)
    local entries = CollectEntries()
    lastEntries = entries
    for _, f in ipairs(FIELDS) do
        local v
        if f.calc then
            local okC, r = pcall(f.calc)
            if okC then v = r end
        end
        if v == nil and f.gui then v = ReadGui(f.gui) end
        if v == nil then v = LookupField(entries, f) end
        local text
        if v == nil then
            text = "N/A"
        elseif f.raw then
            text = tostring(v)
        elseif f.flag then
            text = Truthy(v) and "⚠️ Yes" or "✅ No"
        elseif f.strip then
            text = (tostring(v):gsub(f.strip, ""))
        elseif f.pretty then
            text = (tostring(v):gsub("_", " "))
        else
            text = Fmt(v)
        end
        if text ~= f.last then
            f.last = text
            pcall(function() f.label.Text = text end)
            if f.colors and f.colors[text] then
                pcall(function()
                    local obj = LabelObject(f.label)
                    if obj then obj.TextColor3 = f.colors[text] end
                end)
            end
        end
    end
end
task.spawn(function()
    while Alive() do
        pcall(RefreshOverview)
        for _ = 1, 12 do
            if not Alive() then return end
            task.wait(0.25)
        end
    end
end)
task.spawn(function()
    while Alive() do
        if IN_MENU and Cfg.AutoSelect and not selecting then
            if SelectCharacter() then
                for _ = 1, 16 do
                    if not Alive() then return end
                    task.wait(0.25)
                end
            end
        end
        task.wait(1)
    end
end)
task.spawn(function()
    local lastFire = nil
    local slotVisible, slotCheckAt = false, 0
    while Alive() do
        if not IN_MENU then
            lastFire = nil
            SetCountdown("N/A")
        elseif not Cfg.AutoJoin then
            lastFire = nil
            SetCountdown("Off")
        else
            local now = os.clock()
            if Cfg.AutoSelect then
                if now >= slotCheckAt then
                    slotVisible = SlotScreenVisible()
                    slotCheckAt = now + 1
                end
            else
                slotVisible = false
            end
            if slotVisible then
                lastFire = nil
                SetCountdown("Waiting for character select")
            elseif SH.Coord.Blocker(100) then
                lastFire = nil
                SetCountdown("Waiting: " .. tostring(SH.Coord.last))
            else
                local delay = ClampDelay(Cfg.JoinDelay)
                if not lastFire then lastFire = now end
                local remaining = lastFire + delay - now
                if remaining <= 0 then
                    SetCountdown("Joining now...")
                    lastFire = os.clock()
                    JoinLobby()
                else
                    SetCountdown(("Next join in %ds"):format(math.ceil(remaining)))
                end
            end
        end
        task.wait(0.25)
    end
end)
local MainCategory = Cascade.Components.Section(Window, {
    Title = "In-Game",
    Disclosure = false
})
local FarmTab = MainCategory:Tab({
    Title = "Auto Farm",
    Icon = Icon("boltFill"),
})
local Farm = {}
SH.Farm = Farm
function Farm.OnRetryAmount(amount) end
function Farm.Fire(name, ...)
    local fn = Farm[name]
    if type(fn) == "function" then
        local ok, err = pcall(fn, ...)
        if not ok then SH.dbg("[AotrUpdate5] Farm." .. tostring(name) .. ":", err) end
    end
end
do
    if Cfg.AutoLeave and Cfg.AutoLeaveWhenRetryComplete then Cfg.AutoLeave = false end
    local MainForm = FarmTab:PageSection({
        Title = "⚔️ Auto Farm",
        Subtitle = "The essentials - turn these on and go",
    }):Form()
    local ReloadForm = FarmTab:PageSection({
        Title = "🔄 Reload & Refill",
        Subtitle = "Reload blades and refill supplies automatically",
    }):Form()
    local OptionsForm = FarmTab:PageSection({
        Title = "⚙️ After the Match",
        Subtitle = "What to do when a mission ends",
    }):Form()
    local function AddFarmToggle(form, title, subtitle, key, handler)
        local row = form:Row()
        row:Left():TitleStack({ Title = title, Subtitle = subtitle })
        Farm.Toggles = Farm.Toggles or {}
        Farm.Toggles[key] = UiSync.Link(row:Right():Toggle({
            Value = Cfg[key],
            ValueChanged = function(self, value)
                Cfg[key] = value and true or false
                Save()
                Farm.Fire(handler, Cfg[key])
            end
        }), Cfg, key)
    end
    local function AddFarmSlider(form, titleFor, subtitle, key, handler)
        local range = FARM_RANGES[key]
        local row = form:Row()
        local stack = row:Left():TitleStack({ Title = titleFor(Cfg[key]), Subtitle = subtitle })
        UiSync.Link(row:Right():Slider({
            Minimum = range[1],
            Maximum = range[2],
            Value = Cfg[key],
            ValueChanged = function(self, value)
                local v = math.clamp(math.floor(value + 0.5), range[1], range[2])
                Cfg[key] = v
                pcall(function() stack.Title = titleFor(v) end)
                Save()
                Farm.Fire(handler, v)
            end
        }), Cfg, key, function(_, want)
            pcall(function() stack.Title = titleFor(want) end)
        end)
    end
    local function AddCounterRow(form, titleFor, refreshHandler)
        local row = form:Row()
        local stack = row:Left():TitleStack({ Title = titleFor(0) })
        local run
        local btn = row:Right():Button({
            Label = "Refresh",
            Callback = function() if run then run() end end
        })
        run = BindButton(btn, function() Farm.Fire(refreshHandler) end)
        return function(n)
            pcall(function() stack.Title = titleFor(n) end)
        end
    end
    local FARM_MODES = { "Smart", "Blades", "Thunder Spears" }
    local farmDrop, farmToggle, farmSyncing = nil, nil, false
    local function FarmEnabled() return Cfg.AutoFarmSmart or Cfg.AutoFarm or Cfg.AutoFarmThunder end
    local function FarmModeIdx()
        if Cfg.AutoFarmSmart then return 1 end
        if Cfg.AutoFarm then return 2 end
        if Cfg.AutoFarmThunder then return 3 end
        return table.find(FARM_MODES, Cfg.FarmMode) or 1
    end
    local function RefreshFarmUi()
        local idx = FarmModeIdx()
        if FarmEnabled() then Cfg.FarmMode = FARM_MODES[idx] end
        farmSyncing = true
        if farmToggle then pcall(function() farmToggle.Value = FarmEnabled() and true or false end) end
        if farmDrop then pcall(function() farmDrop.Value = idx farmDrop.Label = FARM_MODES[idx] end) end
        farmSyncing = false
    end
    local function ApplyFarmMode(idx)
        Cfg.AutoFarmSmart = (idx == 1)
        if idx == 0 then
            Cfg.AutoFarm, Cfg.AutoFarmThunder = false, false
        elseif idx == 2 then
            Cfg.AutoFarm, Cfg.AutoFarmThunder = true, false
        elseif idx == 3 then
            Cfg.AutoFarm, Cfg.AutoFarmThunder = false, true
        end
        if idx > 0 then Cfg.FarmMode = FARM_MODES[idx] end
        Save()
        if idx == 0 then
            Farm.Fire("OnAutoFarm", false)
            Farm.Fire("OnAutoFarmThunder", false)
        elseif Cfg.AutoFarm then
            Farm.Fire("OnAutoFarm", true)
        elseif Cfg.AutoFarmThunder then
            Farm.Fire("OnAutoFarmThunder", true)
        end
        Farm.Fire("OnAutoFarmSmart", Cfg.AutoFarmSmart)
        RefreshFarmUi()
    end
    do
        local trow = MainForm:Row()
        trow:Left():TitleStack({
            Title = "Enable [ Auto Farm ]",
            Subtitle = "Turn Auto Farm on or off.",
        })
        farmToggle = trow:Right():Toggle({
            Value = FarmEnabled() and true or false,
            ValueChanged = function(self, value)
                if farmSyncing then return end
                local want = value and true or false
                if want == (FarmEnabled() and true or false) then return end
                ApplyFarmMode(want and (table.find(FARM_MODES, Cfg.FarmMode) or 1) or 0)
            end
        })
        local row = MainForm:Row()
        row:Left():TitleStack({
            Title = "Select Equip",
            Subtitle = "Blades, Thunder Spears, or Smart (switches automatically).",
        })
        farmDrop = row:Right():PullDownButton({
            Label = FARM_MODES[FarmModeIdx()],
            Options = FARM_MODES,
            Value = FarmModeIdx(),
            ValueChanged = function(self, index)
                if farmSyncing then return end
                if type(index) == "table" then index = index[1] end
                if type(index) ~= "number" or not FARM_MODES[index] then return end
                self.Label = FARM_MODES[index]
                if FarmEnabled() then
                    if index ~= FarmModeIdx() then ApplyFarmMode(index) end
                else
                    Cfg.FarmMode = FARM_MODES[index]
                    Save()
                end
            end
        })
        pcall(StyleDropdown, farmDrop)
        local statusRow = MainForm:Row()
        statusRow:Left():TitleStack({ Title = "Status" })
        local statusLabel = statusRow:Right():Label({ Text = "Off" })
        local STATUS_YELLOW = Color3.fromRGB(255, 214, 10)
        local STATUS_GREEN = Color3.fromRGB(48, 209, 88)
        local statusDefault = nil
        local lastStatus, lastColorKey = nil, nil
        local function SetStatusColor(key) -- key: "yellow" | "green" | "default"
            if key == lastColorKey then return end
            local ok = pcall(function()
                local o = LabelObject(statusLabel)
                if not o then error("label not ready") end
                if not statusDefault then statusDefault = o.TextColor3 end
                if key == "yellow" then o.TextColor3 = STATUS_YELLOW
                elseif key == "green" then o.TextColor3 = STATUS_GREEN
                else o.TextColor3 = statusDefault end
            end)
            if ok then lastColorKey = key end
        end
        local seen, kills = {}, 0
        local lastSpawn, wasOn = nil, false
        local function IsLive(t)
            local hum = t and t.Parent and t:FindFirstChildOfClass("Humanoid")
            return hum ~= nil and hum.Health > 0
        end
        local function CountTitans()
            local folder = workspace:FindFirstChild("Titans")
            local left = 0
            if folder then
                for _, t in ipairs(folder:GetChildren()) do
                    if t:IsA("Model") and IsLive(t) then
                        left += 1
                        seen[t] = true
                    end
                end
            end
            for t in pairs(seen) do
                if not IsLive(t) then
                    seen[t] = nil
                    kills += 1
                end
            end
            return left
        end
        task.spawn(function()
            while Alive() do
                task.wait(0.3)
                local text, color = "Off", "default"
                pcall(function()
                    local on = FarmEnabled() or Cfg.AutoClearWave
                    if on and not wasOn then
                        kills = 0
                        seen = {}
                    end
                    wasOn = on
                    if not on then return end
                    if not Farm.CanUseHere() then text = "Not in a match" return end
                    if Farm.CharSpawnAt ~= lastSpawn then
                        lastSpawn = Farm.CharSpawnAt
                        kills = 0
                        seen = {}
                    end
                    if Farm.CompleteScreenShown and Farm.CompleteScreenShown() then
                        text = ("Completed | Killed %d"):format(kills)
                        color = "green"
                        return
                    end
                    local left = CountTitans()
                    local action
                    if Farm.LootBusy then action = "Looting crate"
                    elseif Farm.NpcBusy then action = Farm.NpcCurrent and ("NPC visit: " .. tostring(Farm.NpcCurrent)) or "NPC visit"
                    elseif Farm.Refilling then action = "Refilling"
                    elseif Farm.FailSafeActive then action = "Fail safe"
                    elseif Farm.BladesBusy and Farm.BladesBusy() then action = "Reloading"
                    elseif Cfg.WaitForBoss and Farm.BossBlock and Farm.BossBlock() then action = tostring(Farm.BossStatus or "Waiting for boss")
                    elseif Cfg.AutoClearWave then action = tostring(Farm.ClearWaveStatus or "Clearing")
                    else action = tostring((Farm.Blades and Farm.Blades.Status) or "Farming") end
                    text = ("%s | Left %d | Killed %d"):format(action, left, kills)
                    color = "yellow"
                end)
                if text ~= lastStatus then
                    lastStatus = text
                    pcall(function() statusLabel.Text = text end)
                    lastColorKey = nil
                end
                SetStatusColor(color)
            end
        end)
        UiSync.Add(RefreshFarmUi)
    end
    do
        local function Proxy(key, handler)
            Farm.Toggles = Farm.Toggles or {}
            Farm.Toggles[key] = setmetatable({}, {
                __index = function(_, k) if k == "Value" then return Cfg[key] end end,
                __newindex = function(_, k, v)
                    if k ~= "Value" then return end
                    Cfg[key] = v and true or false
                    Save()
                    RefreshFarmUi()
                    if handler then Farm.Fire(handler, Cfg[key]) end
                end,
            })
        end
        Proxy("AutoFarm", "OnAutoFarm")
        Proxy("AutoFarmThunder", "OnAutoFarmThunder")
        Proxy("AutoFarmSmart", "OnAutoFarmSmart")
    end
    AddFarmToggle(MainForm, "Bypass Farm (No Shadow Ban)",
        "Auto-jumps while farming so your gas gets used.",
        "SafeFarm", "OnSafeFarm")
    AddFarmToggle(ReloadForm, "Auto Reload", "Reloads your blades when they run out.", "AutoReload", "OnAutoReload")
    do
        local REFILL_OPTS = { "Blade", "Thunder Spears" }
        local PICK_KEYS = { "RefillPickBlade", "RefillPickThunder" }
        local LIVE_KEYS = { "AutoRefillsBlade", "AutoRefillsThunder" }
        local LIVE_HANDLERS = { "OnAutoRefillsBlade", "OnAutoRefillsThunder" }
        if not Cfg.RefillEnabled and (Cfg.AutoRefillsBlade or Cfg.AutoRefillsThunder) then
            Cfg.RefillEnabled = true
            Cfg.RefillPickBlade = Cfg.AutoRefillsBlade and true or false
            Cfg.RefillPickThunder = Cfg.AutoRefillsThunder and true or false
        end
        local function SyncLive()
            for i, live in ipairs(LIVE_KEYS) do
                local want = (Cfg.RefillEnabled and Cfg[PICK_KEYS[i]]) and true or false
                if Cfg[live] ~= want then
                    Cfg[live] = want
                    Farm.Fire(LIVE_HANDLERS[i], want)
                end
            end
            Save()
        end
        SyncLive()
        local function Picked()
            local list = {}
            for i, k in ipairs(PICK_KEYS) do if Cfg[k] then list[#list + 1] = i end end
            return list
        end
        local syncing = false
        local refillToggle, popBtn, fbBtn = nil, nil, nil
        local OPTS4 = { "None", "Blade", "Thunder Spears", "Both" }
        local function Idx4()
            if Cfg.RefillPickBlade and Cfg.RefillPickThunder then return 4 end
            if Cfg.RefillPickBlade then return 2 end
            if Cfg.RefillPickThunder then return 3 end
            return 1
        end
        local function RefreshRefillUi()
            syncing = true
            if refillToggle then pcall(function() refillToggle.Value = Cfg.RefillEnabled and true or false end) end
            if popBtn then pcall(function() popBtn.Value = Picked() end) end
            if fbBtn then pcall(function() fbBtn.Value = Idx4() fbBtn.Label = OPTS4[Idx4()] end) end
            syncing = false
        end
        local function ApplyPicks(value)
            local indexes = type(value) == "table" and value or { value }
            local valid = SettingsStore.ValidIndexes(indexes, #REFILL_OPTS)
            for i, k in ipairs(PICK_KEYS) do Cfg[k] = table.find(valid, i) ~= nil end
            SyncLive()
        end
        local trow = ReloadForm:Row()
        trow:Left():TitleStack({
            Title = "Enable [ Auto Refill ]",
            Subtitle = "Turn Auto Refill on or off.",
        })
        refillToggle = trow:Right():Toggle({
            Value = Cfg.RefillEnabled and true or false,
            ValueChanged = function(self, value)
                if syncing then return end
                Cfg.RefillEnabled = value and true or false
                SyncLive()
            end
        })
        local row = ReloadForm:Row()
        row:Left():TitleStack({
            Title = "Select Equip",
            Subtitle = "Choose what to refill: Blade, Thunder Spears, or both.",
        })
        local okPop, btn = pcall(function()
            return row:Right():PopUpButton({
                Options = REFILL_OPTS,
                Maximum = #REFILL_OPTS,
                Value = Picked(),
                ValueChanged = function(self, value)
                    if syncing then return end
                    ApplyPicks(value)
                end
            })
        end)
        if okPop and btn then
            popBtn = btn
            pcall(StyleDropdown, btn)
        else
            local map = { {}, { 1 }, { 2 }, { 1, 2 } }
            fbBtn = row:Right():PullDownButton({
                Label = OPTS4[Idx4()],
                Options = OPTS4,
                Value = Idx4(),
                ValueChanged = function(self, index)
                    if syncing then return end
                    if type(index) == "table" then index = index[1] end
                    if type(index) ~= "number" or not map[index] then return end
                    self.Label = OPTS4[index]
                    ApplyPicks(map[index])
                end
            })
            pcall(StyleDropdown, fbBtn)
        end
        UiSync.Add(function()
            SyncLive()
            RefreshRefillUi()
        end)
    end
    do
        local statusRow = ReloadForm:Row()
        statusRow:Left():TitleStack({ Title = "Status" })
        local statusLabel = statusRow:Right():Label({ Text = "Off" })
        local lastStatus = nil
        task.spawn(function()
            while Alive() do
                task.wait(0.5)
                local text
                pcall(function()
                    if not (Cfg.AutoReload or Cfg.AutoRefillsBlade or Cfg.AutoRefillsThunder) then text = "Off"
                    elseif not Farm.CanUseHere() then text = "Not in a match"
                    elseif Farm.Refilling then text = tostring((Farm.RefillStatus and Farm.RefillStatus()) or "Refilling")
                    elseif Cfg.AutoReload and Farm.BladesBusy and Farm.BladesBusy() then text = "Reloading"
                    else
                        local st = Farm.RefillStatus and Farm.RefillStatus()
                        text = (st and st ~= "Idle") and tostring(st) or "Ready"
                    end
                end)
                text = text or "Ready"
                if text ~= lastStatus then
                    lastStatus = text
                    pcall(function() statusLabel.Text = text end)
                end
            end
        end)
    end
    AddFarmToggle(MainForm, "Damage Multiplier ( x10 )", "Deal 10x damage to Titans.", "DamageMultiplier", "OnDamageMultiplier")
    AddFarmSlider(MainForm, function(v) return "Set Start Farm ( " .. v .. "s )" end,
        "Wait after spawning before farming. 0 = start right away.", "StartDelay", "OnStartDelay")
    AddFarmToggle(MainForm, "Auto M1 ( Slash )", "Clicks M1 (real slash) while farming. Stops by itself when the mission is completed.", "AutoM1", "OnAutoM1")
    AddFarmToggle(MainForm, "Close-Range Fallback", "If a titan takes no damage for 3s, fly right next to its nape instead of high above it.", "NearFallback", "OnNearFallback")
    AddFarmSlider(MainForm, function(v) return "Fly Height ( " .. v .. " studs )" end,
        "How high you fly above the titan (10-500). Lower = closer, hits register more reliably.", "FlyHeight", "OnFlyHeight")
    -- [hidden] AddFarmSlider(MainForm, function(v) return "Thunder Spears Range ( " .. v .. " studs )" end,
    -- [hidden] "Auto Farm [ TS ]: hits every titan within this distance of you (50-10000).", "ThunderRange", nil)
    -- [hidden] AddFarmSlider(MainForm, function(v) return "Thunder Spears Targets per Shot ( " .. ((v <= 0 or v >= 200) and "All" or v) .. " )" end,
    -- [hidden] "Auto Farm [ TS ]: titans hit per shot. 0 or 200 = all of them in range.", "ThunderTargets", nil)
    AddFarmToggle(OptionsForm, "Auto Retry", "Automatically Retry when completed.", "AutoRetry", "OnAutoRetry")
    AddFarmToggle(OptionsForm, "Auto Leave", "Leave to the lobby right when the match ends.", "AutoLeave", "OnAutoLeave")
    AddFarmToggle(OptionsForm, "Auto Leave After X Matches",
        "Retry up to the Retry Amount, then leave (needs Auto Retry). Not together with Auto Leave.",
        "AutoLeaveWhenRetryComplete", "OnAutoLeaveWhenRetryComplete")
    AddFarmSlider(OptionsForm, function(v) return "Retry Amount ( " .. v .. " )" end,
        "Matches to retry before leaving (used by Auto Leave After X Matches).", "RetryAmount", "OnRetryAmount")
    Farm.SetRetry = AddCounterRow(OptionsForm, function(n) return "Current Retry ( " .. tostring(n) .. " )" end, "RefreshRetry")
    do
        local RtRow = OptionsForm:Row()
        RtRow:Left():TitleStack({ Title = "Status" })
        local RtLabel = RtRow:Right():Label({ Text = "Off" })
        local lastRt = nil
        function Farm.SetRetryStatus(text)
            if text == lastRt then return end
            lastRt = text
            pcall(function() RtLabel.Text = tostring(text) end)
        end
    end
    local MultiTab = MainCategory:Tab({
        Title = "Multi Hit",
        Icon = Icon("boltFill"),
    })
    local MultiForm = MultiTab:PageSection({
        Title = "🎯 Multi Hit",
        Subtitle = "Hit several Titans with every slash / spear",
    }):Form()
    AddFarmToggle(MultiForm, "Enable Multi Hit", "Every attack also hits other titans around you, not just the one you are on. Off = one titan at a time.", "MultiHit", "OnMultiHit")
    AddFarmSlider(MultiForm, function(v) return "Titans per Hit ( " .. v .. " )" end,
        "How many titans are hit at once (1-100).", "MultiHitTargets", "OnMultiHitTargets")
    AddFarmSlider(MultiForm, function(v) return "Hit Range ( " .. v .. " studs )" end,
        "Only titans within this distance of you are hit (50-10000).", "MultiHitRange", "OnMultiHitRange")
    do
        local MhRow = MultiForm:Row()
        MhRow:Left():TitleStack({ Title = "Last Attack" })
        local MhLabel = MhRow:Right():Label({ Text = "-" })
        local lastMh = nil
        function Farm.SetMultiStatus(text)
            if text == lastMh then return end
            lastMh = text
            pcall(function() MhLabel.Text = tostring(text) end)
        end
    end
    local SafetyForm = FarmTab:PageSection({
        Title = "🛟 Safety",
        Subtitle = "Keep missions from finishing too fast and break long win streaks",
    }):Form()
    AddFarmSlider(SafetyForm, function(v) return "Safe Time ( " .. v .. "s )" end,
        "A mission can't finish sooner than this. 0 = off.", "SafeTime", "OnSafeTime")
    AddFarmSlider(SafetyForm, function(v) return "Fail Safe At [ " .. v .. " ]" end,
        "Lose on purpose after this many wins in a row. 0 = never.", "FailSafeAt", "OnFailSafeAt")
    Farm.SetStreak = AddCounterRow(SafetyForm, function(n) return "Current Streak ( " .. tostring(n) .. " )" end, "RefreshStreak")
    function Farm.RefreshStreak()
        if Farm.SetStreak then Farm.SetStreak(Cfg.Streak) end
    end
    task.defer(Farm.RefreshStreak)
    AddFarmToggle(SafetyForm, "Auto Fail Safe", "When the win streak reaches the number above, the next match is lost on purpose: you stand still and let the titans kill you, then the streak resets.", "AutoFailSafe", "OnAutoFailSafe")
    do
        local FsRow = SafetyForm:Row()
        FsRow:Left():TitleStack({ Title = "Fail Safe Status" })
        local FsLabel = FsRow:Right():Label({ Text = "Off" })
        local lastFs = nil
        function Farm.SetFailSafeStatus(text)
            if text == lastFs then return end
            lastFs = text
            pcall(function() FsLabel.Text = tostring(text) end)
        end
    end
end
Farm.Debug = false
function Farm.CanUseHere()
    return not IN_MENU and game.PlaceId ~= 14916516914
end
do
    local RunService = game:GetService("RunService")
    local ATTACK_GAP = { [0] = 0.4, [1] = 0.8, [2] = 0.3, [3] = 0.2, [4] = 0.12, [5] = 0.08 }
    local OTHER_PARTS = { "Eyes", "LeftArm", "RightArm", "LeftLeg", "RightLeg" }
    local ARRIVE_DIST = 12
    local ATTACK_BEFORE_ARRIVE = true
    local ORBIT_ON = true
    local ORBIT_RADIUS = 14
    local ORBIT_SPEED = 1.6
    local ORBIT_BOB = 5
    local HIT_COUNT = 10
    local DAMAGE_MULT = 10
    local BOSS_MULT = 10
    local OTHER_MULT = 10
    local RAID_SMALL = HIT_COUNT - 1
    local BOSS_ALWAYS = true
    local PRIORITY = {}
    local BOSS_NORMAL_HP = 0
    local BOSS_SMALL_MULT = DAMAGE_MULT
    local MultState = { full = DAMAGE_MULT, other = OTHER_MULT }
    local function Mult() return Cfg.DamageMultiplier and MultState.full or 1 end
    local function OtherMult() return Cfg.DamageMultiplier and math.min(MultState.other, MultState.full) or 1 end
    local B = { Target = nil, Hits = 0, Status = "Idle" }
    Farm.Blades = B
    local post = nil
    local function Post()
        if not post or not post.Parent then
            local ok, r = pcall(function()
                return game:GetService("ReplicatedStorage").Assets.Remotes:WaitForChild("POST", 5)
            end)
            post = ok and r or nil
        end
        return post
    end
    local function MyRoot()
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if char and hum and root and hum.Health > 0 then return root, char end
        return nil
    end
    local function HitParts(titan)
        local hb = titan:FindFirstChild("Hitboxes")
        return hb and hb:FindFirstChild("Hit")
    end
    local function NapeOf(titan)
        local hit = HitParts(titan)
        local nape = hit and hit:FindFirstChild("Nape")
        if nape and nape:IsA("BasePart") then return nape end
        local any = titan and titan:FindFirstChild("Nape", true)
        if any and any:IsA("BasePart") then return any end
        return nil
    end
    local function TitanAlive(titan)
        local hum = titan and titan.Parent and titan:FindFirstChildOfClass("Humanoid")
        return hum ~= nil and hum.Health > 0
    end
    local BOSS_PATTERNS = { "^colossal", "^armored", "^female", "^attack" }
    local BOSS_GIVEUP = 120
    local bossInfo = setmetatable({}, { __mode = "k" })
    Farm.BossStatus = "Off"
    local function IsBossName(n)
        n = tostring(n):lower()
        if not n:find("titan", 1, true) then return false end
        for _, pat in ipairs(BOSS_PATTERNS) do
            if n:find(pat) then return true end
        end
        return false
    end
    function Farm.FindBoss()
        local folder = workspace:FindFirstChild("Titans")
        for _, t in ipairs(folder and folder:GetChildren() or {}) do
            if t:IsA("Model") and IsBossName(t.Name) then return t end
        end
        return nil
    end
    local function PlayingAnimIds(boss)
        local ids, n = {}, 0
        local ok, animator = pcall(function() return boss:FindFirstChildWhichIsA("Animator", true) end)
        if ok and animator then
            local ok2, tracks = pcall(function() return animator:GetPlayingAnimationTracks() end)
            if ok2 and tracks then
                for _, tr in ipairs(tracks) do
                    local id = tr.Animation and tr.Animation.AnimationId
                    if id and id ~= "" then ids[id] = true n += 1 end
                end
            end
        end
        return ids, n
    end
    function Farm.BossReadiness(boss)
        local now = os.clock()
        local hum = boss:FindFirstChildOfClass("Humanoid")
        local root = boss.PrimaryPart or boss:FindFirstChild("HumanoidRootPart")
        if not hum then return "loading", "no Humanoid" end
        if hum.Health <= 0 then return "dead", "defeated" end
        if not root then return "loading", "no root part" end
        if not NapeOf(boss) then return "loading", "no nape hitbox" end
        if hum.MaxHealth <= 0 then return "loading", "no health yet" end
        if root.Anchored then return "loading", "root still anchored" end
        local info = bossInfo[boss]
        if not info then
            local ids = PlayingAnimIds(boss)
            info = { seen = now, pos = root.Position, hp = hum.Health, ids = ids, active = false }
            bossInfo[boss] = info
        end
        if not info.active then
            if (root.Position - info.pos).Magnitude > 2 or hum.Health < info.hp - 0.5 then
                info.active = true
            else
                local ids = PlayingAnimIds(boss)
                for id in pairs(ids) do
                    if not info.ids[id] then info.active = true break end
                end
            end
        end
        local age = now - info.seen
        local settle = Cfg.BossSettle or 5
        if age < settle then return "settling", math.ceil(settle - age) end
        return "ready", info.active and "active" or "idle", age
    end
    local bossCacheAt, bossCacheVal, bossFirstSeen = 0, false, nil
    function Farm.BossBlock()
        if not Cfg.WaitForBoss then Farm.BossStatus = "Off" return false end
        local now = os.clock()
        if now - bossCacheAt < 0.25 then return bossCacheVal end
        bossCacheAt = now
        local settle = Cfg.BossSettle or 5
        local boss = Farm.FindBoss()
        local block = false
        if not boss then
            bossFirstSeen = nil
            local since = now - (Farm.CharSpawnAt or now)
            if since < settle then
                Farm.BossStatus = ("Waiting for boss to spawn (%ds)"):format(math.ceil(settle - since))
                block = true
            else
                Farm.BossStatus = "No boss in this match"
            end
        else
            bossFirstSeen = bossFirstSeen or now
            local st, a = Farm.BossReadiness(boss)
            if st == "loading" then
                if now - bossFirstSeen > BOSS_GIVEUP then
                    Farm.BossStatus = "Boss not loading (" .. tostring(a) .. ") - farming anyway"
                else
                    Farm.BossStatus = "Boss loading: " .. tostring(a)
                    block = true
                end
            elseif st == "settling" then
                Farm.BossStatus = ("Boss spawned, settling (%ds)"):format(tonumber(a) or 0)
                block = true
            elseif st == "dead" then
                Farm.BossStatus = "Boss defeated"
            else
                Farm.BossStatus = (a == "active") and "Boss ready (active)" or "Boss ready (idle - not moving yet)"
            end
        end
        bossCacheVal = block
        return block
    end
    function Farm.BossDump()
        local folder = workspace:FindFirstChild("Titans")
        local names = {}
        for _, t in ipairs(folder and folder:GetChildren() or {}) do names[#names + 1] = t.Name end
        print("[AotrUpdate5][Boss] Titans in folder (" .. #names .. "): " .. table.concat(names, ", "))
        local boss = Farm.FindBoss()
        if not boss then print("[AotrUpdate5][Boss] no boss model matched " .. table.concat(BOSS_PATTERNS, " ")) return end
        local hum = boss:FindFirstChildOfClass("Humanoid")
        local root = boss.PrimaryPart or boss:FindFirstChild("HumanoidRootPart")
        local ids, n = PlayingAnimIds(boss)
        local idList = {}
        for id in pairs(ids) do idList[#idList + 1] = id end
        local st, a = Farm.BossReadiness(boss)
        print(("[AotrUpdate5][Boss] %s | state=%s (%s) | health=%s/%s | anchored=%s | nape=%s | tracks=%d"):format(
            boss:GetFullName(), tostring(st), tostring(a),
            hum and tostring(math.floor(hum.Health)) or "?", hum and tostring(math.floor(hum.MaxHealth)) or "?",
            root and tostring(root.Anchored) or "?", tostring(NapeOf(boss) ~= nil), n))
        if #idList > 0 then print("[AotrUpdate5][Boss] playing animations: " .. table.concat(idList, ", ")) end
        for k, v in pairs(boss:GetAttributes()) do print(("[AotrUpdate5][Boss] attribute %s = %s"):format(tostring(k), tostring(v))) end
    end
    Farm.DefendErenActive = false
    function Farm.ErenRoot()
        local c = Farm.ErenCache
        if c and c.Parent then return c end
        Farm.ErenCache = nil
        Farm.ErenModel = nil
        if os.clock() < (Farm.ErenSearchAt or 0) then return nil end
        Farm.ErenMisses = Farm.ErenMisses or 0
        Farm.ErenSearchAt = os.clock() + math.min(3 + Farm.ErenMisses * 3, 20)
        local chars = workspace:FindFirstChild("Characters")
        local titans = workspace:FindFirstChild("Titans")
        local exact, loose = nil, nil
        for _, d in ipairs(workspace:GetDescendants()) do
            if d:IsA("Model") and not (chars and d:IsDescendantOf(chars)) and not (titans and d:IsDescendantOf(titans)) then
                local n = d.Name:lower()
                if n:find("eren", 1, true) then
                    if n == "eren" or n == "eren_yeager" or n == "eren yeager" or n == "erenyeager" then
                        exact = exact or d
                    else
                        loose = loose or d
                    end
                end
            end
        end
        local m = exact or loose
        if not m then Farm.ErenMisses += 1 return nil end
        Farm.ErenMisses = 0
        local part = m.PrimaryPart or m:FindFirstChild("HumanoidRootPart") or m:FindFirstChildWhichIsA("BasePart", true)
        if not part then return nil end
        Farm.ErenCache = part
        Farm.ErenModel = m
        return part
    end
    function Farm.ErenThreats()
        local eren = Farm.ErenRoot()
        if not eren then return 0, nil end
        local folder = workspace:FindFirstChild("Titans")
        local radius = Cfg.DefendErenRadius or 400
        local n = 0
        for _, t in ipairs(folder and folder:GetChildren() or {}) do
            if t:IsA("Model") and t.Name ~= "Colossal_Titan" and TitanAlive(t) then
                local nape = NapeOf(t)
                if nape and (nape.Position - eren.Position).Magnitude <= radius then n = n + 1 end
            end
        end
        return n, eren
    end
    local function PickTitan(root)
        local folder = workspace:FindFirstChild("Titans")
        if not folder then return nil end
        local erenPart = Farm.DefendErenActive and Farm.ErenRoot() or nil
        local radius = Cfg.DefendErenRadius or 400
        local best, bestDist = nil, math.huge
        for _, t in ipairs(folder:GetChildren()) do
            if t:IsA("Model") and TitanAlive(t) and not (erenPart and t.Name == "Colossal_Titan") then
                local nape = NapeOf(t)
                if nape then
                    local d
                    if erenPart then
                        d = (nape.Position - erenPart.Position).Magnitude
                        if d > radius then d = nil end
                    else
                        d = (nape.Position - root.Position).Magnitude
                    end
                    if d and d < bestDist then best, bestDist = t, d end
                end
            end
        end
        return best
    end
    local function Running()
        if not (Cfg.AutoFarm or Cfg.AutoFarmThunder) or not Farm.CanUseHere() then return false end
        if Farm.Refilling then return false end
        if Farm.FailSafeActive then return false end
        if Farm.PauseUntil and Farm.PauseUntil > os.clock() then return false end
        return true
    end
    local REMOTE_BUDGET = 150
    local budgetStart, budgetUsed = os.clock(), 0
    local function Reps(nParts)
        local want = Mult()
        if REMOTE_BUDGET <= 0 or want <= 1 then return want end
        local now = os.clock()
        if now - budgetStart >= 1 then budgetStart, budgetUsed = now, 0 end
        local n = math.max(nParts, 1)
        local budget = REMOTE_BUDGET * math.max(1, want / DAMAGE_MULT)
        local reps = math.max(1, math.min(want, math.floor((budget - budgetUsed) / n)))
        budgetUsed = budgetUsed + reps * n
        return reps
    end
    local NET_BATCH = 12
    local NET_QUEUE_MAX = 400
    local netQ, netHead, netTail = {}, 1, 0
    local function NetPending() return netTail - netHead + 1 end
    local function NetPush(remote, ...)
        netTail = netTail + 1
        netQ[netTail] = { remote = remote, args = table.pack(...) }
    end
    local netConn
    netConn = RunService.Heartbeat:Connect(function()
        if not Alive() then
            if netConn then netConn:Disconnect() end
            return
        end
        local sent = 0
        while netHead <= netTail and sent < NET_BATCH do
            local it = netQ[netHead]
            netQ[netHead] = nil
            netHead = netHead + 1
            sent = sent + 1
            if it.remote and it.remote.Parent then
                pcall(it.remote.FireServer, it.remote, table.unpack(it.args, 1, it.args.n))
            end
        end
        if netHead > netTail then netHead, netTail = 1, 0 end
    end)
    local function Slash(parts)
        local remote = Post()
        if not remote then return false end
        if typeof(parts) == "Instance" then parts = { parts } end
        if NetPending() > NET_QUEUE_MAX then return false end
        local reps = Reps(#parts)
        NetPush(remote, "Attacks", "Slash", true)
        for r = 1, reps do
            for i, part in ipairs(parts) do
                if PRIORITY[part] or r <= OtherMult() then
                    NetPush(remote, "Hitboxes", "Register", part, 143 + math.random() * 10, 0.26 + math.random() * 0.25)
                end
            end
        end
        NetPush(remote, "Attacks", "Slash", false)
        B.Hits = B.Hits + #parts
        return true
    end
    local function SpearLimit()
        local n = Cfg.ThunderTargets or 0
        if n <= 0 or n >= 200 then return math.huge end
        return n
    end
    local function NapesAround(main, spear)
        local mainNape = NapeOf(main)
        if not mainNape then return {} end
        local cap, rangeMax
        if Cfg.MultiHit then
            cap = math.clamp(Cfg.MultiHitTargets or HIT_COUNT, 1, 100)
            rangeMax = Cfg.MultiHitRange or 10000
        else
            cap = 1
            rangeMax = math.huge
        end
        local rr = MyRoot()
        local rangeFrom = rr and rr.Position or mainNape.Position
        spear = spear and true or false
        local ranged = Cfg.MultiHit and true or false
        local folder = workspace:FindFirstChild("Titans")
        local boss, bossNape = nil, nil
        if BOSS_ALWAYS and folder then
            local c = folder:FindFirstChild("Colossal_Titan")
            if c and c:IsA("Model") and TitanAlive(c) then
                bossNape = NapeOf(c)
                if bossNape then boss = c end
            end
        end
        local others = {}
        for _, t in ipairs(folder and folder:GetChildren() or {}) do
            if t ~= main and t ~= boss and t:IsA("Model") and TitanAlive(t) then
                local n = NapeOf(t)
                if n and (not ranged or (n.Position - rangeFrom).Magnitude <= rangeMax) then
                    others[#others + 1] = { part = n, d = (n.Position - mainNape.Position).Magnitude }
                end
            end
        end
        table.sort(others, function(a, b) return a.d < b.d end)
        if not Cfg.MultiHit then boss = nil end
        local list = {}
        if boss then
            PRIORITY = { [bossNape] = true }
            list[1] = bossNape
            local hum = boss:FindFirstChildOfClass("Humanoid")
            local ratio = hum and (hum.Health / math.max(hum.MaxHealth, 1)) or 1
            if ratio <= BOSS_NORMAL_HP then
                MultState.full, MultState.other = 1, 1
            else
                MultState.full, MultState.other = BOSS_MULT, BOSS_SMALL_MULT
            end
            local smallLeft = cap - 1
            if main ~= boss and smallLeft > 0 then
                list[#list + 1] = mainNape
                smallLeft = smallLeft - 1
            end
            for i = 1, math.min(smallLeft, #others) do
                list[#list + 1] = others[i].part
            end
        else
            MultState.full, MultState.other = DAMAGE_MULT, OTHER_MULT
            PRIORITY = { [mainNape] = true }
            list[1] = mainNape
            for i = 1, math.min(cap - 1, #others) do
                list[#list + 1] = others[i].part
            end
        end
        B.LastTargets = #list
        return list
    end
    local function TurnOffOther(key)
        if Cfg[key] then
            Cfg[key] = false
            Save()
            local ctl = Farm.Toggles and Farm.Toggles[key]
            if ctl then pcall(function() ctl.Value = false end) end
        end
    end
    local function Stopped()
        if Cfg.AutoFarm or Cfg.AutoFarmThunder then return end
        B.Target = nil
        B.Status = "Idle"
        local root = MyRoot()
        if root then pcall(function() root.AssemblyLinearVelocity = Vector3.zero end) end
    end
    function Farm.OnAutoFarm(on)
        if on then TurnOffOther("AutoFarmThunder") TurnOffOther("AutoClearWave") end
        Stopped()
    end
    function Farm.OnAutoFarmThunder(on)
        if on then TurnOffOther("AutoFarm") TurnOffOther("AutoClearWave") end
        Stopped()
    end
    function Farm.OnSafeFarm(on)
        if on and not (Cfg.AutoFarm or Cfg.AutoFarmThunder or Cfg.AutoClearWave) then
            Cfg.AutoFarm = true
            Save()
            local ctl = Farm.Toggles and Farm.Toggles.AutoFarm
            if ctl then pcall(function() ctl.Value = true end) end
            Farm.Fire("OnAutoFarm", true)
        end
    end
    -- ============================================================
    -- ============================================================
    local function HeldWeapon()
        local char = LocalPlayer.Character
        if not char then return nil end
        if type(char:GetAttribute("Spears")) == "number" then return "thunder" end
        return "blade"
    end
    local function SetFarmMode(wantThunder)
        local key, other = "AutoFarm", "AutoFarmThunder"
        if wantThunder then key, other = other, key end
        if Cfg[key] and not Cfg[other] then return end
        Cfg[other] = false
        Cfg[key] = true
        Save()
        local t = Farm.Toggles
        if t and t[other] then pcall(function() t[other].Value = false end) end
        if t and t[key] then pcall(function() t[key].Value = true end) end
        Farm.Fire(wantThunder and "OnAutoFarmThunder" or "OnAutoFarm", true)
        SH.say("Smart Auto Farm: " .. (wantThunder and "Thunder Spears" or "Blades"))
    end
    function Farm.OnAutoFarmSmart(on) end
    task.spawn(function()
        local lastSeen, same = nil, 0
        while Alive() do
            task.wait(1)
            if Cfg.AutoFarmSmart and Farm.CanUseHere() and not Cfg.AutoClearWave and not SH.QuestHold then
                local w = HeldWeapon()
                if w == nil then
                    lastSeen, same = nil, 0
                elseif w == lastSeen then
                    same += 1
                else
                    lastSeen, same = w, 1
                end
                if same >= 2 then SetFarmMode(w == "thunder") end
            else
                lastSeen, same = nil, 0
            end
        end
    end)
    local getRemote = nil
    local function Get()
        if not getRemote or not getRemote.Parent then
            local ok, r = pcall(function()
                return game:GetService("ReplicatedStorage").Assets.Remotes:WaitForChild("GET", 5)
            end)
            getRemote = ok and r or nil
        end
        return getRemote
    end
    local function SpearsLeft()
        local char = LocalPlayer.Character
        local n = char and char:GetAttribute("Spears")
        if type(n) == "number" then return n end
        return nil
    end
    Farm.SpearsLeft = SpearsLeft
    local lastSide, lastCount = 8, nil
    local usedIds = {}
    local stuck, stuckCount = 0, nil
    local stuckAt = 0
    local function NextSpearId(count)
        if lastCount ~= nil and count ~= nil and count > lastCount then usedIds = {} end
        lastCount = count
        if count == nil or count > 8 then
            usedIds = {}
            lastSide = (lastSide == 8) and 7 or 8
            return lastSide
        end
        local char = LocalPlayer.Character
        local rig = char and char:FindFirstChild("Rig_" .. LocalPlayer.Name)
        local gameUsed = {}
        for _, armName in ipairs({ "RightLowerArm", "LeftLowerArm" }) do
            local arm = rig and rig:FindFirstChild(armName)
            local folder = arm and arm:FindFirstChild("Spears")
            for _, d in ipairs(folder and folder:GetChildren() or {}) do
                if d.Name:match("^%d+$") and d:GetAttribute("Used") then gameUsed[tonumber(d.Name)] = true end
            end
        end
        local free = {}
        for id = 1, 8 do
            if not usedIds[id] and not gameUsed[id] then free[#free + 1] = id end
        end
        if #free == 0 then return nil end
        local pick = free[math.random(1, #free)]
        usedIds[pick] = true
        return pick
    end
    function Farm.SpearStuck()
        return stuck >= 4 and SpearsLeft() == stuckCount
    end
    local fireBusy, fireBusyAt = false, 0
    local function Spear(parts)
        local get, remote = Get(), Post()
        if not get or not remote then return false end
        local left = SpearsLeft()
        if left ~= nil and left <= 0 then return false end
        if stuck > 0 and left ~= stuckCount then stuck = 0 end
        if Farm.SpearStuck() then
            if left ~= nil and left > 0 and os.clock() - stuckAt > 1 then
                stuck, usedIds = 0, {}
            else
                return false
            end
        end
        if fireBusy and os.clock() - fireBusyAt < 10 then return false end
        local id = NextSpearId(left)
        if id == nil then
            usedIds = {}
            stuck, stuckCount, stuckAt = stuck + 1, left, os.clock()
            return false
        end
        local done = false
        fireBusy, fireBusyAt = true, os.clock()
        task.spawn(function()
            pcall(function() get:InvokeServer("Spears", "S_Fire", tostring(id)) end)
            done = true
            fireBusy = false
        end)
        local t0 = os.clock()
        while not done and os.clock() - t0 < 1.5 do task.wait() end
        local after = SpearsLeft()
        if after == nil then task.wait(0.1) end
        local tw = os.clock()
        while left ~= nil and after ~= nil and after >= left and os.clock() - tw < 1.0 do
            task.wait()
            after = SpearsLeft()
        end
        if left ~= nil and after ~= nil and after >= left then
            usedIds[id] = nil
            stuck, stuckCount, stuckAt = stuck + 1, left, os.clock()
            if stuck == 4 then print("[AotrUpdate5][Thunder] S_Fire not accepted 4 times in a row, spears left =", tostring(left), "id =", tostring(id)) end
            return false
        end
        stuck = 0
        local reps = Reps(#parts)
        if NetPending() <= NET_QUEUE_MAX then
            for r = 1, reps do
                for i, part in ipairs(parts) do
                    if part and part.Parent and (PRIORITY[part] or r <= OtherMult()) then
                        NetPush(remote, "Spears", "S_Explode", part.Position, 0.10 + math.random() * 0.09)
                    end
                end
            end
        end
        for _, part in ipairs(parts) do
            if part and part.Parent then B.Hits = B.Hits + 1 end
        end
        return true
    end
    local SAFE = { start = os.clock(), zeroSince = nil, n = 0, lastLog = 0 }
    local function SafeLeft()
        local need = Cfg.SafeTime or 0
        if need <= 0 or not Farm.CanUseHere() then return 0 end
        return math.max(0, need - (os.clock() - SAFE.start))
    end
    Farm.SafeLeft = SafeLeft
    task.spawn(function()
        while Alive() do
            task.wait(0.5)
            local now = os.clock()
            if not Farm.CanUseHere() then
                SAFE.start, SAFE.zeroSince, SAFE.n = now, nil, 0
            else
                local folder = workspace:FindFirstChild("Titans")
                local n = 0
                for _, t in ipairs(folder and folder:GetChildren() or {}) do
                    if t:IsA("Model") and TitanAlive(t) then n = n + 1 end
                end
                SAFE.n = n
                if n == 0 then
                    SAFE.zeroSince = SAFE.zeroSince or now
                else
                    if SAFE.zeroSince and now - SAFE.zeroSince > 20 then SAFE.start = now end
                    SAFE.zeroSince = nil
                end
            end
        end
    end)
    local function SafeFilter(list)
        local left = SafeLeft()
        if left <= 0 then return list end
        local folder = workspace:FindFirstChild("Titans")
        if not folder then return list end
        local allowed = SAFE.n - 1
        local out, chosen, count = {}, {}, 0
        for _, part in ipairs(list) do
            local t = part
            while t and t.Parent ~= folder do t = t.Parent end
            if t then
                if chosen[t] then
                    out[#out + 1] = part
                elseif count < allowed then
                    chosen[t] = true
                    count = count + 1
                    out[#out + 1] = part
                end
            end
        end
        if #out < #list and os.clock() - SAFE.lastLog > 5 then
            SAFE.lastLog = os.clock()
            print(string.format("[AotrUpdate5][SafeTime] holding the last titan, %ds left (alive=%d)", math.ceil(left), SAFE.n))
        end
        return out
    end
    local JUMP_EVERY = 2
    local JUMP_GAP = 0.9
    local function FindJumpButton()
        local touchGui = PlayerGui:FindFirstChild("TouchGui")
        local frame = touchGui and touchGui:FindFirstChild("TouchControlFrame")
        local btn = frame and frame:FindFirstChild("JumpButton")
        if btn and btn:IsA("GuiObject") and btn.Visible and btn.AbsoluteSize.X > 0 then return btn end
        return nil
    end
    local function PressJump()
        local VIM = game:GetService("VirtualInputManager")
        local btn = game:GetService("UserInputService").TouchEnabled and FindJumpButton() or nil
        if btn then
            local p = btn.AbsolutePosition + btn.AbsoluteSize / 2
            local id = math.random(100000, 999999)
            pcall(function() VIM:SendTouchEvent(id, 0, p.X, p.Y) end)
            task.wait(0.05)
            pcall(function() VIM:SendTouchEvent(id, 2, p.X, p.Y) end)
        else
            pcall(function() VIM:SendKeyEvent(true, Enum.KeyCode.Space, false, game) end)
            task.wait(0.05)
            pcall(function() VIM:SendKeyEvent(false, Enum.KeyCode.Space, false, game) end)
        end
    end
    local jumpHeld = nil
    local function JumpDown()
        if jumpHeld then return end
        local VIM = game:GetService("VirtualInputManager")
        local btn = game:GetService("UserInputService").TouchEnabled and FindJumpButton() or nil
        if btn then
            local p = btn.AbsolutePosition + btn.AbsoluteSize / 2
            local id = math.random(100000, 999999)
            jumpHeld = { touch = true, id = id, x = p.X, y = p.Y }
            pcall(function() VIM:SendTouchEvent(id, 0, p.X, p.Y) end)
        else
            jumpHeld = { touch = false }
            pcall(function() VIM:SendKeyEvent(true, Enum.KeyCode.Space, false, game) end)
        end
    end
    local function JumpUp()
        local h = jumpHeld
        if not h then return end
        jumpHeld = nil
        local VIM = game:GetService("VirtualInputManager")
        if h.touch then
            pcall(function() VIM:SendTouchEvent(h.id, 2, h.x, h.y) end)
        else
            pcall(function() VIM:SendKeyEvent(false, Enum.KeyCode.Space, false, game) end)
        end
    end
    task.spawn(function()
        local function active()
            return Cfg.SafeFarm and Running() and B.Target
        end
        while Alive() do
            if active() then
                pcall(PressJump)
                task.wait(JUMP_GAP)
                if active() then
                    pcall(JumpDown)
                    local t0 = os.clock()
                    while os.clock() - t0 < JUMP_EVERY and active() do task.wait(0.05) end
                    pcall(JumpUp)
                end
            else
                pcall(JumpUp)
                task.wait(0.2)
            end
        end
        pcall(JumpUp)
    end)
    local NR = { Height = 14, Radius = 5, After = 3, On = false, Target = nil, Hp = 0, Since = 0 }
    function NR.Watch(target)
        local hum = target and target:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        if NR.Target ~= target then
            NR.Target, NR.Hp, NR.Since = target, hum.Health, os.clock()
            return
        end
        if hum.Health < NR.Hp - 0.01 then
            NR.Hp, NR.Since = hum.Health, os.clock()
        elseif B.Status ~= "Attacking" or SafeLeft() > 0 then
            NR.Since = os.clock()
        elseif os.clock() - NR.Since > NR.After then
            NR.Since = os.clock()
            if Cfg.NearFallback and not NR.On then
                NR.On = true
                SH.say("Titan not taking damage from far away -> flying close to the nape")
            end
        end
    end
    local lastChar, readyAt = nil, 0
    task.spawn(function()
        local lastPick = 0
        local orbitAngle = 0
        while Alive() do
            local dt = RunService.Heartbeat:Wait()
            orbitAngle = (orbitAngle + ORBIT_SPEED * dt) % (math.pi * 2)
            local root, char = MyRoot()
            if char ~= lastChar then
                lastChar = char
                NR.On = false
                Farm.CharSpawnAt = os.clock()
                readyAt = os.clock() + (Cfg.StartDelay or 0)
            end
            if Cfg.AutoFarm and Running() and Farm.BladesBusy and Farm.BladesBusy() then
                B.Status = "Reloading"
                if root then pcall(function() root.AssemblyLinearVelocity = Vector3.zero end) end
            elseif not Running() then
                B.Target = nil
                if Cfg.AutoFarm or Cfg.AutoFarmThunder then B.Status = "Paused" else B.Status = "Idle" end
            elseif not root then
                B.Target = nil
                B.Status = "Waiting for character"
            elseif os.clock() < readyAt then
                B.Status = "Start delay"
            elseif Farm.BossBlock() then
                B.Target = nil
                B.Status = "Waiting for boss"
                pcall(function() root.AssemblyLinearVelocity = Vector3.zero end)
            else
                if B.Target and not TitanAlive(B.Target) then
                    B.Target = nil
                    pcall(function() root.AssemblyLinearVelocity = Vector3.zero end)
                end
                if not B.Target and os.clock() - lastPick > 0.4 then
                    lastPick = os.clock()
                    B.Target = PickTitan(root)
                end
                local nape = B.Target and NapeOf(B.Target)
                if nape then
                    pcall(NR.Watch, B.Target)
                    if not Cfg.NearFallback then NR.On = false end
                    local height = NR.On and NR.Height or math.max(Cfg.FlyHeight or 150, 0)
                    local radius = NR.On and NR.Radius or ORBIT_RADIUS
                    local offset = Vector3.new(0, height, 0)
                    if ORBIT_ON then
                        offset = offset + Vector3.new(
                            math.cos(orbitAngle) * radius,
                            math.sin(orbitAngle * 2) * (NR.On and 1 or ORBIT_BOB),
                            math.sin(orbitAngle) * radius
                        )
                    end
                    local goal = nape.Position + offset
                    local diff = goal - root.Position
                    local dist = diff.Magnitude
                    pcall(function() root.AssemblyLinearVelocity = Vector3.zero end)
                    if dist > 1 then
                        local step = math.min((Cfg.FlySpeed or 600) * dt, dist)
                        local newPos = root.Position + diff.Unit * step
                        if ORBIT_ON and dist <= ARRIVE_DIST then
                            root.CFrame = CFrame.lookAt(newPos, Vector3.new(nape.Position.X, newPos.Y, nape.Position.Z))
                        else
                            root.CFrame = CFrame.new(newPos)
                        end
                    end
                    B.Status = (dist <= ARRIVE_DIST) and "Attacking" or "Flying to titan"
                else
                    B.Target = nil
                    B.Status = "Searching for titans"
                    pcall(function() root.AssemblyLinearVelocity = Vector3.zero end)
                end
            end
        end
    end)
    local BURST_MODE = false
    local BURST_SIZE = 10
    local BURST_GAP = 0.1
    local BURST_TARGETS = 10
    local burstAt = 0
    local FAKE_ENABLED = false
    local FAKE_MAX_PARTS = 30
    local fakeLast = 0
    local function FakeParts()
        if not FAKE_ENABLED then return nil end
        local folder = workspace:FindFirstChild("Titans")
        local boss = folder and folder:FindFirstChild("Colossal_Titan")
        if not (boss and boss:IsA("Model") and TitanAlive(boss)) then return nil end
        local fake = boss:FindFirstChild("Fake")
        if not fake then return nil end
        local out = {}
        if fake:IsA("BasePart") then out[1] = fake end
        for _, d in ipairs(fake:GetDescendants()) do
            if d:IsA("BasePart") and d.Parent then
                out[#out + 1] = d
                if #out >= FAKE_MAX_PARTS then break end
            end
        end
        return #out > 0 and out or nil
    end
    local function SlashBurst(parts)
        local remote = Post()
        if not remote or NetPending() > NET_QUEUE_MAX then return false end
        NetPush(remote, "Attacks", "Slash", true)
        local total = 0
        for _, part in ipairs(parts) do
            local size = BURST_SIZE
            if PRIORITY[part] and MultState.full > DAMAGE_MULT then
                size = math.floor(BURST_SIZE * MultState.full / DAMAGE_MULT)
            end
            for _ = 1, size do
                NetPush(remote, "Hitboxes", "Register", part, 143 + math.random() * 10, 0.26 + math.random() * 0.25)
            end
            total = total + size
        end
        NetPush(remote, "Attacks", "Slash", false)
        B.Hits = B.Hits + total
        return true
    end
    local StatsSvc = game:GetService("Stats")
    local PING_BACKOFF = true
    local PING_LIMIT = 350
    local function PingMs()
        local ok, v = pcall(function() return StatsSvc.Network.ServerStatsItem["Data Ping"]:GetValue() end)
        return (ok and tonumber(v)) or 0
    end
    task.spawn(function()
        local partLast = setmetatable({}, { __mode = "k" })
        while Alive() do
            local gap = ATTACK_GAP[Cfg.AttackSpeed or 0] or 0.4
            if PING_BACKOFF then
                local ping = PingMs()
                if ping > PING_LIMIT then gap = gap * math.clamp(ping / PING_LIMIT, 1, 4) end
            end
            task.wait(gap)
            local target = B.Target
            local root = MyRoot()
            local bladesBusy = Farm.BladesBusy and Farm.BladesBusy()
            if Cfg.AutoFarm and Running() and root and target and TitanAlive(target) and not bladesBusy and (B.Status == "Attacking" or (ATTACK_BEFORE_ARRIVE and B.Status == "Flying to titan")) then
                local nape = NapeOf(target)
                if nape then
                    local safeList = SafeFilter(NapesAround(target))
                    local burstOn = BURST_MODE and Cfg.DamageMultiplier
                    if burstOn then
                        if #safeList > 0 and os.clock() - burstAt >= BURST_GAP then
                            burstAt = os.clock()
                            local picked = {}
                            for i = 1, math.min(BURST_TARGETS, #safeList) do picked[i] = safeList[i] end
                            SlashBurst(picked)
                        end
                    elseif #safeList > 0 then
                        Slash(safeList)
                    end
                    if #safeList > 0 then
                        local fakeParts = FakeParts()
                        if fakeParts then
                            if burstOn then
                                if B.Status == "Attacking" and os.clock() - fakeLast >= BURST_GAP then
                                    fakeLast = os.clock()
                                    Slash(fakeParts)
                                end
                            else
                                Slash(fakeParts)
                            end
                        end
                    end
                    if Cfg.HitAllParts and #safeList > 0 and SafeLeft() <= 0 and not (burstOn and B.Status ~= "Attacking") then
                        local hit = HitParts(target)
                        local cd = math.max(Cfg.PartCooldown or 7, 4)
                        for _, name in ipairs(OTHER_PARTS) do
                            local part = hit and hit:FindFirstChild(name)
                            if part and part:IsA("BasePart") and os.clock() - (partLast[part] or 0) >= cd then
                                partLast[part] = os.clock()
                                Slash(part)
                            end
                        end
                    end
                end
            end
        end
    end)
    task.spawn(function()
        local SPEAR_BURST = true
        local spearAt = 0
        while Alive() do
            task.wait(SPEAR_BURST and 0 or math.max(ATTACK_GAP[Cfg.AttackSpeed or 0] or 0.4, 0.6))
            local target = B.Target
            local root = MyRoot()
            if Cfg.AutoFarmThunder and Running() and root and target and TitanAlive(target) and (B.Status == "Attacking" or (ATTACK_BEFORE_ARRIVE and B.Status == "Flying to titan"))
                and (not SPEAR_BURST or os.clock() - spearAt >= 0.03) then
                local safeList = SafeFilter(NapesAround(target, true))
                if #safeList > 0 then
                    if SPEAR_BURST then
                        spearAt = os.clock()
                        local picked = {}
                        for i = 1, #safeList do picked[i] = safeList[i] end
                        safeList = picked
                    end
                    Spear(safeList)
                end
            end
        end
    end)
    Farm.ClearWaveStatus = "Off"
    function Farm.OnAutoClearWave(on)
        if on and SH.PlayOn() then
            TurnOffOther("AutoFarm")
            TurnOffOther("AutoFarmThunder")
        else
            Farm.ClearWaveStatus = "Off"
        end
    end
    task.spawn(function()
        local partLast = setmetatable({}, { __mode = "k" })
        while Alive() do
            task.wait(ATTACK_GAP[Cfg.AttackSpeed or 0] or 0.4)
            if not (Cfg.AutoClearWave and SH.PlayOn()) then
                Farm.ClearWaveStatus = (Cfg.AutoClearWave and "Waiting for Auto Play") or "Off"
            elseif not Farm.CanUseHere() then
                Farm.ClearWaveStatus = "Waiting for wave mode"
            elseif Farm.BossBlock() then
                Farm.ClearWaveStatus = "Waiting for boss"
            elseif Farm.FailSafeActive then
                Farm.ClearWaveStatus = "Paused (Fail Safe is losing on purpose)"
            elseif Farm.Refilling then
                Farm.ClearWaveStatus = "Paused (refilling)"
            elseif Farm.BladesBusy and Farm.BladesBusy() then
                Farm.ClearWaveStatus = "Reloading blades"
            else
                local root = MyRoot()
                local folder = workspace:FindFirstChild("Titans")
                if not root then
                    Farm.ClearWaveStatus = "Waiting for character"
                elseif not folder then
                    Farm.ClearWaveStatus = "No titans yet"
                else
                    local range = Cfg.ClearWaveRange or 300
                    local best, bestD, alive = nil, math.huge, 0
                    for _, t in ipairs(folder:GetChildren()) do
                        if t:IsA("Model") and TitanAlive(t) then
                            alive += 1
                            local nape = NapeOf(t)
                            if nape then
                                local d = (nape.Position - root.Position).Magnitude
                                if d <= range and d < bestD then best, bestD = t, d end
                            end
                        end
                    end
                    if not best then
                        Farm.ClearWaveStatus = (alive == 0) and "No titans alive" or ("No titan in range (%d alive)"):format(alive)
                    else
                        local list = {}
                        for _, part in ipairs(SafeFilter(NapesAround(best))) do
                            if (part.Position - root.Position).Magnitude <= range then list[#list + 1] = part end
                        end
                        if #list > 0 then
                            Slash(list)
                            Farm.ClearWaveStatus = ("Clearing: hitting %d titan(s) in range (%d alive)"):format(#list, alive)
                            if Cfg.HitAllParts and SafeLeft() <= 0 then
                                local hit = HitParts(best)
                                local cd = math.max(Cfg.PartCooldown or 7, 4)
                                for _, name in ipairs(OTHER_PARTS) do
                                    local part = hit and hit:FindFirstChild(name)
                                    if part and part:IsA("BasePart") and os.clock() - (partLast[part] or 0) >= cd
                                        and (part.Position - root.Position).Magnitude <= range then
                                        partLast[part] = os.clock()
                                        Slash(part)
                                    end
                                end
                            end
                        else
                            Farm.ClearWaveStatus = "Holding the last titan (Safe Time)"
                        end
                    end
                end
            end
        end
    end)
    -- ============================================================
    -- Auto M1: real left-clicks while farming, stops on the mission-completed screen
    -- ============================================================
    local M1 = { Gap = 0.12 }
    function M1.Click()
        local cam = workspace.CurrentCamera
        local vp = cam and cam.ViewportSize or Vector2.new(800, 600)
        local x, y = vp.X / 2, vp.Y / 2
        pcall(function() VirtualInputManager:SendMouseButtonEvent(x, y, 0, true, game, 0) end)
        task.wait(0.03)
        pcall(function() VirtualInputManager:SendMouseButtonEvent(x, y, 0, false, game, 0) end)
    end
    function M1.Wanted()
        if not Cfg.AutoM1 or not Farm.CanUseHere() then return false end
        if Farm.CompleteScreenShown and Farm.CompleteScreenShown() then return false end
        if Farm.Refilling or Farm.FailSafeActive then return false end
        if Farm.BladesBusy and Farm.BladesBusy() then return false end
        if Cfg.AutoFarm or Cfg.AutoFarmThunder then
            return Running() and B.Target ~= nil and (B.Status == "Attacking" or B.Status == "Flying to titan")
        end
        if Cfg.AutoClearWave then
            return type(Farm.ClearWaveStatus) == "string" and Farm.ClearWaveStatus:sub(1, 8) == "Clearing"
        end
        return false
    end
    task.spawn(function()
        while Alive() do
            if M1.Wanted() then
                pcall(M1.Click)
                task.wait(M1.Gap)
            else
                task.wait(0.25)
            end
        end
    end)
    task.spawn(function()
        while Alive() do
            task.wait(0.5)
            if Farm.SetMultiStatus then
                local n = B.LastTargets
                if not Cfg.MultiHit then
                    Farm.SetMultiStatus("Multi Hit off (1 titan)")
                elseif n then
                    Farm.SetMultiStatus(("%d titan(s) per hit"):format(n))
                else
                    Farm.SetMultiStatus("-")
                end
            end
        end
    end)
    local ncParts, ncChar, ncAdded, ncStepped = {}, nil, nil, nil
    ncStepped = RunService.Stepped:Connect(function()
        if not Alive() then
            if ncAdded then ncAdded:Disconnect() ncAdded = nil end
            if ncStepped then ncStepped:Disconnect() end
            return
        end
        if not Cfg.NoClip or not Running() then return end
        local _, char = MyRoot()
        if not char then return end
        if char ~= ncChar then
            ncChar = char
            if ncAdded then ncAdded:Disconnect() end
            ncParts = {}
            for _, p in ipairs(char:GetDescendants()) do
                if p:IsA("BasePart") then ncParts[#ncParts + 1] = p end
            end
            ncAdded = char.DescendantAdded:Connect(function(d)
                if d:IsA("BasePart") then ncParts[#ncParts + 1] = d end
            end)
        end
        for i = #ncParts, 1, -1 do
            local p = ncParts[i]
            if p.Parent then
                if p.CanCollide then p.CanCollide = false end
            else
                table.remove(ncParts, i)
            end
        end
    end)
end
do
    local token = tostring(os.clock()) .. "_" .. tostring(math.random(100000, 999999))
    local lastBeat, lastBeatAt = nil, 0
    local function Get(name) return LocalPlayer:GetAttribute(name) end
    local function Fresh()
        local beat = Get("SH_Beat")
        if beat == nil or Get("SH_ActorToken") ~= token then return false end
        if beat ~= lastBeat then lastBeat, lastBeatAt = beat, os.clock() end
        return os.clock() - lastBeatAt < 2
    end
    function Farm.ActorActive() return Fresh() end
    local TRUST_ACTOR = false
    function Farm.ActorSegments() if TRUST_ACTOR and Fresh() then return tonumber(Get("SH_Segments")) end return nil end
    function Farm.ActorReloads() if TRUST_ACTOR and Fresh() then return tonumber(Get("SH_Reloads")) end return nil end
    local CODE = [==[
        local TOKEN = "__TOKEN__"
        pcall(task.synchronize)
        repeat task.wait() until game:IsLoaded()
        local LP = game:GetService("Players").LocalPlayer
        local Host
        for _, c in ipairs(filtergc("table", { Keys = { "Modules", "Cache", "Invoked", "Services" } }, false)) do
            if type(c) == "table" and type(c.Modules) == "table" and type(c.Cache) == "table"
                and c.Cache.Player == LP and type(c.Modules.ODMG) == "table" then
                Host = c
                break
            end
        end
        if not Host then return end
        local beat, lastDump = 0, nil
        local function Flat(t, depth, seen)
            local parts = {}
            if type(t) ~= "table" then return tostring(t) end
            seen = seen or {}
            if seen[t] then return "<cycle>" end
            seen[t] = true
            local keys = {}
            for k in pairs(t) do keys[#keys + 1] = k end
            table.sort(keys, function(a, b) return tostring(a) < tostring(b) end)
            for _, k in ipairs(keys) do
                local v = t[k]
                local tv = type(v)
                if tv == "number" or tv == "string" or tv == "boolean" then
                    parts[#parts + 1] = tostring(k) .. "=" .. tostring(v)
                elseif tv == "table" and depth > 0 then
                    parts[#parts + 1] = tostring(k) .. "={" .. Flat(v, depth - 1, seen) .. "}"
                elseif tv == "table" then
                    parts[#parts + 1] = tostring(k) .. "={..}"
                elseif tv == "function" then
                    parts[#parts + 1] = tostring(k) .. "()"
                elseif tv == "userdata" or tv == "Instance" then
                    parts[#parts + 1] = tostring(k) .. "=<" .. typeof(v) .. ">"
                end
            end
            return table.concat(parts, "; ")
        end
        local function Dump()
            print("[AotrUpdate5][ActorDump] ---- begin ----")
            print("[AotrUpdate5][ActorDump] Loadout: " .. Flat(Host.Loadout, 2))
            print("[AotrUpdate5][ActorDump] Cache: " .. Flat(Host.Cache, 0))
            if type(Host.Modules) == "table" then
                local names = {}
                for k, v in pairs(Host.Modules) do names[#names + 1] = tostring(k) .. "(" .. typeof(v) .. ")" end
                table.sort(names)
                print("[AotrUpdate5][ActorDump] Modules: " .. table.concat(names, ", "))
                for _, k in ipairs({ "Spears", "Spear", "ThunderSpears", "ThunderSpear", "TS", "Weapons", "Weapon", "Combat", "Attacks" }) do
                    local m = Host.Modules[k]
                    if type(m) == "table" then print("[AotrUpdate5][ActorDump] Module " .. k .. ": " .. Flat(m, 0)) end
                end
            end
            local ODMG = Host.Modules and Host.Modules.ODMG
            if type(ODMG) == "table" then
                print("[AotrUpdate5][ActorDump] ODMG: " .. Flat(ODMG, 0))
                local ch = Host.Cache and Host.Cache.Character
                if ch and type(ODMG.Rig) == "function" then
                    local ok, rig = pcall(ODMG.Rig, Host, ch)
                    print("[AotrUpdate5][ActorDump] Rig(ok=" .. tostring(ok) .. "): " .. (ok and Flat(rig, 2) or tostring(rig)))
                end
            end
            print("[AotrUpdate5][ActorDump] ---- end ----")
        end
        while LP:GetAttribute("SH_ActorToken") == TOKEN do
            task.wait(0.2)
            local req = LP:GetAttribute("SH_DumpRequest")
            if req ~= nil and req ~= lastDump then
                lastDump = req
                pcall(Dump)
            end
            local loadout = Host.Loadout
            local supply = loadout and loadout.Supply
            local seg = supply and tonumber(supply.Segments)
            local rel = supply and tonumber(supply.Reloads)
            beat = beat + 1
            if type(supply) == "table" then
                local parts = {}
                for k, v in pairs(supply) do
                    local tv = type(v)
                    if tv == "number" or tv == "string" or tv == "boolean" then parts[#parts + 1] = tostring(k) .. "=" .. tostring(v) end
                end
                table.sort(parts)
                LP:SetAttribute("SH_SupplyDump", table.concat(parts, "; "))
            end
            LP:SetAttribute("SH_Segments", seg)
            LP:SetAttribute("SH_Reloads", rel)
            LP:SetAttribute("SH_Beat", beat)
        end
    ]==]
    local function Supported()
        return type(getactors) == "function" and type(run_on_actor) == "function" and type(filtergc) == "function"
    end
    local function Inject()
        local okA, actors = pcall(getactors)
        if not (okA and type(actors) == "table" and #actors > 0) then return false end
        token = tostring(os.clock()) .. "_" .. tostring(math.random(100000, 999999))
        LocalPlayer:SetAttribute("SH_ActorToken", token)
        for _, actor in ipairs(actors) do
            pcall(run_on_actor, actor, (CODE:gsub("__TOKEN__", function() return token end)))
        end
        return true
    end
    task.spawn(function()
        if not Supported() then
            print("[AotrUpdate5][Actor] executor does not support getactors/run_on_actor/filtergc -> using the fallback method")
            return
        end
        local wasLinked = false
        local lastTry = -999
        while Alive() do
            task.wait(0.5)
            if Fresh() then
                if not wasLinked then
                    wasLinked = true
                    print("[AotrUpdate5][Actor] hooked into the game system: Segments=" .. tostring(Get("SH_Segments")) .. " Reloads=" .. tostring(Get("SH_Reloads")))
                end
            else
                if wasLinked then
                    wasLinked = false
                    print("[AotrUpdate5][Actor] signal lost (character respawned?) -> reconnecting")
                end
                local char = LocalPlayer.Character
                if char and os.clock() - lastTry >= 5 then
                    lastTry = os.clock()
                    Inject()
                end
            end
        end
    end)
    task.spawn(function()
        local last, lastAt = nil, 0
        while Alive() do
            task.wait(0.3)
            local dump = LocalPlayer:GetAttribute("SH_SupplyDump")
            local seg = tonumber(LocalPlayer:GetAttribute("SH_Segments"))
            if Fresh() and dump and dump ~= last and (seg == nil or seg <= 2) and os.clock() - lastAt >= 1 then
                last, lastAt = dump, os.clock()
                print("[AotrUpdate5][Supply] " .. dump .. " | farm=" .. tostring(Farm.Blades and Farm.Blades.Status))
            end
        end
    end)
    task.spawn(function()
        local n, last = 0, 0
        while Alive() do
            task.wait(0.5)
            if Fresh() and n < 6 and os.clock() - last >= 4 and ((Farm.BladesEmpty and Farm.BladesEmpty()) or n == 0) then
                n, last = n + 1, os.clock()
                LocalPlayer:SetAttribute("SH_DumpRequest", n)
            end
        end
    end)
    task.spawn(function()
        while Alive() do
            task.wait(0.25)
            pcall(function()
                LocalPlayer:SetAttribute("SH_AutoReload", (Cfg.AutoReload and Farm.CanUseHere()) and true or false)
            end)
        end
        pcall(function() LocalPlayer:SetAttribute("SH_ActorToken", nil) LocalPlayer:SetAttribute("SH_AutoReload", false) end)
    end)
end
do
    local RELOAD_WAIT = 1.5
    local RELOAD_RETRY = 3
    local remote = nil
    Farm.LastReload = nil
    local function BladeParts()
        local char = LocalPlayer.Character
        local rig = char and char:FindFirstChild("Rig_" .. LocalPlayer.Name)
        local list = {}
        for _, handName in ipairs({ "RightHand", "LeftHand" }) do
            local hand = rig and rig:FindFirstChild(handName)
            for _, d in ipairs(hand and hand:GetChildren() or {}) do
                if d.Name:match("^Blade_%d+$") then list[#list + 1] = d end
            end
        end
        return list
    end
    local function AllBroken()
        local parts = BladeParts()
        if #parts == 0 then return false end
        for _, p in ipairs(parts) do
            if not p:GetAttribute("Broken") then return false end
        end
        return true
    end
    Farm.BladesEmpty = function()
        if AllBroken() then return true end
        local seg = Farm.ActorSegments and Farm.ActorSegments()
        return seg ~= nil and seg <= 0
    end
    local BUSY_MAX = 8
    local emptyStart = nil
    task.spawn(function()
        local wasEmpty = false
        while Alive() do
            task.wait(0.1)
            local empty = Farm.BladesEmpty() == true
            if empty then emptyStart = emptyStart or os.clock() else emptyStart = nil end
            if wasEmpty and not empty then Farm.ReloadSettleUntil = os.clock() + 0.6 end
            wasEmpty = empty
        end
    end)
    function Farm.BladesEmptyFor() return emptyStart and (os.clock() - emptyStart) or 0 end
    function Farm.BladesBusy()
        if os.clock() < (Farm.ReloadSettleUntil or 0) then return true end
        return emptyStart ~= nil and os.clock() - emptyStart < BUSY_MAX
    end
    task.spawn(function()
        local emptySince, lastFire = nil, 0
        local rejects = 0
        while Alive() do
            task.wait(0.25)
            local spare = Farm.ActorReloads and Farm.ActorReloads()
            if not Farm.BladesEmpty() then rejects = 0 Farm.ReloadRejects = 0 end
            if Cfg.AutoReload and Farm.CanUseHere() and Farm.BladesEmpty() and (spare == nil or spare > 0) and rejects < 2 then
                emptySince = emptySince or os.clock()
                if os.clock() - emptySince >= RELOAD_WAIT and os.clock() - lastFire >= RELOAD_RETRY then
                    lastFire = os.clock()
                    if not remote or not remote.Parent then
                        local ok, r = pcall(function()
                            return game:GetService("ReplicatedStorage").Assets.Remotes:WaitForChild("GET", 5)
                        end)
                        remote = ok and r or nil
                    end
                    if remote then
                        local ok, res = pcall(function() return remote:InvokeServer("Blades", "Reload") end)
                        Farm.LastReload = ok and res or ("error: " .. tostring(res))
                        if ok and res then rejects = 0 else rejects = rejects + 1 end
                        Farm.ReloadRejects = rejects
                        print("[AotrUpdate5][Reload] fire | result=" .. tostring(Farm.LastReload)
                            .. " | Segments=" .. tostring(LocalPlayer:GetAttribute("SH_Segments"))
                            .. " Reloads=" .. tostring(LocalPlayer:GetAttribute("SH_Reloads")) .. " AllBroken=" .. tostring(AllBroken()))
                    end
                end
            else
                emptySince = nil
            end
        end
    end)
end
do
    local REFILL_PLACES = {
        [13379349730]     = { "Unclimbable", "Props", "HQ" },
        [14012874501]     = { "Unclimbable", "Props", "HQ" },
        [13904207646]     = { "Climbable", "_Walls", "Gate" },
        [14638336319]     = { "Unclimbable", "Camps", "Camp" },
        [15220308770]     = { "Climbable", "Utgard" },
        [17688739434]     = { "Unclimbable", "World", "Buildings", "Hanger" },
        [15824912319]     = { "Unclimbable", "Props", "HQ" },
        [126678335159530] = { "Unclimbable", "Reloads" },
    }
    local EMPTY_WAIT = 1.5
    local TRIES = 2
    local CHECK_WAIT = 3
    local COOLDOWN = 15
    local RETRY_AFTER_FAIL = 6
    local lastRefill = -999
    local function Log(...) print("[AotrUpdate5][Refill]", ...) end
    local Status = "Idle"
    Farm.RefillStatus = function() return Status end
    local stations = nil
    local function Collect(container)
        local list = {}
        for _, d in ipairs(container:GetDescendants()) do
            if d.Name == "Refill" then list[#list + 1] = d end
        end
        return list
    end
    local function PosOf(inst)
        local ok, pos = pcall(function()
            if inst:IsA("BasePart") then return inst.Position end
            if inst:IsA("Model") then return inst:GetPivot().Position end
            local part = inst:FindFirstChildWhichIsA("BasePart", true)
            return part and part.Position or nil
        end)
        return ok and pos or nil
    end
    local function NearestStation(root)
        local valid = stations and #stations > 0
        if valid then
            for _, st in ipairs(stations) do
                if not st.Parent then valid = false break end
            end
        end
        if not valid then
            stations = {}
            local uncl = workspace:FindFirstChild("Unclimbable")
            local obj = uncl and uncl:FindFirstChild("Objective")
            local waveFolder = obj and obj:FindFirstChild("Waves")
            if waveFolder then stations = Collect(waveFolder) end
            if #stations == 0 then
                local container = workspace
                local path = REFILL_PLACES[game.PlaceId]
                if path then
                    local cur = workspace
                    for _, name in ipairs(path) do cur = cur and cur:FindFirstChild(name) end
                    if cur then container = cur end
                end
                stations = Collect(container)
                if #stations == 0 and container ~= workspace then stations = Collect(workspace) end
            end
        end
        local best, bestDist = nil, math.huge
        for _, st in ipairs(stations) do
            local pos = PosOf(st)
            if pos then
                local d = (pos - root.Position).Magnitude
                if d < bestDist then best, bestDist = st, d end
            end
        end
        return best
    end
    local function Rig()
        local char = LocalPlayer.Character
        return char and char:FindFirstChild("Rig_" .. LocalPlayer.Name)
    end
    local function SpareLeft()
        local actorReloads = Farm.ActorReloads and Farm.ActorReloads()
        if actorReloads ~= nil then return actorReloads end
        local rig = Rig()
        local torso = rig and rig:FindFirstChild("LowerTorso")
        if not torso then return nil end
        local total, left = 0, 0
        for _, d in ipairs(torso:GetChildren()) do
            if d.Name:match("^Left_%d+$") then
                total = total + 1
                if not d:GetAttribute("Used") then left = left + 1 end
            end
        end
        if total == 0 then return nil end
        return left
    end
    Farm.BladeSpare = SpareLeft
    local function NeedBladeRaw()
        if not (Farm.BladesEmpty and Farm.BladesEmpty()) then return false end
        local sp = SpareLeft()
        if sp == 0 then return true end
        if sp == nil then
            return (Farm.ReloadRejects or 0) >= 2 or (Farm.BladesEmptyFor and Farm.BladesEmptyFor() or 0) >= 5
        end
        return false
    end
    local function NeedBlade() return Cfg.AutoRefillsBlade and NeedBladeRaw() end
    local function NeedThunderRaw()
        local n = Farm.SpearsLeft and Farm.SpearsLeft()
        if n ~= nil and n <= 0 then return true end
        return Farm.SpearStuck ~= nil and Farm.SpearStuck() == true
    end
    local function NeedThunder() return Cfg.AutoRefillsThunder and NeedThunderRaw() end
    local function RefillsLeft()
        local n = LocalPlayer:GetAttribute("Refills")
        if type(n) == "number" then return n end
        return nil
    end
    local function DoRefill()
        local ok0, post = pcall(function()
            return game:GetService("ReplicatedStorage").Assets.Remotes:WaitForChild("POST", 5)
        end)
        if not ok0 or not post then Status = "POST remote not found" return false end

        local function PressPrompt(prompt)
            if type(fireproximityprompt) == "function" and pcall(fireproximityprompt, prompt) then return true end
            return pcall(function()
                prompt:InputHoldBegin()
                task.wait((prompt.HoldDuration or 0) + 0.15)
                prompt:InputHoldEnd()
            end)
        end

        local function PressRKey(prompt)
            local hold = (prompt and prompt.HoldDuration or 0) + 0.2
            local VIM = game:GetService("VirtualInputManager")
            pcall(function() VIM:SendKeyEvent(true, Enum.KeyCode.R, false, game) end)
            task.wait(hold)
            pcall(function() VIM:SendKeyEvent(false, Enum.KeyCode.R, false, game) end)
        end

        local function PromptOf(station)
            local p = station:FindFirstChildWhichIsA("ProximityPrompt", true)
            if not p and station.Parent then
                p = station.Parent:FindFirstChildWhichIsA("ProximityPrompt", true)
            end
            return p
        end

        local function PromptPos(prompt, station)
            local par = prompt and prompt.Parent
            if par and par:IsA("BasePart") then return par.Position end
            if par and par:IsA("Attachment") then return par.WorldPosition end
            return PosOf(station)
        end

        local REFILL_SPEED = 800
        local function TweenToPos(root, targetPos)
            local dist = (root.Position - targetPos).Magnitude
            local t = math.clamp(dist / REFILL_SPEED, 0.1, 6)
            local ok, tw = pcall(function()
                return game:GetService("TweenService"):Create(
                    root,
                    TweenInfo.new(t, Enum.EasingStyle.Linear),
                    { CFrame = CFrame.new(targetPos) }
                )
            end)
            if not ok or not tw then
                pcall(function() root.CFrame = CFrame.new(targetPos) end)
                return
            end
            local vel = game:GetService("RunService").Heartbeat:Connect(function()
                pcall(function() root.AssemblyLinearVelocity = Vector3.zero end)
            end)
            tw:Play()
            local t0 = os.clock()
            while os.clock() - t0 < t + 0.3 and tw.PlaybackState == Enum.PlaybackState.Playing and Alive() do
                task.wait()
            end
            pcall(function() tw:Cancel() end)
            vel:Disconnect()
        end

        local isMobile = game:GetService("UserInputService").TouchEnabled
        local refillsBefore = RefillsLeft()
        local function Done()
            if not (NeedBlade() or NeedThunder()) then return true end
            local now = RefillsLeft()
            return refillsBefore ~= nil and now ~= nil and now < refillsBefore
        end
        local function WaitDone(sec)
            local t0 = os.clock()
            while os.clock() - t0 < sec do
                if Done() then return true end
                task.wait(0.2)
            end
            return Done()
        end

        for attempt = 1, TRIES do
            local char = LocalPlayer.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if not (root and hum and hum.Health > 0) then break end

            local station = NearestStation(root)
            if not station then Status = "Refill station not found" break end

            Log(string.format("reason | spears=%s stuck=%s bladeNeed=%s refills=%s mobile=%s station=%s",
                tostring(Farm.SpearsLeft and Farm.SpearsLeft()), tostring(Farm.SpearStuck and Farm.SpearStuck()),
                tostring(NeedBladeRaw()), tostring(RefillsLeft()), tostring(isMobile), station:GetFullName()))

            Status = ("Refilling (%d/%d) remote"):format(attempt, TRIES)
            pcall(function() post:FireServer("Attacks", "Reload", station) end)
            if WaitDone(2.5) then
                Status = "Refilled"
                Log("ok | remote")
                Farm.Refilling = false
                return true
            end

            Status = ("Refilling (%d/%d) at station"):format(attempt, TRIES)
            local prompt = PromptOf(station)
            local back = root.CFrame
            local pos = PromptPos(prompt, station)
            Farm.Refilling = true
            if pos then
                TweenToPos(root, pos + Vector3.new(0, 3, 0))
                task.wait(0.3)
            end
            if prompt then
                PressPrompt(prompt)
            else
                PressRKey(nil)
            end
            task.wait(0.4)
            pcall(function() post:FireServer("Attacks", "Reload", station) end)
            local done = WaitDone(CHECK_WAIT)
            local r = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if r then TweenToPos(r, back.Position) end
            Farm.Refilling = false
            if done then
                Status = "Refilled"
                Log("ok | at station | prompt=" .. tostring(prompt ~= nil))
                return true
            end
            Status = "Refill failed, retrying"
            Log(("failed attempt %d | prompt=%s refills=%s need=%s"):format(attempt, tostring(prompt ~= nil), tostring(RefillsLeft()), tostring(NeedBlade() or NeedThunder())))
        end

        Farm.Refilling = false
        return false
    end
    local WaveStatus = "Off"
    Farm.WaveRefillStatus = function() return WaveStatus end
    local WAVE_COOLDOWN = 10
    local lastWaveRefill = -999
    local function WaveFolder()
        local u = workspace:FindFirstChild("Unclimbable")
        local o = u and u:FindFirstChild("Objective")
        return o and o:FindFirstChild("Waves")
    end
    local function WaveNeed()
        if Cfg.AutoFarmThunder or Cfg.UseThunderSpears then return NeedThunderRaw() end
        return NeedBladeRaw()
    end
    local function PromptOf(station)
        local p = station:FindFirstChildWhichIsA("ProximityPrompt", true)
        if not p and station.Parent then p = station.Parent:FindFirstChildWhichIsA("ProximityPrompt", true) end
        return p
    end
    local function PromptPos(prompt, station)
        local par = prompt and prompt.Parent
        if par and par:IsA("BasePart") then return par.Position end
        if par and par:IsA("Attachment") then return par.WorldPosition end
        return PosOf(station)
    end
    local WAVE_SPEED = 1000
    local function TweenTo(root, cf)
        local dist = (root.Position - cf.Position).Magnitude
        local t = math.clamp(dist / WAVE_SPEED, 0.15, 8)
        local ok, tw = pcall(function()
            return game:GetService("TweenService"):Create(root, TweenInfo.new(t, Enum.EasingStyle.Linear), { CFrame = cf })
        end)
        if not ok or not tw then
            pcall(function() root.CFrame = cf end)
            return
        end
        local vel = game:GetService("RunService").Heartbeat:Connect(function()
            pcall(function() root.AssemblyLinearVelocity = Vector3.zero end)
        end)
        tw:Play()
        local t0 = os.clock()
        while os.clock() - t0 < t + 0.3 and tw.PlaybackState == Enum.PlaybackState.Playing and Alive() do
            task.wait()
        end
        pcall(function() tw:Cancel() end)
        vel:Disconnect()
    end
    local function PromptCount(prompt)
        if not prompt then return nil end
        local txt = tostring(prompt.ObjectText or "") .. " " .. tostring(prompt.ActionText or "")
        local n = txt:match("(%d+)%s*/%s*%d+")
        return n and tonumber(n) or nil
    end
    local function PressPrompt(prompt)
        if type(fireproximityprompt) == "function" then
            if pcall(fireproximityprompt, prompt) then return end
        end
        pcall(function()
            prompt:InputHoldBegin()
            task.wait((prompt.HoldDuration or 0) + 0.15)
            prompt:InputHoldEnd()
        end)
    end
    local function PressR(prompt)
        local hold = (prompt and prompt.HoldDuration or 0) + 0.2
        local VIM = game:GetService("VirtualInputManager")
        pcall(function() VIM:SendKeyEvent(true, Enum.KeyCode.R, false, game) end)
        task.wait(hold)
        pcall(function() VIM:SendKeyEvent(false, Enum.KeyCode.R, false, game) end)
    end
    local function DoWaveRefill()
        local folder = WaveFolder()
        if not folder then WaveStatus = "Not in wave mode" return false end
        local list = Collect(folder)
        local post = nil
        pcall(function() post = game:GetService("ReplicatedStorage").Assets.Remotes:FindFirstChild("POST") end)
        local success = false
        for attempt = 1, 3 do
            local char = LocalPlayer.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if not (root and hum and hum.Health > 0) then break end
            local station, bestD = nil, math.huge
            for _, st in ipairs(list) do
                local pos = st.Parent and PosOf(st)
                if pos then
                    local d = (pos - root.Position).Magnitude
                    if d < bestD then station, bestD = st, d end
                end
            end
            if not station then WaveStatus = "Wave refill station not found" break end
            local prompt = PromptOf(station)
            local pos = PromptPos(prompt, station)
            if not pos then WaveStatus = "Refill position not found" break end
            WaveStatus = ("Going to refill (%d/3)"):format(attempt)
            local back = root.CFrame
            Farm.Refilling = true
            TweenTo(root, CFrame.new(pos + Vector3.new(0, 3, 0)))
            task.wait(0.2)
            WaveStatus = ("Refilling (%d/3)"):format(attempt)
            local before = PromptCount(prompt)
            Log(string.format("wave refill #%d via %s | prompt=%s Refills=%s | %s", attempt,
                attempt == 1 and "prompt" or (attempt == 2 and "key R" or "remote"),
                tostring(prompt ~= nil), tostring(LocalPlayer:GetAttribute("Refills")), station:GetFullName()))
            if attempt == 1 then
                if prompt then PressPrompt(prompt) else PressR(nil) end
            elseif attempt == 2 then
                PressR(prompt)
            elseif post then
                pcall(function() post:FireServer("Attacks", "Reload", station) end)
            end
            local t1 = os.clock()
            while os.clock() - t1 < 5 and WaveNeed() do task.wait(0.2) end
            local still = WaveNeed()
            local after = PromptCount(prompt)
            if still and before ~= nil and after ~= nil and after < before then
                task.wait(2)
                still = WaveNeed()
            end
            local r = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if r then TweenTo(r, back) end
            Farm.Refilling = false
            if not still then
                WaveStatus = "Refilled"
                success = true
                break
            end
            WaveStatus = "Refill failed, retrying"
        end
        Farm.Refilling = false
        return success
    end
    task.spawn(function()
        local since = nil
        local failStreak = 0
        local npcBusySince = nil
        while Alive() do
            task.wait(0.4)
            if Farm.NpcBusy then
                npcBusySince = npcBusySince or os.clock()
                if os.clock() - npcBusySince > 90 and Cfg.AutoRefillWave and SH.PlayOn() and WaveNeed() then
                    Log("wave refill: NpcBusy stuck on " .. tostring(Farm.NpcCurrent) .. " for 90s, releasing")
                    pcall(function() Farm.NpcRelease() end)
                    npcBusySince = nil
                end
            else
                npcBusySince = nil
            end
            local okLoop, errLoop = pcall(function()
                if not (Cfg.AutoRefillWave and SH.PlayOn()) then
                    WaveStatus = "Off"
                    since = nil
                    failStreak = 0
                elseif not Farm.CanUseHere() or not WaveFolder() then
                    WaveStatus = "Waiting for wave mode"
                    since = nil
                elseif WaveNeed() then
                    since = since or os.clock()
                    if os.clock() - since >= EMPTY_WAIT and os.clock() - lastWaveRefill >= WAVE_COOLDOWN and not Farm.NpcBusy then
                        local ok = DoWaveRefill()
                        if ok then
                            failStreak = 0
                            lastWaveRefill = os.clock()
                            since = nil
                        else
                            failStreak += 1
                            if failStreak >= 3 then
                                lastWaveRefill = os.clock() - WAVE_COOLDOWN + 30
                                WaveStatus = ("Refill failed x%d (Refills=%s), retry in 30s"):format(failStreak, tostring(LocalPlayer:GetAttribute("Refills")))
                                Log("wave refill failed x" .. failStreak .. " Refills=" .. tostring(LocalPlayer:GetAttribute("Refills")))
                            else
                                lastWaveRefill = os.clock() - WAVE_COOLDOWN + 3
                            end
                            since = os.clock() - EMPTY_WAIT
                        end
                    end
                else
                    since = nil
                    failStreak = 0
                    if WaveStatus ~= "Refilled" then WaveStatus = "Ready" end
                end
            end)
            if not okLoop then
                Farm.Refilling = false
                WaveStatus = "Error, retrying"
                lastWaveRefill = os.clock() - WAVE_COOLDOWN + 3
                Log("wave refill error: " .. tostring(errLoop))
                task.wait(1)
            end
        end
    end)
    task.spawn(function()
        local lastLog = 0
        while Alive() do
            task.wait(1)
            if Cfg.AutoRefillsBlade and os.clock() - lastLog >= 3 then
                local empty = Farm.BladesEmpty and Farm.BladesEmpty()
                local spare = SpareLeft()
                if empty or spare == 0 then
                    lastLog = os.clock()
                    print(string.format("[AotrUpdate5][RefillCheck] empty=%s spare=%s need=%s refills=%s actorFresh=%s seg=%s rel=%s canUse=%s status=%s",
                        tostring(empty), tostring(spare), tostring(NeedBlade()), tostring(LocalPlayer:GetAttribute("Refills")),
                        tostring(Farm.ActorActive and Farm.ActorActive()), tostring(LocalPlayer:GetAttribute("SH_Segments")),
                        tostring(LocalPlayer:GetAttribute("SH_Reloads")), tostring(Farm.CanUseHere()), tostring(Status)))
                end
            end
        end
    end)
    task.spawn(function()
        local since = nil
        while Alive() do
            task.wait(0.4)
            if Farm.CanUseHere() and not (Cfg.AutoRefillWave and SH.PlayOn() and WaveFolder()) and (NeedBlade() or NeedThunder()) then
                since = since or os.clock()
                if os.clock() - since >= EMPTY_WAIT and os.clock() - lastRefill >= COOLDOWN then
                    local left = RefillsLeft()
                    if left ~= nil and left <= 0 then
                        Status = "No Refills left"
                        since = os.clock() + 30
                    else
                        local okRefill = DoRefill()
                        lastRefill = os.clock() - (okRefill and 0 or (COOLDOWN - RETRY_AFTER_FAIL))
                        since = nil
                    end
                end
            else
                since = nil
                if Status ~= "Idle" and not Farm.Refilling then Status = "Idle" end
            end
        end
    end)
end
do
    local LOBBY_PLACE_ID = 14916516914
    local CHECK_INTERVAL = 1.0
    local SCAN_INTERVAL = 2.0
    local CONFIRM_TIME = 1.5
    local GONE_TIME = 3.0
    local MAX_RETRY_TRIES = 4
    local RETRY_GAP = 3
    local MAX_LEAVE_TRIES = 2
    local LEAVE_GAP = 12
    local CALL_TIMEOUT = 8
    local function Status(text)
        if Farm.SetRetryStatus then Farm.SetRetryStatus(text) end
    end
    local function CanUseHere()
        return not IN_MENU and game.PlaceId ~= LOBBY_PLACE_ID
    end
    local function CleanText(o)
        local t = (o.Text or ""):gsub("<[^>]->", "")
        t = t:gsub("^%s+", ""):gsub("%s+$", "")
        return t
    end
    local function IsShownGui(obj)
        local cur = obj
        while cur and cur ~= PlayerGui do
            if cur:IsA("GuiObject") and not cur.Visible then return false end
            if cur:IsA("ScreenGui") and not cur.Enabled then return false end
            cur = cur.Parent
        end
        return obj:IsA("GuiObject") and obj.AbsoluteSize.X > 0 and obj.AbsoluteSize.Y > 0
    end
    local titleLabel, scanAt = nil, 0
    local function FindCompleteTitle()
        if titleLabel and titleLabel.Parent then
            return IsShownGui(titleLabel) and titleLabel or nil
        end
        titleLabel = nil
        if os.clock() - scanAt < SCAN_INTERVAL then return nil end
        scanAt = os.clock()
        local n = 0
        for _, d in ipairs(PlayerGui:GetDescendants()) do
            n += 1
            if n % 800 == 0 then task.wait() end
            if (d:IsA("TextLabel") or d:IsA("TextButton")) and CleanText(d):upper() == "MISSION COMPLETED" then
                titleLabel = d
                return IsShownGui(d) and d or nil
            end
        end
        return nil
    end
    Farm.CompleteScreenShown = function() return FindCompleteTitle() ~= nil end
    local function FindButtonText(title, pattern)
        local cur = title.Parent
        for _ = 1, 8 do
            if not cur or cur == PlayerGui then break end
            for _, d in ipairs(cur:GetDescendants()) do
                if (d:IsA("TextLabel") or d:IsA("TextButton")) and CleanText(d):upper():match(pattern) and IsShownGui(d) then
                    return d
                end
            end
            cur = cur.Parent
        end
        return nil
    end
    local function ClickableFor(label)
        if label:IsA("GuiButton") then return label end
        local cur = label.Parent
        for _ = 1, 3 do
            if not cur or cur == PlayerGui then break end
            if cur:IsA("GuiButton") then return cur end
            cur = cur.Parent
        end
        local c = label.AbsolutePosition + label.AbsoluteSize / 2
        local best, bestArea = nil, math.huge
        for _, d in ipairs(PlayerGui:GetDescendants()) do
            if d:IsA("GuiButton") and IsShownGui(d) then
                local pos, size = d.AbsolutePosition, d.AbsoluteSize
                if c.X >= pos.X and c.X <= pos.X + size.X and c.Y >= pos.Y and c.Y <= pos.Y + size.Y then
                    local area = size.X * size.Y
                    if area < bestArea then best, bestArea = d, area end
                end
            end
        end
        return best
    end
    local function ClickRetry(label, attempt)
        local btn = ClickableFor(label)
        if not btn then return false, "clickable not found" end
        local method = (attempt - 1) % 3 + 1
        if method == 1 and type(firesignal) ~= "function" then method = 2 end
        if method == 1 then
            pcall(firesignal, btn.Activated)
            pcall(firesignal, btn.MouseButton1Click)
        elseif method == 2 then
            local gui = btn:FindFirstAncestorOfClass("ScreenGui")
            local inset = (gui and gui.IgnoreGuiInset) and Vector2.zero or GuiService:GetGuiInset()
            local pos = btn.AbsolutePosition + btn.AbsoluteSize / 2 + inset
            pcall(function()
                VirtualInputManager:SendMouseMoveEvent(pos.X, pos.Y, game)
                task.wait(0.05)
                VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, true, game, 0)
                task.wait(0.06)
                VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, false, game, 0)
            end)
        else
            pcall(function() GuiService.SelectedObject = btn end)
            task.wait(0.1)
            pcall(function()
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                task.wait(0.05)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
            end)
            task.wait(0.1)
            pcall(function() GuiService.SelectedObject = nil end)
        end
        return true, "method " .. method
    end
    local postRemote = nil
    local function FireLeave()
        if not postRemote or not postRemote.Parent then
            local ok, r = pcall(function()
                return game:GetService("ReplicatedStorage").Assets.Remotes:WaitForChild("POST", 5)
            end)
            postRemote = ok and r or nil
        end
        if not postRemote then return false, "remote not found" end
        return pcall(function() postRemote:FireServer("Functions", "Teleport") end)
    end
    function Farm.RefreshRetry()
        if Farm.SetRetry then Farm.SetRetry(Cfg.RetryDone) end
    end
    function Farm.ResetRetry()
        Cfg.RetryDone = 0
        Save()
        Farm.RefreshRetry()
    end
    function Farm.OnAutoRetry(on)
        if not on and Cfg.RetryDone ~= 0 then Farm.ResetRetry() end
    end
    local function TurnOffOther(key)
        if Cfg[key] then
            Cfg[key] = false
            Save()
            local ctl = Farm.Toggles and Farm.Toggles[key]
            if ctl then pcall(function() ctl.Value = false end) end
        end
    end
    function Farm.OnAutoLeave(on)
        if on then TurnOffOther("AutoLeaveWhenRetryComplete") end
    end
    function Farm.OnAutoLeaveWhenRetryComplete(on)
        if on then TurnOffOther("AutoLeave") end
    end
    if not CanUseHere() and Cfg.RetryDone ~= 0 then
        Cfg.RetryDone = 0
        Save()
    end
    Farm.RefreshRetry()
    task.spawn(function()
        local seenSince, goneSince = nil, nil
        local tries, lastTry, counted = 0, 0, false
        local leaveTries, lastLeave = 0, 0
        local screenMode = nil
        local function ResetScreenState()
            seenSince, goneSince = nil, nil
            tries, lastTry, counted = 0, 0, false
            leaveTries, lastLeave = 0, 0
            screenMode = nil
        end
        local function DoLeave(title, why)
            screenMode = "leave"
            if leaveTries >= MAX_LEAVE_TRIES or (leaveTries > 0 and os.clock() - lastLeave < LEAVE_GAP) then
                Status("Leave sent - waiting for the game")
                return
            end
            if not FindButtonText(title, "^LEAVE") then
                Status("Leave button not found")
                return
            end
            leaveTries += 1
            lastLeave = os.clock()
            Status("Leaving... (" .. why .. ")")
            local ok, err = FireLeave()
            if Farm.Debug then SH.dbg("[AotrUpdate5] Leave fired:", ok, err) end
            if ok then
                Status("Leave sent (" .. why .. ")")
                if Cfg.RetryDone ~= 0 then Farm.ResetRetry() end
            else
                Status("Leave failed: " .. tostring(err))
            end
        end
        local function Progress(done)
            if Cfg.AutoLeaveWhenRetryComplete then
                return ("%d/%d"):format(done, Cfg.RetryAmount)
            end
            return tostring(done) .. " / endless"
        end
        local function DoRetry(title)
            if tries >= MAX_RETRY_TRIES or (tries > 0 and os.clock() - lastTry < RETRY_GAP) then
                Status("Retry sent - waiting for the game")
                return
            end
            local btn = FindButtonText(title, "^RETRY")
            if not btn then
                Status("Retry button not found")
                return
            end
            local have, need = CleanText(btn):match("(%d+)%s*/%s*(%d+)")
            have, need = tonumber(have), tonumber(need)
            if have and need and have >= need then
                Status("Retry vote already in")
                tries = MAX_RETRY_TRIES
                return
            end
            tries += 1
            lastTry = os.clock()
            Status("Clicking Retry... (" .. Progress(Cfg.RetryDone + (counted and 0 or 1)) .. ")")
            local ok, r = ClickRetry(btn, tries)
            if Farm.Debug then SH.dbg("[AotrUpdate5] Retry click:", ok, r) end
            if not ok then
                Status("Retry click failed: " .. tostring(r))
                return
            end
            task.wait(1)
            local after = FindButtonText(title, "^RETRY")
            local h2 = after and tonumber((CleanText(after):match("(%d+)%s*/%s*%d+")))
            local voted = (not after) or (h2 and have and h2 > have)
            if voted then
                tries = MAX_RETRY_TRIES
                if not counted then
                    counted = true
                    Cfg.RetryDone += 1
                    Save()
                    Farm.RefreshRetry()
                end
                Status("Retry clicked (" .. Progress(Cfg.RetryDone) .. ")")
            else
                Status("Click not registered - trying another method")
            end
        end
        while Alive() do
            task.wait(CHECK_INTERVAL)
            if not (Cfg.AutoRetry or Cfg.AutoLeave or Cfg.AutoLeaveWhenRetryComplete) then
                ResetScreenState()
                Status("Off")
            elseif not CanUseHere() then
                ResetScreenState()
                Status("Not available in the lobby / menu")
            else
                local title = FindCompleteTitle()
                if not title then
                    goneSince = goneSince or os.clock()
                    if os.clock() - goneSince >= GONE_TIME then ResetScreenState() end
                    if not seenSince then
                        if Cfg.AutoRetry then
                            Status("Waiting for the mission to finish (" .. Progress(Cfg.RetryDone) .. ")")
                        else
                            Status("Waiting for the mission to finish")
                        end
                    end
                else
                    goneSince = nil
                    seenSince = seenSince or os.clock()
                    if os.clock() - seenSince < CONFIRM_TIME then
                        Status("Mission completed - preparing")
                    elseif screenMode == "leave" or Cfg.AutoLeave then
                        DoLeave(title, "Auto Leave")
                    elseif Cfg.AutoRetry then
                        if Cfg.AutoLeaveWhenRetryComplete and Cfg.RetryDone >= Cfg.RetryAmount then
                            DoLeave(title, ("after %d matches"):format(Cfg.RetryAmount))
                        else
                            DoRetry(title)
                        end
                    else
                        Status("Auto Leave After X Matches needs Auto Retry")
                    end
                end
            end
        end
    end)
end
do
    -- ============================================================
    -- ============================================================
    local TICK = 0.5
    local COUNT_AFTER = 1.0
    local GONE_AFTER = 3.0
    local winSince, goneSince, winCounted = nil, nil, false
    local lastHum, diedConn = nil, nil
    Farm.FailSafeActive = false

    local function Armed()
        local at = Cfg.FailSafeAt or 0
        return Cfg.AutoFailSafe and at > 0 and (Cfg.Streak or 0) >= at
    end
    local function Say(text)
        if Farm.SetFailSafeStatus then Farm.SetFailSafeStatus(text) end
    end
    local function ResetStreak(why)
        Cfg.Streak = 0
        Save()
        Farm.RefreshStreak()
        Farm.FailSafeActive = false
        winCounted = false
        Say("Streak reset (" .. why .. ")")
        if Farm.Debug then SH.dbg("[AotrUpdate5] Fail Safe: streak reset -", why) end
    end
    local function DumpScreenTexts()
        local out = {}
        for _, d in ipairs(PlayerGui:GetDescendants()) do
            if d:IsA("TextLabel") and d.Visible and d.AbsoluteSize.X > 0 then
                local t = tostring(d.Text or ""):gsub("<[^>]->", ""):gsub("^%s+", ""):gsub("%s+$", "")
                if #t >= 4 and #t <= 40 and t:upper() == t and t:match("%a%a%a") then out[#out + 1] = t end
            end
        end
        print("[AotrUpdate5][FailSafe] visible titles after death: " .. table.concat(out, " | "))
    end

    function Farm.OnFailSafeAt() Farm.RefreshStreak() end
    function Farm.OnAutoFailSafe(on)
        if not on then
            Farm.FailSafeActive = false
            Say("Off")
        end
    end

    local function HookDeath()
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum == lastHum then return end
        if diedConn then pcall(function() diedConn:Disconnect() end) diedConn = nil end
        lastHum = hum
        if hum then
            diedConn = hum.Died:Connect(function()
                if Farm.FailSafeActive then
                    task.defer(DumpScreenTexts)
                    ResetStreak("lost on purpose")
                end
            end)
        end
    end

    task.spawn(function()
        while Alive() do
            task.wait(TICK)
            if not Cfg.AutoFailSafe or (Cfg.FailSafeAt or 0) <= 0 then
                Farm.FailSafeActive = false
                winSince, goneSince, winCounted = nil, nil, false
                Say(Cfg.AutoFailSafe and "Off (Fail Safe At = 0)" or "Off")
            elseif not Farm.CanUseHere() then
                Farm.FailSafeActive = false
                winSince, goneSince, winCounted = nil, nil, false
                Say("Waiting for a match")
            else
                HookDeath()
                local shown = Farm.CompleteScreenShown and Farm.CompleteScreenShown() or false
                if shown then
                    goneSince = nil
                    winSince = winSince or os.clock()
                    Farm.FailSafeActive = false
                    if not winCounted and os.clock() - winSince >= COUNT_AFTER then
                        winCounted = true
                        Cfg.Streak = (Cfg.Streak or 0) + 1
                        Save()
                        Farm.RefreshStreak()
                        if Farm.Debug then SH.dbg("[AotrUpdate5] Fail Safe: win counted, streak", Cfg.Streak) end
                    end
                    Say(("Win streak %d / %d"):format(Cfg.Streak or 0, Cfg.FailSafeAt))
                else
                    winSince = nil
                    goneSince = goneSince or os.clock()
                    if os.clock() - goneSince >= GONE_AFTER then winCounted = false end
                    local armed = Armed()
                    Farm.FailSafeActive = armed
                    if armed then
                        Say("LOSING ON PURPOSE - standing still, waiting for a titan")
                    else
                        Say(("Win streak %d / %d"):format(Cfg.Streak or 0, Cfg.FailSafeAt))
                    end
                end
            end
        end
        Farm.FailSafeActive = false
    end)
end
local AutoQuestTab = MainCategory:Tab({
    Title = "Auto Quest",
    Icon = Icon("scrollFill", "checklist"),
})
local AutoQuestSection = AutoQuestTab:PageSection({
    Title = "🛠️ Auto Quest [ Thunder Spear ]",
    Subtitle = "Core features and settings"
})
SH.Guard("auto-quest-thunder", function()
    local Form = AutoQuestSection:Form()
    local function AddEmptyToggle(title, subtitle, key)
        local row = Form:Row()
        row:Left():TitleStack({ Title = title, Subtitle = subtitle })
        UiSync.Link(row:Right():Toggle({
            Value = Cfg[key],
            ValueChanged = function(self, value)
                Cfg[key] = value and true or false
                Save()
            end
        }), Cfg, key)
    end
    AddEmptyToggle("Enable", nil, "AutoQuestThunder")
    AddEmptyToggle("Auto Quest [ Thunder Spear ] Round ( 1 )", "Auto-does Round 1: stand on the 3 watchtowers. Needs Prestige 1+ and Level 80+.", "AutoQuestThunderR1")
    AddEmptyToggle("Auto Quest [ Thunder Spear ] Round ( 2 )", "Auto-does Round 2: carry the 3 supply crates. Needs Prestige 1+ and Level 80+.", "AutoQuestThunderR2")
    AddEmptyToggle("Auto Quest [ Thunder Spear ] Round ( 3 )", "Auto-does Round 3: plays 3 games, then turns itself off. Needs Prestige 1+ and Level 80+.", "AutoQuestThunderR3")
    local QDetail = { text = nil, color = "yellow", where = nil }
    local function QS(text, color)
        QDetail.text = text
        QDetail.color = color or "yellow"
        QDetail.where = Farm.CanUseHere() and "match" or "lobby"
    end

    -- ============================================================
    -- ============================================================
    local RunService = game:GetService("RunService")
    local TWEEN_SPEED = 300
    local TOWER_COUNT = 3
    local STAND_UP = 3

    local function R1On() return Alive() and Cfg.AutoQuestThunderR1 end
    local function MyRoot()
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if root and hum and hum.Health > 0 then return root end
        return nil
    end
    local function SetFlag(key, value)
        Cfg[key] = value
        local ctl = Farm.Toggles and Farm.Toggles[key]
        if ctl then pcall(function() ctl.Value = value end) end
    end
    local function MoveTo(pos, on)
        on = on or R1On
        local root = MyRoot()
        if not root then return end
        pcall(function() LocalPlayer:RequestStreamAroundAsync(pos, 0.5) end)
        local cf = CFrame.new(pos) * root.CFrame.Rotation
        local t = math.max((root.Position - pos).Magnitude / TWEEN_SPEED, 0.1)
        local ok, tw = pcall(function()
            return game:GetService("TweenService"):Create(root, TweenInfo.new(t, Enum.EasingStyle.Linear), { CFrame = cf })
        end)
        if not ok or not tw then pcall(function() root.CFrame = cf end) return end
        local vel = RunService.Heartbeat:Connect(function()
            pcall(function() root.AssemblyLinearVelocity = Vector3.zero end)
        end)
        tw:Play()
        local t0 = os.clock()
        while os.clock() - t0 < t + 0.3 and tw.PlaybackState == Enum.PlaybackState.Playing and on() do task.wait() end
        pcall(function() tw:Cancel() end)
        vel:Disconnect()
        if on() then pcall(function() root.CFrame = cf end) end
    end
    local function TowerPos(model)
        local part = model.PrimaryPart
        local base = part and part.Position or model:GetPivot().Position
        return base + Vector3.new(0, STAND_UP, 0)
    end
    local function IsShown(d)
        local cur = d
        while cur and cur ~= PlayerGui do
            if cur:IsA("GuiObject") and not cur.Visible then return false end
            if cur:IsA("ScreenGui") and not cur.Enabled then return false end
            cur = cur.Parent
        end
        return true
    end
    local function EscortStarted()
        local ok, found = pcall(function()
            for _, d in ipairs(PlayerGui:GetDescendants()) do
                if d:IsA("TextLabel") and d.Text ~= "" then
                    local low = d.Text:lower()
                    if (low:find("escort supplies", 1, true) or low:find("mortal convoy", 1, true)) and IsShown(d) then
                        return true
                    end
                end
            end
            return false
        end)
        return ok and found
    end
    local lastScan, escort = -math.huge, false
    local function TowerDone(n, model)
        if not model.Parent then return true end
        if n < TOWER_COUNT then
            return workspace:FindFirstChild("WatchTower_" .. (n + 1)) ~= nil
        end
        if os.clock() - lastScan >= 1 then
            lastScan = os.clock()
            escort = EscortStarted()
        end
        return escort
    end
    local function Hold(n, model)
        local vel = RunService.Heartbeat:Connect(function()
            local root = MyRoot()
            if root then pcall(function() root.AssemblyLinearVelocity = Vector3.zero end) end
        end)
        lastScan, escort = -math.huge, false
        while R1On() and not TowerDone(n, model) do
            local root = MyRoot()
            if root and model.Parent then
                local target = TowerPos(model)
                local off = root.Position - target
                if Vector3.new(off.X, 0, off.Z).Magnitude > 12 or math.abs(off.Y) > 10 then MoveTo(target) end
            end
            task.wait(0.25)
        end
        vel:Disconnect()
    end
    local function RunRound1()
        SH.QuestHold = true
        local was = { AutoFarm = Cfg.AutoFarm, AutoFarmThunder = Cfg.AutoFarmThunder, AutoClearWave = Cfg.AutoClearWave }
        for k, v in pairs(was) do if v then SetFlag(k, false) end end
        local completed = false
        local ok, err = pcall(function()
            for n = 1, TOWER_COUNT do
                local model
                while R1On() do
                    model = workspace:FindFirstChild("WatchTower_" .. n)
                    if model then break end
                    if not workspace:FindFirstChild("WatchTower_1") then return end
                    QS(("Waiting for tower %d/%d"):format(n, TOWER_COUNT))
                    task.wait(0.5)
                end
                if not (R1On() and model) then return end
                QS(("Tower %d/%d: moving"):format(n, TOWER_COUNT))
                MoveTo(TowerPos(model))
                QS(("Tower %d/%d: holding position"):format(n, TOWER_COUNT))
                Hold(n, model)
                if not R1On() then return end
            end
            completed = true
            QS("All towers done - escort started", "green")
        end)
        if not ok then SH.dbg("[AotrUpdate5][Quest R1]", err) end
        for k, v in pairs(was) do if v then SetFlag(k, true) end end
        SH.QuestHold = false
        return completed
    end
    task.spawn(function()
        while Alive() do
            task.wait(1)
            if Cfg.AutoQuestThunderR1 and Farm.CanUseHere() and workspace:FindFirstChild("WatchTower_1") then
                local ok, completed = pcall(RunRound1)
                if ok and completed then
                    while R1On() and workspace:FindFirstChild("WatchTower_1") do task.wait(1) end
                end
            end
        end
    end)

    -- ============================================================
    -- ============================================================
    local function R2On() return Alive() and Cfg.AutoQuestThunderR2 end
    local CRATE_COUNT = 3
    local CRATE_UP = 3
    local R2_DROP_POS = Vector3.new(92.71, 24.14, -306.95)
    local R2 = { spawnPos = nil, dropPos = nil, forcedRetry = false }
    SH.QuestR2 = R2

    local function CrateModel(n)
        return workspace:FindFirstChild("ThunderSpear_Supplies" .. n, true)
    end
    local function PosOfInst(inst)
        if not inst then return nil end
        if inst:IsA("BasePart") then return inst.Position end
        if inst:IsA("Attachment") then return inst.WorldPosition end
        if inst:IsA("Model") then
            local ok, cf = pcall(function() return inst:GetPivot() end)
            if ok and cf then return cf.Position end
        end
        local part = inst:FindFirstChildWhichIsA("BasePart", true)
        return part and part.Position or nil
    end
    local function PromptWorldPos(prompt)
        local par = prompt and prompt.Parent
        return PosOfInst(par)
    end
    local function PressPrompt(prompt)
        local done = false
        if type(fireproximityprompt) == "function" then
            done = pcall(fireproximityprompt, prompt)
        end
        if not done then
            pcall(function()
                prompt:InputHoldBegin()
                task.wait((prompt.HoldDuration or 0) + 0.15)
                prompt:InputHoldEnd()
            end)
        end
        local key = Enum.KeyCode.E
        pcall(function() if prompt.KeyboardKeyCode ~= Enum.KeyCode.Unknown then key = prompt.KeyboardKeyCode end end)
        local VIM = game:GetService("VirtualInputManager")
        pcall(function() VIM:SendKeyEvent(true, key, false, game) end)
        task.wait((prompt.HoldDuration or 0) + 0.2)
        pcall(function() VIM:SendKeyEvent(false, key, false, game) end)
    end
    local function CratePrompt(crate)
        if not crate then return nil end
        local p = crate:FindFirstChildWhichIsA("ProximityPrompt", true)
        if not p and crate.Parent then p = crate.Parent:FindFirstChildWhichIsA("ProximityPrompt", true) end
        return p
    end
    local CARRY_DIST = 12
    local origPos = {}
    local function CrateOrig(n)
        if not origPos[n] then
            local p = PosOfInst(CrateModel(n))
            if p then origPos[n] = p end
        end
        return origPos[n]
    end
    local function AttachedToChar(crate, char)
        local function linked(d)
            if d:IsA("JointInstance") or d:IsA("WeldConstraint") then
                local p0, p1 = d.Part0, d.Part1
                if p0 and p1 then
                    return (p0:IsDescendantOf(crate) and p1:IsDescendantOf(char))
                        or (p1:IsDescendantOf(crate) and p0:IsDescendantOf(char))
                end
            end
            return false
        end
        for _, d in ipairs(crate:GetDescendants()) do if linked(d) then return true end end
        for _, d in ipairs(char:GetDescendants()) do if linked(d) then return true end end
        return false
    end
    local function Carrying(n)
        local char, root = LocalPlayer.Character, MyRoot()
        local crate = CrateModel(n)
        if not (char and root and crate and crate.Parent) then return false end
        if crate:IsDescendantOf(char) then return true end
        if AttachedToChar(crate, char) then return true end
        local pos, orig = PosOfInst(crate), origPos[n]
        if pos and orig and (pos - orig).Magnitude > 4 and (pos - root.Position).Magnitude <= CARRY_DIST then
            return true
        end
        return false
    end
    local function NearestDropPrompt(center, radius)
        local best, bestD = nil, radius
        for _, d in ipairs(workspace:GetDescendants()) do
            if d:IsA("ProximityPrompt") and d.Enabled then
                local p = PromptWorldPos(d)
                if p then
                    local dist = (p - center).Magnitude
                    if dist < bestD then best, bestD = d, dist end
                end
            end
        end
        return best
    end

    local function PickUp(n)
        local crate = CrateModel(n)
        if not crate then return false end
        local pos = CrateOrig(n) or PosOfInst(crate)
        if not pos then return false end
        MoveTo(pos + Vector3.new(0, CRATE_UP, 0), R2On)
        for attempt = 1, 4 do
            if not R2On() then return false end
            if Carrying(n) then return true end
            crate = CrateModel(n)
            if not crate then return false end
            local prompt = CratePrompt(crate)
            if prompt then PressPrompt(prompt) end
            local t0 = os.clock()
            while R2On() and os.clock() - t0 < 2 do
                if Carrying(n) then return true end
                task.wait(0.15)
            end
            local root = MyRoot()
            local cp = PosOfInst(CrateModel(n))
            if root and cp and (root.Position - cp).Magnitude > 8 then
                MoveTo(cp + Vector3.new(0, CRATE_UP, 0), R2On)
            end
        end
        return false
    end

    local function IsYellow(c) return c.R > 0.75 and c.G > 0.65 and c.B < 0.6 end
    local function NearCrateOrigin(p)
        for n = 1, CRATE_COUNT do
            local o = origPos[n]
            if o and (o - p).Magnitude < 25 then return true end
        end
        return false
    end
    local function ZonePosOfPart(part)
        return part.Position - Vector3.new(0, part.Size.Y / 2, 0) + Vector3.new(0, CRATE_UP, 0)
    end
    local function FindDropZone()
        local char = LocalPlayer.Character
        local sc = workspace:FindFirstChild("Supplies_Circle", true)
        if sc then
            local parts = {}
            if sc:IsA("BasePart") then parts[1] = sc end
            for _, d in ipairs(sc:GetDescendants()) do if d:IsA("BasePart") then parts[#parts + 1] = d end end
            for _, part in ipairs(parts) do
                if not NearCrateOrigin(part.Position) then return ZonePosOfPart(part), "Supplies_Circle" end
            end
        end
        for _, d in ipairs(workspace:GetDescendants()) do
            if d:IsA("BasePart") and d.Transparency < 1 and (d.Size.X >= 15 or d.Size.Z >= 15)
                and IsYellow(d.Color) and not (char and d:IsDescendantOf(char)) and not NearCrateOrigin(d.Position) then
                return ZonePosOfPart(d), "yellow:" .. d:GetFullName()
            end
        end
        return nil
    end
    function R2.Dump()
        local out = {}
        local sc = workspace:FindFirstChild("Supplies_Circle", true)
        out[#out + 1] = "Supplies_Circle: " .. (sc and sc:GetFullName() or "not found")
        if sc then
            for _, d in ipairs(sc:GetDescendants()) do
                if d:IsA("BasePart") then
                    out[#out + 1] = ("  %s [%s] pos=%s size=%s color=%s transp=%.2f"):format(d:GetFullName(), d.ClassName, tostring(d.Position), tostring(d.Size), tostring(d.Color), d.Transparency)
                end
            end
        end
        for _, d in ipairs(workspace:GetDescendants()) do
            if d:IsA("BasePart") and d.Transparency < 1 and (d.Size.X >= 15 or d.Size.Z >= 15) and IsYellow(d.Color) then
                out[#out + 1] = ("yellow: %s pos=%s size=%s"):format(d:GetFullName(), tostring(d.Position), tostring(d.Size))
            end
        end
        local text = table.concat(out, "\n")
        print("[AotrUpdate5][R2 dump]\n" .. text)
        pcall(function() if setclipboard then setclipboard(text) end end)
        return text
    end

    local function CrateLeftBehind(n)
        local crate = CrateModel(n)
        if not (crate and crate.Parent) then return true end
        local root, cp = MyRoot(), PosOfInst(crate)
        if not (root and cp) then return false end
        return (cp - root.Position).Magnitude > CARRY_DIST + 3
    end
    local function DropAtSpawn(n)
        local target = R2_DROP_POS
        if not target then return false end
        for attempt = 1, 3 do
            if not R2On() then return false end
            MoveTo(target, R2On)
            local prompt = NearestDropPrompt(target, 40)
            if prompt then PressPrompt(prompt) end
            task.wait(1)
            MoveTo(target + Vector3.new(30, 0, 0), R2On)
            task.wait(0.3)
            if CrateLeftBehind(n) then return true end
        end
        return false
    end

    local function RunRound2()
        SH.QuestHold = true
        local was = { AutoFarm = Cfg.AutoFarm, AutoFarmThunder = Cfg.AutoFarmThunder, AutoClearWave = Cfg.AutoClearWave }
        for k, v in pairs(was) do if v then SetFlag(k, false) end end
        local completed = false
        local ok, err = pcall(function()
            if not R2.spawnPos then
                local root = MyRoot()
                if root then R2.spawnPos = root.Position end
            end
            for n = 1, CRATE_COUNT do CrateOrig(n) end
            for n = 1, CRATE_COUNT do
                if not R2On() then return end
                if CrateModel(n) then
                    QS(("Crate %d/%d: picking up"):format(n, CRATE_COUNT))
                    local picked = PickUp(n)
                    if not R2On() then return end
                    if picked then
                        QS(("Crate %d/%d: delivering"):format(n, CRATE_COUNT))
                        DropAtSpawn(n)
                    else
                        SH.say("Auto Quest Round (2): crate " .. n .. " pickup failed, skipping")
                    end
                end
            end
            completed = true
            QS("All crates delivered", "green")
        end)
        if not ok then SH.dbg("[AotrUpdate5][Quest R2]", err) end
        local anyOn = false
        for _, v in pairs(was) do if v then anyOn = true end end
        for k, v in pairs(was) do if v then SetFlag(k, true) end end
        if not anyOn and R2On() then SetFlag("AutoFarm", true) end
        SH.QuestHold = false
        return completed
    end

    task.spawn(function()
        while Alive() do
            task.wait(1)
            if Cfg.AutoQuestThunderR2 then
                if not Cfg.AutoRetry then
                    R2.forcedRetry = true
                    SetFlag("AutoRetry", true)
                end
            elseif R2.forcedRetry then
                R2.forcedRetry = false
                SetFlag("AutoRetry", false)
            end
            if Cfg.AutoQuestThunderR2 and Farm.CanUseHere() then
                if CrateModel(1) then
                    local ok, completed = pcall(RunRound2)
                    if ok and completed then
                        while R2On() and CrateModel(1) do task.wait(1) end
                        R2.spawnPos, R2.dropPos = nil, nil
                        origPos = {}
                    end
                else
                    R2.spawnPos, R2.dropPos = nil, nil
                    origPos = {}
                    local root = MyRoot()
                    if root then R2.spawnPos = root.Position end
                end
            end
        end
    end)

    -- ============================================================
    -- ============================================================
    local LOBBY_PLACE_ID = 14916516914
    if game.PlaceId == LOBBY_PLACE_ID then
        local R1_MAP, R1_DIFF, R1_OBJECTIVE = "Outskirts", "Aberrant", "Skirmish"
        local R1_MIN_PRESTIGE, R1_MIN_LEVEL = 1, 80
        local R1_START_DELAY = 5
        local function LobbyInvoke(...)
            local remote = GetLobbyRemote()
            if not remote then return false, "remote not found" end
            local args = table.pack(...)
            local done, ok, result = false, false, nil
            task.spawn(function()
                ok, result = pcall(function() return remote:InvokeServer(table.unpack(args, 1, args.n)) end)
                done = true
            end)
            local t0 = os.clock()
            while not done and os.clock() - t0 < 8 do task.wait(0.1) end
            if not done then return false, "timeout" end
            return ok, result
        end
        local function MyRoom()
            local folder = ReplicatedStorage:FindFirstChild("Missions")
            if not folder then return nil end
            for _, room in ipairs(folder:GetChildren()) do
                local leader = room:FindFirstChild("Leader")
                if leader and leader:IsA("ValueBase") and leader.Value == LocalPlayer.Name then return room end
            end
            return nil
        end
        local function DiffOf(room)
            local okV, v = pcall(function() return room.Value end)
            if okV and type(v) == "string" then return (v:match("^%s*(%a+)") or ""):lower() end
            return nil
        end
        local function R1Ready()
            local level = tonumber(LocalPlayer:GetAttribute("Level"))
            local prestige = tonumber(LocalPlayer:GetAttribute("Prestige")) or 0
            return level ~= nil and level >= R1_MIN_LEVEL and prestige >= R1_MIN_PRESTIGE
        end
        task.spawn(function()
            local roomRef = nil
            local startAt, lastStart, lastCreate = nil, -math.huge, -math.huge
            local warned = false
            task.wait(4)
            while Alive() do
                task.wait(0.5)
                if not Cfg.AutoQuestThunderR1 or Cfg.AutoQuestThunderR2 or Cfg.AutoQuestThunderR3 then
                    startAt, warned = nil, false
                elseif not R1Ready() then
                    startAt = nil
                    if not warned then
                        warned = true
                        SH.say("Auto Quest Round (1): needs Prestige 1+ and Level 80+")
                    end
                elseif SH.Coord.Blocker(100) then
                    startAt = nil
                    QS("Waiting: " .. tostring(SH.Coord.last))
                else
                    warned = false
                    local room = MyRoom() or ((roomRef and roomRef.Parent) and roomRef or nil)
                    if room and (room.Name ~= R1_MAP or DiffOf(room) ~= R1_DIFF:lower()) then
                        LobbyInvoke("S_Missions", "Leave")
                        roomRef, startAt = nil, nil
                        task.wait(0.8)
                    elseif not room then
                        if os.clock() - lastCreate >= 8 then
                            lastCreate = os.clock()
                            local ok, r = LobbyInvoke("S_Missions", "Create", {
                                Difficulty = R1_DIFF,
                                Type = "Missions",
                                Objective = R1_OBJECTIVE,
                                Name = R1_MAP,
                            })
                            if ok and r then
                                roomRef = (typeof(r) == "Instance") and r or nil
                                startAt = os.clock() + R1_START_DELAY
                                QS("Room created - starting soon")
                                SH.say("Auto Quest Round (1): room created (" .. R1_MAP .. " / " .. R1_DIFF .. "), starting in " .. R1_START_DELAY .. "s")
                            else
                                QS("Create room failed - retrying")
                                SH.say("Auto Quest Round (1): create failed - " .. tostring(r))
                            end
                        end
                    else
                        if not startAt then startAt = os.clock() + R1_START_DELAY end
                        if os.clock() >= startAt and os.clock() - lastStart >= 15 then
                            lastStart = os.clock()
                            local ok, r = LobbyInvoke("S_Missions", "Start")
                            SH.say(ok and "Auto Quest Round (1): start sent" or ("Auto Quest Round (1): start failed - " .. tostring(r)))
                            QS(ok and "Start sent - joining match" or "Start failed - retrying")
                        end
                    end
                end
            end
        end)
    end

    -- ============================================================
    -- ============================================================
    if game.PlaceId == 14916516914 then
        local R2_MAP, R2_DIFF, R2_OBJECTIVE = "Forest", "Aberrant", "Skirmish"
        local R2_MIN_PRESTIGE, R2_MIN_LEVEL = 1, 80
        local R2_START_DELAY = 5
        local function LobbyInvoke(...)
            local remote = GetLobbyRemote()
            if not remote then return false, "remote not found" end
            local args = table.pack(...)
            local done, ok, result = false, false, nil
            task.spawn(function()
                ok, result = pcall(function() return remote:InvokeServer(table.unpack(args, 1, args.n)) end)
                done = true
            end)
            local t0 = os.clock()
            while not done and os.clock() - t0 < 8 do task.wait(0.1) end
            if not done then return false, "timeout" end
            return ok, result
        end
        local function MyRoom()
            local folder = ReplicatedStorage:FindFirstChild("Missions")
            if not folder then return nil end
            for _, room in ipairs(folder:GetChildren()) do
                local leader = room:FindFirstChild("Leader")
                if leader and leader:IsA("ValueBase") and leader.Value == LocalPlayer.Name then return room end
            end
            return nil
        end
        local function DiffOf(room)
            local okV, v = pcall(function() return room.Value end)
            if okV and type(v) == "string" then return (v:match("^%s*(%a+)") or ""):lower() end
            return nil
        end
        local function R2Ready()
            local level = tonumber(LocalPlayer:GetAttribute("Level"))
            local prestige = tonumber(LocalPlayer:GetAttribute("Prestige")) or 0
            return level ~= nil and level >= R2_MIN_LEVEL and prestige >= R2_MIN_PRESTIGE
        end
        task.spawn(function()
            local roomRef = nil
            local startAt, lastStart, lastCreate = nil, -math.huge, -math.huge
            local warned = false
            task.wait(4)
            while Alive() do
                task.wait(0.5)
                if not Cfg.AutoQuestThunderR2 or Cfg.AutoQuestThunderR3 then
                    startAt, warned = nil, false
                elseif not R2Ready() then
                    startAt = nil
                    if not warned then
                        warned = true
                        SH.say("Auto Quest Round (2): needs Prestige 1+ and Level 80+")
                    end
                elseif SH.Coord.Blocker(100) then
                    startAt = nil
                    QS("Waiting: " .. tostring(SH.Coord.last))
                else
                    warned = false
                    local room = MyRoom() or ((roomRef and roomRef.Parent) and roomRef or nil)
                    if room and (room.Name ~= R2_MAP or DiffOf(room) ~= R2_DIFF:lower()) then
                        LobbyInvoke("S_Missions", "Leave")
                        roomRef, startAt = nil, nil
                        task.wait(0.8)
                    elseif not room then
                        if os.clock() - lastCreate >= 8 then
                            lastCreate = os.clock()
                            local ok, r = LobbyInvoke("S_Missions", "Create", {
                                Difficulty = R2_DIFF,
                                Type = "Missions",
                                Objective = R2_OBJECTIVE,
                                Name = R2_MAP,
                            })
                            if ok and r then
                                roomRef = (typeof(r) == "Instance") and r or nil
                                startAt = os.clock() + R2_START_DELAY
                                QS("Room created - starting soon")
                                SH.say("Auto Quest Round (2): room created (" .. R2_MAP .. " / " .. R2_DIFF .. "), starting in " .. R2_START_DELAY .. "s")
                            else
                                QS("Create room failed - retrying")
                                SH.say("Auto Quest Round (2): create failed - " .. tostring(r))
                            end
                        end
                    else
                        if not startAt then startAt = os.clock() + R2_START_DELAY end
                        if os.clock() >= startAt and os.clock() - lastStart >= 15 then
                            lastStart = os.clock()
                            local ok, r = LobbyInvoke("S_Missions", "Start")
                            SH.say(ok and "Auto Quest Round (2): start sent" or ("Auto Quest Round (2): start failed - " .. tostring(r)))
                            QS(ok and "Start sent - joining match" or "Start failed - retrying")
                        end
                    end
                end
            end
        end)
    end

    -- ============================================================
    -- ============================================================
    if game.PlaceId == 14916516914 then
        local R3_MAP, R3_DIFF, R3_OBJECTIVE = "Utgard", "Aberrant", "Skirmish"
        local R3_MODIFIER = "Nightmare"
        local R3_MIN_PRESTIGE, R3_MIN_LEVEL = 1, 80
        local R3_START_DELAY = 5
        local function LobbyInvoke(...)
            local remote = GetLobbyRemote()
            if not remote then return false, "remote not found" end
            local args = table.pack(...)
            local done, ok, result = false, false, nil
            task.spawn(function()
                ok, result = pcall(function() return remote:InvokeServer(table.unpack(args, 1, args.n)) end)
                done = true
            end)
            local t0 = os.clock()
            while not done and os.clock() - t0 < 8 do task.wait(0.1) end
            if not done then return false, "timeout" end
            return ok, result
        end
        local function MyRoom()
            local folder = ReplicatedStorage:FindFirstChild("Missions")
            if not folder then return nil end
            for _, room in ipairs(folder:GetChildren()) do
                local leader = room:FindFirstChild("Leader")
                if leader and leader:IsA("ValueBase") and leader.Value == LocalPlayer.Name then return room end
            end
            return nil
        end
        local function DiffOf(room)
            local okV, v = pcall(function() return room.Value end)
            if okV and type(v) == "string" then return (v:match("^%s*(%a+)") or ""):lower() end
            return nil
        end
        local function R3Ready()
            local level = tonumber(LocalPlayer:GetAttribute("Level"))
            local prestige = tonumber(LocalPlayer:GetAttribute("Prestige")) or 0
            return level ~= nil and level >= R3_MIN_LEVEL and prestige >= R3_MIN_PRESTIGE
        end
        task.spawn(function()
            local roomRef = nil
            local startAt, lastStart, lastCreate = nil, -math.huge, -math.huge
            local warned = false
            local modDone = false
            task.wait(4)
            while Alive() do
                task.wait(0.5)
                if not Cfg.AutoQuestThunderR3 then
                    startAt, warned, modDone = nil, false, false
                    if (Cfg.QuestR3Played or 0) ~= 0 then Cfg.QuestR3Played = 0 Save() end
                elseif not R3Ready() then
                    startAt, modDone = nil, false
                    if not warned then
                        warned = true
                        SH.say("Auto Quest Round (3): needs Prestige 1+ and Level 80+")
                    end
                elseif SH.Coord.Blocker(100) then
                    startAt = nil
                    QS("Waiting: " .. tostring(SH.Coord.last))
                else
                    warned = false
                    local room = MyRoom() or ((roomRef and roomRef.Parent) and roomRef or nil)
                    if room and (room.Name ~= R3_MAP or DiffOf(room) ~= R3_DIFF:lower() or not modDone) then
                        LobbyInvoke("S_Missions", "Leave")
                        roomRef, startAt, modDone = nil, nil, false
                        task.wait(0.8)
                    elseif not room then
                        if os.clock() - lastCreate >= 8 then
                            lastCreate = os.clock()
                            local ok, r = LobbyInvoke("S_Missions", "Create", {
                                Difficulty = R3_DIFF,
                                Type = "Missions",
                                Objective = R3_OBJECTIVE,
                                Name = R3_MAP,
                            })
                            if ok and r then
                                roomRef = (typeof(r) == "Instance") and r or nil
                                task.wait(0.8)
                                local okM, rM = LobbyInvoke("S_Missions", "Modify", R3_MODIFIER)
                                if okM then
                                    modDone = true
                                    startAt = os.clock() + R3_START_DELAY
                                    QS("Room created - starting soon")
                                    SH.say("Auto Quest Round (3): room created (" .. R3_MAP .. " / " .. R3_DIFF .. " / " .. R3_MODIFIER .. "), starting in " .. R3_START_DELAY .. "s")
                                else
                                    SH.say("Auto Quest Round (3): modifier failed - " .. tostring(rM))
                                end
                            else
                                QS("Create room failed - retrying")
                                SH.say("Auto Quest Round (3): create failed - " .. tostring(r))
                            end
                        end
                    else
                        if not startAt then startAt = os.clock() + R3_START_DELAY end
                        if os.clock() >= startAt and os.clock() - lastStart >= 15 then
                            lastStart = os.clock()
                            local ok, r = LobbyInvoke("S_Missions", "Start")
                            SH.say(ok and "Auto Quest Round (3): start sent" or ("Auto Quest Round (3): start failed - " .. tostring(r)))
                            QS(ok and "Start sent - joining match" or "Start failed - retrying")
                        end
                    end
                end
            end
        end)
    end

    -- ============================================================
    -- ============================================================
    local R3_GAMES = 3
    local r3ForcedRetry = false
    task.spawn(function()
        local lastSpawn = nil
        while Alive() do
            task.wait(1)
            if Cfg.AutoQuestThunderR3 then
                if Farm.CanUseHere() then
                    if not Cfg.AutoRetry then
                        r3ForcedRetry = true
                        SetFlag("AutoRetry", true)
                    end
                    if MyRoot() then
                        local sp = Farm.CharSpawnAt or 0
                        if lastSpawn == nil or sp - lastSpawn > 90 then
                            lastSpawn = sp
                            task.wait(3)
                            if not (Cfg.AutoFarm or Cfg.AutoFarmThunder or Cfg.AutoClearWave) then SetFlag("AutoFarm", true) end
                            Cfg.QuestR3Played = (Cfg.QuestR3Played or 0) + 1
                            SH.say("Auto Quest Round (3): game " .. Cfg.QuestR3Played .. "/" .. R3_GAMES)
                            if Cfg.QuestR3Played >= R3_GAMES then
                                Cfg.QuestR3Played = 0
                                Cfg.AutoQuestThunderR3 = false
                                SH.say("Auto Quest Round (3): last game, Round 3 switched off")
                                QS("Round 3 done (3/3 games)", "green")
                            end
                            Save()
                            pcall(UiSync.Refresh)
                        end
                    end
                end
            elseif r3ForcedRetry then
                r3ForcedRetry = false
                SetFlag("AutoRetry", false)
            end
        end
    end)

    do
        local QUEST_MIN_LEVEL, QUEST_MIN_PRESTIGE = 80, 1
        local STATUS_YELLOW = Color3.fromRGB(255, 214, 10)
        local STATUS_GREEN = Color3.fromRGB(48, 209, 88)
        local statusRow = Form:Row()
        statusRow:Left():TitleStack({ Title = "Status" })
        local statusLabel = statusRow:Right():Label({ Text = "Off" })
        local statusDefault, lastText, lastColorKey, lastActive = nil, nil, nil, nil
        local function SetColor(key)
            if key == lastColorKey then return end
            local ok = pcall(function()
                local o = LabelObject(statusLabel)
                if not o then error("label not ready") end
                if not statusDefault then statusDefault = o.TextColor3 end
                if key == "yellow" then o.TextColor3 = STATUS_YELLOW
                elseif key == "green" then o.TextColor3 = STATUS_GREEN
                else o.TextColor3 = statusDefault end
            end)
            if ok then lastColorKey = key end
        end
        local function ActiveRound()
            if Cfg.AutoQuestThunderR3 then return 3 end
            if Cfg.AutoQuestThunderR2 then return 2 end
            if Cfg.AutoQuestThunderR1 then return 1 end
            return nil
        end
        task.spawn(function()
            while Alive() do
                task.wait(0.4)
                local text, color = "Off", "default"
                pcall(function()
                    local active = ActiveRound()
                    if active ~= lastActive then
                        if active then QDetail.text = nil end
                        lastActive = active
                    end
                    if not active then
                        if QDetail.color == "green" and QDetail.text then text, color = QDetail.text, "green" end
                        return
                    end
                    local inMatch = Farm.CanUseHere()
                    local detail = nil
                    if QDetail.text and QDetail.where == (inMatch and "match" or "lobby") then detail = QDetail.text end
                    local played = Cfg.QuestR3Played or 0
                    if not detail then
                        if inMatch then
                            if active == 3 then detail = (played > 0) and ("Game %d/%d in progress"):format(played, R3_GAMES) or "Starting game 1"
                            elseif active == 2 then detail = "Waiting for supply crates"
                            else detail = "Waiting for watchtowers" end
                        else
                            local level = tonumber(LocalPlayer:GetAttribute("Level"))
                            local prestige = tonumber(LocalPlayer:GetAttribute("Prestige")) or 0
                            if not (level and level >= QUEST_MIN_LEVEL and prestige >= QUEST_MIN_PRESTIGE) then
                                detail = ("Needs Prestige %d+ and Level %d+ (you: Prestige %d, Level %s)"):format(QUEST_MIN_PRESTIGE, QUEST_MIN_LEVEL, prestige, tostring(level or "?"))
                            else
                                detail = "Setting up room"
                            end
                        end
                    end
                    text = ("Round %d | %s"):format(active, detail)
                    if active == 3 then text = text .. (" | Games %d/%d"):format(played, R3_GAMES) end
                    color = (QDetail.color == "green" and detail == QDetail.text) and "green" or "yellow"
                end)
                if text ~= lastText then
                    lastText = text
                    pcall(function() statusLabel.Text = text end)
                    lastColorKey = nil
                end
                SetColor(color)
            end
        end)
    end
end)
local AutoSkillTab = MainCategory:Tab({
    Title = "Auto Skill",
    Icon = Icon("sparklesFill", "starFill", "boltFill"),
})
SH.Guard("auto-skill", function()
    local UIS = game:GetService("UserInputService")
    local MODES = { "Instant", "Hold" }
    local KEYS = { Enum.KeyCode.One, Enum.KeyCode.Two, Enum.KeyCode.Three, Enum.KeyCode.Four, Enum.KeyCode.Five }
    for i = 1, 5 do
        if not table.find(MODES, Cfg["AutoSkillMode" .. i]) then Cfg["AutoSkillMode" .. i] = "Instant" end
    end
    local SkillSection = AutoSkillTab:PageSection({
        Title = "🎯 Auto Skill",
        Subtitle = "Presses your skill slot keys (1-5) for you. Instant = tap, Hold = hold the key."
    })
    local SkillForm = SkillSection:Form()
    local StatusRow = SkillForm:Row()
    StatusRow:Left():TitleStack({ Title = "Skill Status", Subtitle = "Current action..." })
    local StatusLabel = StatusRow:Right():Label({ Text = "Off" })
    local lastStatus = nil
    local function SetStatus(text)
        if text == lastStatus then return end
        lastStatus = text
        pcall(function() StatusLabel.Text = tostring(text) end)
    end
    for i = 1, 5 do
        local toggleKey, modeKey = "AutoSkill" .. i, "AutoSkillMode" .. i
        local row = SkillForm:Row()
        row:Left():TitleStack({
            Title = "Skill Slot [ " .. i .. " ]",
            Subtitle = "Auto press key " .. i .. " - choose Instant (tap) or Hold."
        })
        local function ModeIndex() return table.find(MODES, Cfg[modeKey]) or 1 end
        local drop = row:Right():PullDownButton({
            Label = MODES[ModeIndex()],
            Options = MODES,
            Value = ModeIndex(),
            ValueChanged = function(self, index)
                if type(index) == "table" then index = index[1] end
                if type(index) ~= "number" or not MODES[index] then return end
                Cfg[modeKey] = MODES[index]
                self.Label = MODES[index]
                Save()
            end
        })
        UiSync.Add(function()
            local idx = ModeIndex()
            drop.Value = idx
            drop.Label = MODES[idx]
        end)
        local trow = SkillForm:Row()
        trow:Left():TitleStack({ Title = "Enable Slot [ " .. i .. " ]", Subtitle = "Turn auto press on for slot " .. i .. "." })
        UiSync.Link(trow:Right():Toggle({
            Value = Cfg[toggleKey],
            ValueChanged = function(self, value)
                Cfg[toggleKey] = value and true or false
                Save()
            end
        }), Cfg, toggleKey)
    end
    local function AddSlider(title, subtitle, key)
        local range = FARM_RANGES[key]
        local row = SkillForm:Row()
        local stack = row:Left():TitleStack({ Title = title(Cfg[key]), Subtitle = subtitle })
        UiSync.Link(row:Right():Slider({
            Minimum = range[1],
            Maximum = range[2],
            Value = Cfg[key],
            ValueChanged = function(self, value)
                local v = math.clamp(math.floor(value + 0.5), range[1], range[2])
                Cfg[key] = v
                pcall(function() stack.Title = title(v) end)
                Save()
            end
        }), Cfg, key, function(_, want) pcall(function() stack.Title = title(want) end) end)
    end
    AddSlider(function(v) return "Hold Time ( " .. v .. "s )" end, "How long the key is held in Hold mode.", "AutoSkillHoldTime")
    AddSlider(function(v) return "Press Delay ( " .. v .. "s )" end, "Wait before pressing the same slot again (match your skill cooldown).", "AutoSkillDelay")

    local function AnyOn()
        for i = 1, 5 do if Cfg["AutoSkill" .. i] then return true end end
        return false
    end
    local function CanPress()
        if not Farm.CanUseHere() then return false, "Not available in the lobby / menu" end
        if UIS:GetFocusedTextBox() then return false, "Typing in chat - paused" end
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if not hum or hum.Health <= 0 then return false, "Waiting for your character" end
        if Farm.CompleteScreenShown and Farm.CompleteScreenShown() then return false, "Mission completed - paused" end
        return true
    end
    local function Press(i)
        local key = KEYS[i]
        if Cfg["AutoSkillMode" .. i] == "Hold" then
            pcall(function() VirtualInputManager:SendKeyEvent(true, key, false, game) end)
            local t0 = os.clock()
            while os.clock() - t0 < Cfg.AutoSkillHoldTime and Alive() and Cfg["AutoSkill" .. i] and CanPress() do
                task.wait(0.1)
            end
            pcall(function() VirtualInputManager:SendKeyEvent(false, key, false, game) end)
        else
            pcall(function()
                VirtualInputManager:SendKeyEvent(true, key, false, game)
                task.wait(0.06)
                VirtualInputManager:SendKeyEvent(false, key, false, game)
            end)
        end
        if Farm.Debug then SH.dbg("[AotrUpdate5][Skill] pressed slot", i, Cfg["AutoSkillMode" .. i]) end
    end
    local nextAt = { 0, 0, 0, 0, 0 }
    task.spawn(function()
        while Alive() do
            task.wait(0.25)
            if not AnyOn() then
                SetStatus("Off")
            else
                local ok, why = CanPress()
                if not ok then
                    SetStatus(why)
                else
                    SetStatus("Waiting for next press...")
                    for i = 1, 5 do
                        if Cfg["AutoSkill" .. i] and os.clock() >= nextAt[i] then
                            SetStatus("Using slot " .. i .. " (" .. Cfg["AutoSkillMode" .. i] .. ")")
                            Press(i)
                            nextAt[i] = os.clock() + Cfg.AutoSkillDelay
                            task.wait(0.15)
                            if not CanPress() then break end
                        end
                    end
                end
            end
        end
        for i = 1, 5 do pcall(function() VirtualInputManager:SendKeyEvent(false, KEYS[i], false, game) end) end
    end)
end)
local LobbyCategory = Cascade.Components.Section(Window, {
    Title = "Lobby",
    Disclosure = false
})
local LobbyTab = LobbyCategory:Tab({
    Title = "Lobby",
    Icon = Icon("cubeFill", "shippingboxFill", "cube"),
})
do
    local ClaimSection = LobbyTab:PageSection({
        Title = "🎁 Auto Claim",
        Subtitle = "Claims rewards the game shows as ready. Open the Quests / Achievements page to refresh them."
    })
    local ClaimForm = ClaimSection:Form()
    local ClaimStatusRow = ClaimForm:Row()
    ClaimStatusRow:Left():TitleStack({ Title = "Claim Status", Subtitle = "Rewards claimed since the script started." })
    local ClaimStatusLabel = ClaimStatusRow:Right():Label({ Text = "Idle" })
    local function SetClaimStatus(text)
        pcall(function() ClaimStatusLabel.Text = tostring(text) end)
    end
    local function AddClaimToggle(title, subtitle, key)
        local row = ClaimForm:Row()
        row:Left():TitleStack({ Title = title, Subtitle = subtitle })
        UiSync.Link(row:Right():Toggle({
            Value = Cfg[key],
            ValueChanged = function(self, value)
                Cfg[key] = value and true or false
                Save()
            end
        }), Cfg, key)
    end
    AddClaimToggle("Auto Claim Main Quests", "Automatically claim the main quests.", "AutoClaimMain")
    AddClaimToggle("Auto Claim Side Quests", "Automatically claim the side quests.", "AutoClaimSide")
    AddClaimToggle("Auto Claim Achievements", "Automatically claim achievements.", "AutoClaimAchievements")
    AddClaimToggle("Auto Claim Weekly Quests", "Automatically claim the weekly quests.", "AutoClaimWeekly")
    AddClaimToggle("Auto Claim Daily Quests", "Automatically claim the daily quests.", "AutoClaimDaily")
    AddClaimToggle("Auto Open Pages", "When the game shows the red ! on the Achievements icon, open that page, claim, then close it (like a player).", "AutoOpenPages")
    local SCAN_INTERVAL = 5
    local CLAIM_RETRY = 300
    local CLAIM_GAP = 1.2
    local CLAIM_MAX_PER_RUN = 25
    local BLIND_DAILY_INTERVAL = 300
    local claimRemote = nil
    local function GetClaimRemote()
        if claimRemote and claimRemote.Parent then return claimRemote end
        claimRemote = GetLobbyRemote()
        return claimRemote
    end
    local QUEST_TOGGLE = {
        Main = "AutoClaimMain",
        Side = "AutoClaimSide",
        Weekly = "AutoClaimWeekly",
        Daily = "AutoClaimDaily",
    }
    local function Interface()
        return PlayerGui:FindFirstChild("Interface")
    end
    local function ScanQuestCards()
        local out = {}
        local quests = Interface() and Interface():FindFirstChild("Quests")
        if not quests then return out end
        for _, d in ipairs(quests:GetDescendants()) do
            if d.Name == "Button" and d:IsA("GuiObject") then
                local ok, info = pcall(function()
                    local claim = d.Parent
                    if not (claim and claim.Name == "Claim" and claim.Visible) then return nil end
                    local tag, category = d:GetAttribute("Tag"), d:GetAttribute("Category")
                    if tag == nil or category == nil then return nil end
                    return { tag = tostring(tag), category = tostring(category), inst = d }
                end)
                if ok and info then out[#out + 1] = info end
            end
        end
        return out
    end
    local function ScanAchievementItems()
        local out = {}
        local iface = Interface()
        local ach = iface and iface:FindFirstChild("Achievements")
        local list = ach and ach:FindFirstChild("List")
        list = list and list:FindFirstChild("Inner")
        if not list then return out end
        for _, item in ipairs(list:GetChildren()) do
            local ok, info = pcall(function()
                local id = tonumber(item.Name)
                if not id or id == 99 then return nil end
                local inner = item:FindFirstChild("Inner")
                local state = inner and inner:FindFirstChild("A_State")
                local title = state and state:FindFirstChild("Title")
                if state and state.Visible and title and title.Text == "CLAIM" then
                    return { id = id, inst = item }
                end
                return nil
            end)
            if ok and info then out[#out + 1] = info end
        end
        return out
    end
    local lastTry = setmetatable({}, { __mode = "k" })
    local function Due(inst)
        return os.clock() - (lastTry[inst] or -math.huge) >= CLAIM_RETRY
    end
    local function ClaimOne(inst, ...)
        lastTry[inst] = os.clock()
        local remote = GetClaimRemote()
        if not remote then return false end
        local args = table.pack(...)
        local ok, r1 = pcall(function()
            return remote:InvokeServer(table.unpack(args, 1, args.n))
        end)
        return ok and r1 ~= nil
    end
    local totals = { Main = 0, Side = 0, Weekly = 0, Daily = 0, Ach = 0 }
    local function RefreshClaimStatus()
        SetClaimStatus(("Main %d · Side %d · Weekly %d · Daily %d · Ach %d"):format(
            totals.Main, totals.Side, totals.Weekly, totals.Daily, totals.Ach))
    end
    local function RunScan()
        if not Interface() then SetClaimStatus("Waiting for the game UI...") return end
        local done, tried = 0, 0
        local wantQuests = Cfg.AutoClaimMain or Cfg.AutoClaimSide or Cfg.AutoClaimWeekly or Cfg.AutoClaimDaily
        if wantQuests then
            for _, c in ipairs(ScanQuestCards()) do
                local toggle = QUEST_TOGGLE[c.category]
                if toggle and Cfg[toggle] and Alive() and tried < CLAIM_MAX_PER_RUN and Due(c.inst) then
                    tried += 1
                    if ClaimOne(c.inst, "Functions", "Quest", c.tag, c.category) then
                        totals[c.category] += 1
                        done += 1
                    end
                    task.wait(CLAIM_GAP)
                end
            end
        end
        if Cfg.AutoClaimAchievements then
            for _, a in ipairs(ScanAchievementItems()) do
                if Cfg.AutoClaimAchievements and Alive() and tried < CLAIM_MAX_PER_RUN and Due(a.inst) then
                    tried += 1
                    if ClaimOne(a.inst, "S_Achievements", "Claim", a.id) then
                        totals.Ach += 1
                        done += 1
                    end
                    task.wait(CLAIM_GAP)
                end
            end
        end
        if done > 0 or tried > 0 then RefreshClaimStatus() end
    end
    local lastBlindDaily = -math.huge
    local function RunBlindDaily()
        if not Cfg.AutoClaimDaily then return end
        if os.clock() - lastBlindDaily < BLIND_DAILY_INTERVAL then return end
        lastBlindDaily = os.clock()
        local remote = GetClaimRemote()
        if not remote then return end
        for i = 1, 3 do
            if not (Alive() and Cfg.AutoClaimDaily) then return end
            local ok, r1 = pcall(function()
                return remote:InvokeServer("Functions", "Quest", "Daily " .. i, "Daily")
            end)
            if ok and r1 ~= nil then totals.Daily += 1 end
            task.wait(CLAIM_GAP)
        end
        RefreshClaimStatus()
    end
    local OPEN_COOLDOWN = 60
    local opening = false
    local lastAchOpen, lastQuestOpen = -math.huge, -math.huge
    local handledAch = {}
    local handledCards = {}
    local CARD_CATEGORY = { Q_1 = "Main", Q_2 = "Side" }
    local function WantQuests()
        return Cfg.AutoClaimMain or Cfg.AutoClaimSide or Cfg.AutoClaimWeekly or Cfg.AutoClaimDaily
    end
    local function OnScreen(obj)
        local cam = workspace.CurrentCamera
        if not cam then return true end
        local c = obj.AbsolutePosition + obj.AbsoluteSize / 2
        local v = cam.ViewportSize
        return c.X >= 0 and c.Y >= 0 and c.X <= v.X and c.Y <= v.Y
    end
    local function PageOpen(page)
        if not page then return false end
        local ok, res = pcall(function()
            if not IsShown(page) then return false end
            if page:IsA("CanvasGroup") and page.GroupTransparency >= 0.95 then return false end
            return OnScreen(page)
        end)
        return ok and res or false
    end
    local function AchPage()
        local iface = Interface()
        return iface and iface:FindFirstChild("Achievements")
    end
    local function QuestsPage()
        local iface = Interface()
        return iface and iface:FindFirstChild("Quests")
    end
    local function AchOpen() return PageOpen(AchPage()) end
    local function QuestsOpen() return PageOpen(QuestsPage()) end
    local function AchBadgeOn()
        local b = FindGui("Interface.Topbar.Main.Icons.Achievements.New")
        return b ~= nil and b:IsA("GuiObject") and b.Visible
    end
    local function QuestCategoryCards()
        local out = {}
        local q = QuestsPage()
        local main = q and q:FindFirstChild("Main")
        local cats = main and main:FindFirstChild("Quests")
        if not cats then return out end
        for _, c in ipairs(cats:GetChildren()) do
            if c:IsA("CanvasGroup") then
                local ok, info = pcall(function()
                    local inner = c:FindFirstChild("Inner")
                    local title = inner and inner:FindFirstChild("Title")
                    local flag = title and title:FindFirstChild("New")
                    return {
                        name = c.Name,
                        new = (flag ~= nil and flag:IsA("GuiObject") and flag.Visible) and true or false,
                        interact = inner and inner:FindFirstChild("Interact"),
                    }
                end)
                if ok and info then out[#out + 1] = info end
            end
        end
        return out
    end
    local function DetailKey()
        local q = QuestsPage()
        local main = q and q:FindFirstChild("Main")
        local d = main and main:FindFirstChild("Details")
        local p = d and d:FindFirstChild("Quests")
        local n, first = 0, nil
        if p then
            for _, k in ipairs(p:GetChildren()) do
                if k:IsA("CanvasGroup") then
                    n += 1
                    first = first or k
                end
            end
        end
        return n, first
    end
    local function QuestsCloseButton()
        local q = QuestsPage()
        local c = q and q:FindFirstChild("Close")
        if not c then return nil end
        if c:IsA("GuiButton") then return c end
        return c:FindFirstChildWhichIsA("GuiButton", true)
    end
    local function PressUntil(btn, doneFn, timeout)
        pcall(function() GuiService.SelectedObject = btn end)
        task.wait(0.15)
        pcall(function()
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
            task.wait(0.05)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
        end)
        local t0 = os.clock()
        local fired = false
        while os.clock() - t0 < (timeout or 3) do
            task.wait(0.25)
            if doneFn() then break end
            if not fired and os.clock() - t0 > 1.2 then
                fired = true
                pcall(function()
                    if type(firesignal) == "function" then
                        firesignal(btn.MouseButton1Click)
                        firesignal(btn.Activated)
                    end
                end)
            end
        end
        pcall(function()
            if GuiService.SelectedObject == btn then GuiService.SelectedObject = nil end
        end)
        return doneFn()
    end
    local function AchList()
        local ach = AchPage()
        local l = ach and ach:FindFirstChild("List")
        return l and l:FindFirstChild("Inner")
    end
    local function AchInCategoryView()
        local list = AchList()
        if not list then return false end
        for _, c in ipairs(list:GetChildren()) do
            if tonumber(c.Name) then return true end
        end
        return false
    end
    local function AchCategories()
        local out = {}
        local list = AchList()
        if not list then return out end
        for _, item in ipairs(list:GetChildren()) do
            if item:IsA("GuiObject") and not tonumber(item.Name) then
                local box = item:FindFirstChild("Inner")
                local icon = box and box:FindFirstChild("Icon")
                local nw = icon and icon:FindFirstChild("New")
                local interact = item:FindFirstChild("Interact")
                if box and icon and interact and interact:IsA("GuiButton") then
                    out[#out + 1] = {
                        name = item.Name,
                        new = (nw ~= nil and nw:IsA("GuiObject") and nw.Visible) and true or false,
                        interact = interact,
                    }
                end
            end
        end
        return out
    end
    local function AchBack(doneFn)
        local close = FindGui("Interface.Achievements.Top.Achievements_Close")
        if not (close and close:IsA("GuiButton")) then return false end
        PressUntil(close, doneFn, 3)
        return true
    end
    local function BackedOut() return (not AchOpen()) or (not AchInCategoryView()) end
    local function AutoOpenAchievements()
        if opening then return end
        if not (Cfg.AutoOpenPages and Cfg.AutoClaimAchievements) then return end
        if not AchBadgeOn() then handledAch = {} return end
        if AchOpen() and AchInCategoryView() then return end
        local todo = 0
        for _, c in ipairs(AchCategories()) do
            if c.new then
                if not handledAch[c.name] then todo += 1 end
            else
                handledAch[c.name] = nil
            end
        end
        if todo == 0 then return end
        if os.clock() - lastAchOpen < OPEN_COOLDOWN then return end
        local icon = FindGui("Interface.Topbar.Main.Icons.Achievements")
        if not (icon and icon:IsA("GuiButton") and IsShown(icon)) then return end
        opening = true
        lastAchOpen = os.clock()
        local ok, err = pcall(function()
            local wasOpen = AchOpen()
            SetClaimStatus("Achievement badge! Opening page...")
            local function EnsureOpen()
                if not AchOpen() then PressUntil(icon, AchOpen, 3) end
                local t0 = os.clock()
                while os.clock() - t0 < 3 and #AchCategories() == 0 and not AchInCategoryView() do task.wait(0.3) end
                return AchOpen()
            end
            if not EnsureOpen() then
                SetClaimStatus("Achievements page did not open")
                return
            end
            for _ = 1, 5 do
                if not (Alive() and Cfg.AutoOpenPages and Cfg.AutoClaimAchievements) then break end
                if AchInCategoryView() then
                    AchBack(BackedOut)
                    task.wait(0.4)
                end
                if not EnsureOpen() then break end
                local nextCat = nil
                for _, c in ipairs(AchCategories()) do
                    if c.new and not handledAch[c.name] then nextCat = c break end
                end
                if not nextCat then break end
                handledAch[nextCat.name] = true
                PressUntil(nextCat.interact, AchInCategoryView, 3)
                task.wait(0.6)
                RunScan()
                AchBack(BackedOut)
                task.wait(0.4)
            end
            if not wasOpen and AchOpen() then
                if AchInCategoryView() then
                    AchBack(BackedOut)
                    task.wait(0.4)
                end
                if AchOpen() then
                    AchBack(function() return not AchOpen() end)
                end
            end
        end)
        opening = false
        if not ok then SetClaimStatus("Auto open failed: " .. tostring(err)) end
    end
    local function AutoOpenQuests()
        if opening then return end
        if not (Cfg.AutoOpenPages and WantQuests()) then return end
        local todo = {}
        for _, c in ipairs(QuestCategoryCards()) do
            if c.new then
                local cat = CARD_CATEGORY[c.name]
                local wanted
                if cat then wanted = Cfg[QUEST_TOGGLE[cat]] else wanted = WantQuests() end
                if wanted and not handledCards[c.name] then todo[#todo + 1] = c end
            else
                handledCards[c.name] = nil
            end
        end
        if #todo == 0 then return end
        if os.clock() - lastQuestOpen < OPEN_COOLDOWN then return end
        local topBtn = FindGui("Interface.Topbar.Main.Categories.Quests.Interact")
        if not (topBtn and topBtn:IsA("GuiButton") and IsShown(topBtn)) then return end
        opening = true
        lastQuestOpen = os.clock()
        local ok, err = pcall(function()
            local wasOpen = QuestsOpen()
            SetClaimStatus("Quest badge! Opening page...")
            if not wasOpen then
                PressUntil(topBtn, QuestsOpen, 3)
            end
            if not QuestsOpen() then
                SetClaimStatus("Quests page did not open")
                return
            end
            task.wait(0.5)
            for _, c in ipairs(todo) do
                if not (Alive() and Cfg.AutoOpenPages) then break end
                handledCards[c.name] = true
                if c.interact and c.interact.Parent then
                    local n0, f0 = DetailKey()
                    PressUntil(c.interact, function()
                        local n1, f1 = DetailKey()
                        return n1 > 0 and (n1 ~= n0 or f1 ~= f0)
                    end, 3)
                    task.wait(0.6)
                    RunScan()
                end
            end
            if not wasOpen and QuestsOpen() then
                local close = QuestsCloseButton()
                if close then
                    PressUntil(close, function() return not QuestsOpen() end, 3)
                else
                    SetClaimStatus("Quests page left open (close button not found)")
                end
            end
        end)
        opening = false
        if not ok then SetClaimStatus("Auto open failed: " .. tostring(err)) end
    end
    task.spawn(function()
        while Alive() do
            pcall(RunScan)
            pcall(AutoOpenAchievements)
            pcall(AutoOpenQuests)
            pcall(RunBlindDaily)
            task.wait(SCAN_INTERVAL)
        end
    end)
    local DEV_MODE = SH.DEV
    if DEV_MODE then
    local DebugRow = ClaimForm:Row()
    DebugRow:Left():TitleStack({
        Title = "Copy Claim Debug",
        Subtitle = "Open the Quests page and click through its categories, then Achievements, then press Copy."
    })
    local DebugBtn = DebugRow:Right():Button({ Label = "Copy", Callback = function() end })
    BindButton(DebugBtn, function()
        local lines = {}
        local function add(s) lines[#lines + 1] = tostring(s) end
        local function childNames(inst, limit)
            local parts = {}
            if inst then
                for _, c in ipairs(inst:GetChildren()) do parts[#parts + 1] = c.Name .. ":" .. c.ClassName end
            end
            table.sort(parts)
            if limit and #parts > limit then
                local n = #parts
                parts = { table.unpack(parts, 1, limit) }
                parts[#parts + 1] = ("...(+%d)"):format(n - limit)
            end
            return table.concat(parts, ", ")
        end
        local iface = Interface()
        add("Interface found: " .. tostring(iface ~= nil))
        if iface then
            add("Interface children: " .. childNames(iface, 60))
            local q = iface:FindFirstChild("Quests")
            add("Interface.Quests found: " .. tostring(q ~= nil))
            if q then
                add("Quests children: " .. childNames(q, 30))
                local main = q:FindFirstChild("Main")
                add("Quests.Main children: " .. childNames(main, 30))
                local cats = main and main:FindFirstChild("Quests")
                if cats then
                    for _, c in ipairs(cats:GetChildren()) do
                        if c:IsA("CanvasGroup") then
                            local newFlag = "?"
                            pcall(function() newFlag = tostring(c.Inner.Title.New.Visible) end)
                            local interact = c:FindFirstChild("Inner") and c.Inner:FindFirstChild("Interact")
                            add(("  category card %s | New(claimable)=%s | Interact=%s"):format(
                                c.Name, newFlag, interact and interact.ClassName or "none"))
                        end
                    end
                end
                local details = main and main:FindFirstChild("Details")
                local cardsParent = details and details:FindFirstChild("Quests")
                local nCards = 0
                if cardsParent then
                    for _, c in ipairs(cardsParent:GetChildren()) do
                        if c:IsA("CanvasGroup") then nCards += 1 end
                    end
                end
                add("Quest cards currently built: " .. nCards)
                local found = ScanQuestCards()
                add("Claim buttons showing in Quests: " .. #found)
                for _, c in ipairs(found) do add(("  tag=%s category=%s"):format(c.tag, c.category)) end
            end
            local ach = iface:FindFirstChild("Achievements")
            add("Interface.Achievements found: " .. tostring(ach ~= nil))
            if ach then
                add("Achievements children: " .. childNames(ach, 30))
                local list = ach:FindFirstChild("List") and ach.List:FindFirstChild("Inner")
                add("Achievement items built: " .. (list and #list:GetChildren() or 0))
                local items = ScanAchievementItems()
                add("CLAIM items showing in Achievements: " .. #items)
                for i = 1, math.min(#items, 15) do add("  id " .. items[i].id) end
            end
            local newIcon = FindGui("Interface.Topbar.Main.Icons.Achievements.New")
            add("Topbar Achievements 'New' flag: " .. (newIcon and tostring(newIcon.Visible) or "n/a"))
            local topbar = iface:FindFirstChild("Topbar")
            if topbar then
                add("Topbar children: " .. childNames(topbar, 20))
                local mainBar = topbar:FindFirstChild("Main")
                add("Topbar.Main children: " .. childNames(mainBar, 40))
                local icons = mainBar and mainBar:FindFirstChild("Icons")
                add("Topbar.Main.Icons children: " .. childNames(icons, 40))
                for _, d in ipairs(topbar:GetDescendants()) do
                    if d.Name == "New" and d:IsA("GuiObject") then
                        add(("  badge %s | Visible=%s"):format(d:GetFullName():gsub("^.-Interface%.", ""), tostring(d.Visible)))
                    end
                end
            end
            local function tree(inst, depth, maxDepth, out, limit)
                if depth > maxDepth or #out >= limit then return end
                for _, c in ipairs(inst:GetChildren()) do
                    if #out >= limit then return end
                    out[#out + 1] = string.rep("  ", depth) .. c.Name .. ":" .. c.ClassName
                    tree(c, depth + 1, maxDepth, out, limit)
                end
            end
            if ach and ach:FindFirstChild("Top") then
                local out = {}
                tree(ach.Top, 1, 3, out, 60)
                add("Achievements.Top tree:")
                for _, l in ipairs(out) do add(l) end
            end
        end
        do
            local iface2 = Interface()
            if iface2 then
                add("Achievements page open (script's view): " .. tostring(AchOpen()))
                local ach2 = iface2:FindFirstChild("Achievements")
                if ach2 and ach2:IsA("CanvasGroup") then
                    add(("Achievements.Visible=%s GroupTransparency=%.2f"):format(tostring(ach2.Visible), ach2.GroupTransparency))
                end
                local topbar2 = iface2:FindFirstChild("Topbar")
                if topbar2 then
                    add("Topbar buttons:")
                    for _, d in ipairs(topbar2:GetDescendants()) do
                        if d:IsA("GuiButton") then
                            add(("  %s | %s | shown=%s"):format(d:GetFullName():gsub("^.-Interface%.", ""), d.ClassName, tostring(IsShown(d))))
                        end
                    end
                    local cats = topbar2:FindFirstChild("Main") and topbar2.Main:FindFirstChild("Categories")
                    if cats then
                        add("Topbar.Main.Categories tree:")
                        local out2 = {}
                        local function walk(inst, depth)
                            if depth > 3 or #out2 >= 60 then return end
                            for _, c in ipairs(inst:GetChildren()) do
                                if #out2 >= 60 then return end
                                out2[#out2 + 1] = string.rep("  ", depth) .. c.Name .. ":" .. c.ClassName
                                walk(c, depth + 1)
                            end
                        end
                        walk(cats, 1)
                        for _, l in ipairs(out2) do add(l) end
                    end
                end
                add("Visible 'New' badges in Interface:")
                local nShown = 0
                for _, d in ipairs(iface2:GetDescendants()) do
                    if d.Name == "New" and d:IsA("GuiObject") and d.Visible and nShown < 40 then
                        nShown += 1
                        add("  " .. d:GetFullName():gsub("^.-Interface%.", ""))
                    end
                end
                if nShown == 0 then add("  (none)") end
            end
        end
        do
            local iface3 = Interface()
            local ach3 = iface3 and iface3:FindFirstChild("Achievements")
            local list3 = ach3 and ach3:FindFirstChild("List")
            local inner3 = list3 and list3:FindFirstChild("Inner")
            if inner3 then
                add("Achievement items (name | A_State.Visible | A_State.Title | Icon.New):")
                local n = 0
                for _, item in ipairs(inner3:GetChildren()) do
                    if n >= 25 then break end
                    n += 1
                    local box = item:FindFirstChild("Inner")
                    local st = box and box:FindFirstChild("A_State")
                    local ttl = st and st:FindFirstChild("Title")
                    local icon = box and box:FindFirstChild("Icon")
                    local nw = icon and icon:FindFirstChild("New")
                    add(("  %s | state=%s | text=%s | new=%s"):format(
                        item.Name,
                        st and tostring(st.Visible) or "n/a",
                        ttl and tostring(ttl.Text) or "n/a",
                        nw and tostring(nw.Visible) or "n/a"))
                end
            end
            local q3 = iface3 and iface3:FindFirstChild("Quests")
            if q3 then
                add("Quests page open (script's view): " .. tostring(QuestsOpen()))
                add("Quests.Close tree:")
                local out3 = {}
                local function walk3(inst, depth)
                    if depth > 3 or #out3 >= 30 then return end
                    for _, c in ipairs(inst:GetChildren()) do
                        if #out3 >= 30 then return end
                        out3[#out3 + 1] = string.rep("  ", depth) .. c.Name .. ":" .. c.ClassName
                        walk3(c, depth + 1)
                    end
                end
                local closeF = q3:FindFirstChild("Close")
                if closeF then walk3(closeF, 1) end
                for _, l in ipairs(out3) do add(l) end
            end
        end
        pcall(function()
            local iface4 = Interface()
            local ach4 = iface4 and iface4:FindFirstChild("Achievements")
            if not ach4 then return end
            local top4 = ach4:FindFirstChild("Top")
            add("Achievements view (script's view): " .. (AchInCategoryView() and "inside a category" or "category list"))
            for _, nm in ipairs({ "Category", "Title" }) do
                local lbl = top4 and top4:FindFirstChild(nm)
                if lbl and lbl:IsA("TextLabel") then
                    add(("Achievements.Top.%s text: %s"):format(nm, lbl.Text))
                end
            end
            local lst4 = ach4:FindFirstChild("List")
            local list4 = lst4 and lst4:FindFirstChild("Inner")
            if not list4 then return end
            local shown = 0
            for _, item in ipairs(list4:GetChildren()) do
                local box = item:FindFirstChild("Inner")
                local icon = box and box:FindFirstChild("Icon")
                local nw = icon and icon:FindFirstChild("New")
                if nw and nw:IsA("GuiObject") and nw.Visible and shown < 2 then
                    shown += 1
                    add("Flagged achievement category tree: " .. item.Name)
                    local out4 = {}
                    local function walk4(inst, depth)
                        if depth > 3 or #out4 >= 40 then return end
                        for _, c in ipairs(inst:GetChildren()) do
                            if #out4 >= 40 then return end
                            out4[#out4 + 1] = string.rep("  ", depth) .. c.Name .. ":" .. c.ClassName
                                .. (c:IsA("GuiButton") and " [BUTTON]" or "")
                            walk4(c, depth + 1)
                        end
                    end
                    walk4(item, 1)
                    for _, l in ipairs(out4) do add(l) end
                end
            end
        end)
        local text = table.concat(lines, "\n")
        local copied = false
        if type(setclipboard) == "function" then copied = pcall(setclipboard, text)
        elseif type(toclipboard) == "function" then copied = pcall(toclipboard, text) end
        local saved = false
        if type(writefile) == "function" then saved = pcall(writefile, "AotrUpdate5_claimdebug.txt", text) end
        SetClaimStatus(copied and "Debug copied" or (saved and "Debug saved to file" or "Copy/save not supported"))
    end)
    end
end
do
    local BLADE_STATS = { "Blade_Durability", "ODM_Gas", "Crit_Damage", "ODM_Control", "ODM_Speed", "Crit_Chance", "ODM_Range", "ODM_Damage" }
    local THUNDER_STATS = { "Blast_Radius", "TS_Damage", "TS_Gas", "TS_Range", "TS_Control", "Crit_Chance", "Crit_Damage", "TS_Speed" }
    local UPGRADE_INTERVAL = 10
    local UPGRADE_GAP = 1.5
    local EQUIP_AFTER_SPAWN = 3
    local CALL_TIMEOUT = 8
    local EquipSection = LobbyTab:PageSection({
        Title = "⚔️ Equipment",
        Subtitle = "Automatically upgrade and equip your Blade, ODM gear and Thunder Spears."
    })
    local EquipForm = EquipSection:Form()
    local EquipStatusRow = EquipForm:Row()
    EquipStatusRow:Left():TitleStack({ Title = "Equipment Status", Subtitle = "Result of the last request." })
    local EquipStatusLabel = EquipStatusRow:Right():Label({ Text = "Idle" })
    local function SetEquipStatus(text)
        pcall(function() EquipStatusLabel.Text = tostring(text) end)
    end
    local equipRemote = nil
    local function GetEquipRemote()
        if equipRemote and equipRemote.Parent then return equipRemote end
        equipRemote = GetLobbyRemote()
        return equipRemote
    end
    local function Invoke(...)
        local remote = GetEquipRemote()
        if not remote then return false, "remote not found" end
        local args = table.pack(...)
        local done, ok, result = false, false, nil
        task.spawn(function()
            ok, result = pcall(function()
                return remote:InvokeServer(table.unpack(args, 1, args.n))
            end)
            done = true
        end)
        local t0 = os.clock()
        while not done and os.clock() - t0 < CALL_TIMEOUT do task.wait(0.1) end
        if not done then return false, "timeout" end
        return ok, result
    end
    local function UpgradeAll(statList, label)
        local ok, r = Invoke("S_Equipment", "Upgrade", table.clone(statList))
        SetEquipStatus(ok and (label .. " upgrade sent") or (label .. " upgrade failed: " .. tostring(r)))
        return ok
    end
    local function EquipWeapon(kind, label)
        local ok, r = Invoke("S_Equipment", "Weapon", kind)
        SetEquipStatus(ok and (label .. " equip sent") or (label .. " equip failed: " .. tostring(r)))
        return ok
    end
    local toggles = {}
    local function AddEquipToggle(title, subtitle, key, onChange)
        local row = EquipForm:Row()
        row:Left():TitleStack({ Title = title, Subtitle = subtitle })
        toggles[key] = UiSync.Link(row:Right():Toggle({
            Value = Cfg[key],
            ValueChanged = function(self, value)
                Cfg[key] = value and true or false
                Save()
                if onChange then onChange(Cfg[key]) end
            end
        }), Cfg, key)
    end
    local function TurnOff(key)
        if Cfg[key] then
            Cfg[key] = false
            Save()
            pcall(function() toggles[key].Value = false end)
        end
    end
    AddEquipToggle("Auto Upgrade Gear ( Blade )", "Automatically upgrade BLADE & ODM.", "AutoUpgradeBlade", nil)
    AddEquipToggle("Auto Upgrade Gear ( Thunder Spears )", "Automatically upgrade thunder spears.", "AutoUpgradeThunder", nil)
    AddEquipToggle("Auto Equip Blade", "Automatically equip blades.", "AutoEquipBlade", function(on)
        if on then
            TurnOff("AutoEquipThunder")
            task.spawn(EquipWeapon, "Blades", "Blade")
        end
    end)
    AddEquipToggle("Auto Equip Thunder Spears", "Automatically equip thunder spears.", "AutoEquipThunder", function(on)
        if on then
            TurnOff("AutoEquipBlade")
            task.spawn(EquipWeapon, "Spears", "Thunder Spears")
        end
    end)
    task.spawn(function()
        local lastBlade, lastThunder = 0, 0
        while Alive() do
            if Cfg.AutoUpgradeBlade and os.clock() - lastBlade >= UPGRADE_INTERVAL then
                lastBlade = os.clock()
                UpgradeAll(BLADE_STATS, "Blade")
                task.wait(UPGRADE_GAP)
            end
            if Alive() and Cfg.AutoUpgradeThunder and os.clock() - lastThunder >= UPGRADE_INTERVAL then
                lastThunder = os.clock()
                UpgradeAll(THUNDER_STATS, "Thunder Spears")
                task.wait(UPGRADE_GAP)
            end
            task.wait(1)
        end
    end)
    local spawnConn
    spawnConn = LocalPlayer.CharacterAdded:Connect(function()
        if not Alive() then spawnConn:Disconnect() return end
        task.delay(EQUIP_AFTER_SPAWN, function()
            if not Alive() then return end
            if Cfg.AutoEquipThunder then
                EquipWeapon("Spears", "Thunder Spears")
            elseif Cfg.AutoEquipBlade then
                EquipWeapon("Blades", "Blade")
            end
        end)
    end)
end
local ProgressionTab = LobbyCategory:Tab({
    Title = "Progression",
    Icon = Icon("chartBarFill", "chartBarXaxis", "chartLineUptrendXyaxis"),
})
do
    local BOOSTS = { "Luck", "Gold", "EXP" }
    local function ProgToggle(form, title, subtitle, key)
        local row = form:Row()
        row:Left():TitleStack({ Title = title, Subtitle = subtitle })
        UiSync.Link(row:Right():Toggle({
            Value = Cfg[key],
            ValueChanged = function(self, value)
                Cfg[key] = value and true or false
                Save()
            end
        }), Cfg, key)
    end
    local function ProgSlider(form, title, subtitle, key)
        local range = FARM_RANGES[key]
        local row = form:Row()
        local function titleFor(v) return title .. " ( " .. v .. " )" end
        local stack = row:Left():TitleStack({ Title = titleFor(Cfg[key]), Subtitle = subtitle })
        UiSync.Link(row:Right():Slider({
            Minimum = range[1],
            Maximum = range[2],
            Value = Cfg[key],
            ValueChanged = function(self, value)
                local v = math.clamp(math.floor(value + 0.5), range[1], range[2])
                Cfg[key] = v
                pcall(function() stack.Title = titleFor(v) end)
                Save()
            end
        }), Cfg, key, function(_, want)
            pcall(function() stack.Title = titleFor(want) end)
        end)
    end
    local function ProgPick(form, title, options, key)
        local row = form:Row()
        row:Left():TitleStack({ Title = title })
        local btn = row:Right():PullDownButton({
            Label = Cfg[key],
            Options = options,
            Value = table.find(options, Cfg[key]) or 1,
            ValueChanged = function(self, index)
                if options[index] then
                    Cfg[key] = options[index]
                    self.Label = options[index]
                    Save()
                end
            end
        })
        StyleDropdown(btn)
        UiSync.Add(function()
            local i = table.find(options, Cfg[key]) or 1
            btn.Value = i
            btn.Label = options[i]
        end)
    end
    local PrestigeSection = ProgressionTab:PageSection({
        Title = "👑 Prestige Section",
        Subtitle = "Automatically prestige and choose your boosts."
    })
    local PrestigeForm = PrestigeSection:Form()
    ProgToggle(PrestigeForm, "Auto Prestige", "Automatically prestige.", "AutoPrestige")
    for i = 1, 5 do
        ProgPick(PrestigeForm, "Prestige " .. i .. " Boost", BOOSTS, "PrestigeBoost" .. i)
    end
    ProgSlider(PrestigeForm, "Prestige Stop At", nil, "PrestigeStopAt")
    local PrestigeStatusRow = PrestigeForm:Row()
    local PrestigeStack = PrestigeStatusRow:Left():TitleStack({ Title = "Prestige Status", Subtitle = "Idle" })
    local MemorySection = ProgressionTab:PageSection({
        Title = "🧠 Memories Priority",
        Subtitle = "Set a priority for each memory (0 - 10)."
    })
    local MemoryForm = MemorySection:Form()
    for _, m in ipairs(SH.Memories) do
        ProgSlider(MemoryForm, m.Name, string.rep("★", m.Stars) .. "  " .. m.Desc, m.Key)
    end

    do
        local P = { Busy = false, Pending = false }
        Farm.Prestige = P
        SH.Coord.Register("Auto Prestige", 10, function() return P.Pending end, function() return P.Busy end, 240)
        local function Say(t) pcall(function() PrestigeStack.Subtitle = tostring(t) end) end
        local function Norm(x)
            x = tostring(x or ""):gsub("<[^>]->", ""):lower():gsub("[^%w]", "")
            return x
        end
        local function Path(...)
            local cur = PlayerGui
            for _, n in ipairs({ ... }) do
                cur = cur and cur:FindFirstChild(n)
            end
            return cur
        end
        local function HasText(btn, label)
            local want = Norm(label)
            if btn:IsA("TextButton") and Norm(btn.Text) == want then return true end
            for _, d in ipairs(btn:GetDescendants()) do
                if (d:IsA("TextLabel") or d:IsA("TextButton")) and Norm(d.Text) == want then return true end
            end
            return false
        end
        local function FindButton(label, extra)
            local n = 0
            for _, d in ipairs(PlayerGui:GetDescendants()) do
                n += 1
                if n % 1500 == 0 then task.wait() end
                if d:IsA("GuiButton") and IsShown(d) and HasText(d, label) and (not extra or extra(d)) then
                    return d
                end
            end
            return nil
        end
        local function FindLabel(normText)
            local n = 0
            for _, d in ipairs(PlayerGui:GetDescendants()) do
                n += 1
                if n % 1500 == 0 then task.wait() end
                if d:IsA("TextLabel") and IsShown(d) and Norm(d.Text) == normText then return d end
            end
            return nil
        end
        local function DialogMentions(btn, normText)
            local cur = btn.Parent
            for _ = 1, 5 do
                if not cur or cur == PlayerGui then break end
                for _, x in ipairs(cur:GetDescendants()) do
                    if x:IsA("TextLabel") and IsShown(x) and Norm(x.Text):find(normText, 1, true) then return true end
                end
                cur = cur.Parent
            end
            return false
        end

        local METHODS = {
            function(b)
                if type(firesignal) ~= "function" then return false end
                return (pcall(firesignal, b.Activated))
            end,
            function(b)
                if type(firesignal) ~= "function" then return false end
                return (pcall(firesignal, b.MouseButton1Click))
            end,
            function(b)
                pcall(function() GuiService.SelectedObject = b end)
                task.wait(0.1)
                return (pcall(function()
                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                    task.wait(0.05)
                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                end))
            end,
            function(b)
                local gui = b:FindFirstAncestorOfClass("ScreenGui")
                local inset = (gui and gui.IgnoreGuiInset) and Vector2.zero or GuiService:GetGuiInset()
                local pos = b.AbsolutePosition + b.AbsoluteSize / 2 + inset
                return (pcall(function()
                    VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, true, game, 0)
                    task.wait(0.05)
                    VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, false, game, 0)
                end))
            end,
        }
        local function PressOnce(btn)
            for _, m in ipairs(METHODS) do
                if m(btn) then return true end
            end
            return false
        end
        local function ClickUntil(findFn, doneFn, timeout)
            local deadline = os.clock() + timeout
            local mi = 1
            while os.clock() < deadline and Alive() and Cfg.AutoPrestige do
                if doneFn() then return true end
                local btn = findFn()
                if btn then
                    METHODS[mi](btn)
                    local t = os.clock()
                    while os.clock() - t < 1.5 do
                        if doneFn() then return true end
                        task.wait(0.1)
                    end
                    mi = mi % #METHODS + 1
                else
                    task.wait(0.4)
                end
            end
            return doneFn()
        end

        local function CardButton(label, others)
            local cur = label.Parent
            for _ = 1, 6 do
                if not cur or cur == PlayerGui then break end
                local descendants = cur:GetDescendants()
                for _, x in ipairs(descendants) do
                    if others[x] then return nil end
                end
                for _, x in ipairs(descendants) do
                    if x:IsA("GuiButton") and IsShown(x) then return x end
                end
                cur = cur.Parent
            end
            return nil
        end

        local function CardFrame(label, others)
            local best, cur = nil, label.Parent
            local cam = workspace.CurrentCamera
            local maxW = cam and cam.ViewportSize.X * 0.4 or math.huge
            for _ = 1, 6 do
                if not cur or cur == PlayerGui or not cur:IsA("GuiObject") then break end
                if cur.AbsoluteSize.X > maxW then break end
                local bad = false
                for _, x in ipairs(cur:GetDescendants()) do
                    if others[x] then bad = true break end
                end
                if bad then break end
                best = cur
                cur = cur.Parent
            end
            return best
        end
        local function DumpCard(card)
            local rows = {}
            for _, d in ipairs(card:GetDescendants()) do
                if #rows >= 30 then break end
                rows[#rows + 1] = d.ClassName .. ":" .. d.Name .. (d:IsA("GuiButton") and "[btn]" or "")
            end
            warn("[Aotr:Update[5]] boost card " .. card:GetFullName() .. " -> " .. table.concat(rows, ", "))
        end
        local BOOST_LABEL = { Luck = "luckboost", Gold = "goldboost", EXP = "expboost" }
        local function BoostScreenShown()
            return FindLabel("luckboost") ~= nil
        end
        local function FinishShown()
            return FindButton("FINISH") ~= nil
        end
        local function YesButton()
            return FindButton("YES", function(b) return DialogMentions(b, "areyousureyouwanttoprestige") end)
        end

        local function MemoryCandidates()
            local byName = {}
            for _, m in ipairs(SH.Memories) do
                byName[Norm((m.Name:gsub("^%[.-%]%s*", "")))] = m
            end
            local list, n = {}, 0
            for _, d in ipairs(PlayerGui:GetDescendants()) do
                n += 1
                if n % 1500 == 0 then task.wait() end
                if d:IsA("TextLabel") and IsShown(d) then
                    local m = byName[Norm(d.Text)]
                    if m then
                        local full = d:GetFullName()
                        if not full:find(".Passives.", 1, true) and not full:find(".Storage.", 1, true) then
                            list[#list + 1] = { label = d, mem = m }
                        end
                    end
                end
            end
            return list
        end

        local function PrestigeCount() return tonumber(LocalPlayer:GetAttribute("Prestige")) or 0 end

        local function Eligible()
            local lbl = Path("Interface", "Equipment", "Prestige", "Progress", "Level")
            if not (lbl and lbl:IsA("TextLabel")) then return false, "Prestige page not found" end
            local txt = lbl.Text
            if Norm(txt):find("maxlvl", 1, true) then return true end
            local cur, max = txt:match("(%d+)%s*/%s*(%d+)")
            cur = tonumber(LocalPlayer:GetAttribute("Level")) or tonumber(cur)
            max = tonumber(max)
            if cur and max and cur >= max then return true end
            return false, ("Level %s / %s is not maxed yet"):format(tostring(cur), tostring(max))
        end

        local function RunFlow(stage)
            P.Busy = true
            local before = PrestigeCount()
            local nextIndex = math.clamp(before + 1, 1, 5)
            local ok, where = pcall(function()
                if stage <= 1 then
                    Say("Opening the Prestige page...")
                    local function PageFinder()
                        local eq = Path("Interface", "Equipment")
                        if not (eq and IsShown(eq)) then
                            return Path("Interface", "Topbar", "Main", "Categories", "Equipment", "Interact")
                        end
                        return Path("Interface", "Equipment", "Categories", "Prestige", "Main", "Interact")
                    end
                    local function PrestigeBtn()
                        local b = Path("Interface", "Equipment", "Prestige", "B_Prestige")
                        return (b and IsShown(b)) and b or nil
                    end
                    if not ClickUntil(PageFinder, function() return PrestigeBtn() ~= nil end, 12) then return "open the Prestige page" end
                    Say("Pressing the PRESTIGE button...")
                    if not ClickUntil(PrestigeBtn, function() return YesButton() ~= nil end, 10) then return "PRESTIGE button" end
                end
                if stage <= 3 then
                    Say("Confirming YES...")
                    if not ClickUntil(YesButton, BoostScreenShown, 10) then return "YES button" end
                end
                if stage <= 4 then
                    local want = Cfg["PrestigeBoost" .. nextIndex] or "Luck"
                    Say(("Picking buff %s (prestige #%d)..."):format(want, nextIndex))
                    local lab = BOOST_LABEL[want] and FindLabel(BOOST_LABEL[want])
                    if lab then
                        local others = {}
                        for k, v in pairs(BOOST_LABEL) do
                            if k ~= want then
                                local o = FindLabel(v)
                                if o then others[o] = true end
                            end
                        end
                        for attempt = 1, 3 do
                            local btn = CardButton(lab, others)
                            local card = CardFrame(lab, others)
                            if attempt == 1 then
                                if card then METHODS[4](card) elseif btn then PressOnce(btn) end
                            elseif attempt == 2 then
                                if btn then PressOnce(btn) elseif card then METHODS[4](card) end
                            else
                                METHODS[4](lab)
                            end
                            local seen = false
                            local t = os.clock()
                            while os.clock() - t < 1.5 do
                                task.wait(0.3)
                                if FindButton("NEXT") then seen = true break end
                            end
                            if seen then break end
                            if attempt == 3 and card then DumpCard(card) end
                        end
                    else
                        Say("Buff card not found: " .. tostring(want))
                    end
                    Say("Pressing NEXT...")
                    if not ClickUntil(function() return FindButton("NEXT") end, FinishShown, 10) then return "NEXT button" end
                end
                -- stage 5
                task.wait(0.8)
                local cands = MemoryCandidates()
                if #cands > 0 then
                    table.sort(cands, function(x, y)
                        local px, py = Cfg[x.mem.Key] or 5, Cfg[y.mem.Key] or 5
                        if px ~= py then return px > py end
                        if x.mem.Stars ~= y.mem.Stars then return x.mem.Stars > y.mem.Stars end
                        return x.label.AbsolutePosition.X < y.label.AbsolutePosition.X
                    end)
                    local best = cands[1]
                    Say("Picking card " .. best.mem.Name .. " ...")
                    local others = {}
                    for i = 2, #cands do others[cands[i].label] = true end
                    local card = CardFrame(best.label, others)
                    if card then
                        METHODS[4](card)
                        task.wait(0.6)
                    else
                        local btn = CardButton(best.label, others)
                        if btn then PressOnce(btn) task.wait(0.6) end
                    end
                else
                    Say("Memory card not found - using the one currently selected")
                end
                Say("Pressing FINISH...")
                local function Finished() return not FinishShown() end
                if not ClickUntil(function() return FindButton("FINISH") end, Finished, 12) then return "FINISH button" end
                return nil
            end)
            P.Busy = false
            if not ok then
                Say("Error: " .. tostring(where))
                return false
            end
            if where then
                Say("Failed at: " .. where .. " (retrying in 30 seconds)")
                return false
            end
            Say(("Prestige complete (now Prestige %d)"):format(PrestigeCount()))
            return true
        end

        task.spawn(function()
            local cooldownUntil, tick = 0, 0
            while Alive() do
                task.wait(1)
                tick += 1
                if not Cfg.AutoPrestige then
                    P.Pending = false
                    if tick % 5 == 0 then Say("Off") end
                elseif not (IN_MENU or game.PlaceId == 14916516914) then
                    P.Pending = false
                    Say("Only works in the lobby")
                elseif not P.Busy and os.clock() >= cooldownUntil then
                    local count = PrestigeCount()
                    if count >= (Cfg.PrestigeStopAt or 1) then
                        P.Pending = false
                        Say(("Stopped: Prestige %d reached the target %d"):format(count, Cfg.PrestigeStopAt or 1))
                    else
                        local stage = nil
                        if tick % 5 == 0 then
                            if FinishShown() then stage = 5
                            elseif BoostScreenShown() then stage = 4
                            elseif YesButton() then stage = 3 end
                        end
                        if not stage then
                            local okLvl, why = Eligible()
                            if okLvl then stage = 1 else P.Pending = false Say(why or "Waiting for max level") end
                        end
                        if stage then
                            P.Pending = true
                            local done = RunFlow(stage)
                            if done then P.Pending = false end
                            cooldownUntil = os.clock() + (done and 10 or 30)
                        end
                    end
                end
            end
        end)
    end
end
local SkillTreesTab = LobbyCategory:Tab({
    Title = "Skill Trees",
    Icon = Icon("bookPagesFill", "bookFill", "book"),
})
do
    local SKILL_INTERVAL = 10
    local SKILL_GAP = 1.5
    local SKILL_TIMEOUT = 8
    local SKILL_PATHS = {
        Left = {
            ["Regen VI"] = { "89", "88", "87", "86", "85", "84", "83", "82", "81", "80", "79", "78", "77", "76", "75", "154", "73", "72", "71", "70" },
            ["Injury III"] = { "98", "97", "96", "95", "94", "93", "92", "91", "90", "80", "79", "78", "77", "76", "75", "154", "73", "72", "71", "70" },
        },
        Middle = {
            ["Damage V"] = { "149", "148", "147", "146", "145", "144", "143", "142", "141", "140", "139", "138", "125", "124", "123", "122", "121", "120", "119", "118", "117", "116", "115", "114", "113" },
            ["Crit Damage V"] = { "137", "136", "135", "134", "133", "132", "131", "130", "129", "128", "127", "126", "125", "124", "123", "122", "121", "120", "119", "118", "117", "116", "115", "114", "113" },
        },
        Right = {
            ["Tank VIII"] = { "69", "68", "67", "66", "65", "64", "63", "62", "61", "60", "151", "58", "45", "44", "43", "42", "41", "150", "39", "38" },
            ["Health XI"] = { "57", "56", "55", "54", "53", "52", "51", "50", "49", "48", "47", "46", "45", "44", "43", "42", "41", "150", "39", "38" },
        },
    }
    local SkillSection = SkillTreesTab:PageSection({
        Title = "Skills",
        Subtitle = "Auto upgrade the skill tree."
    })
    local SkillForm = SkillSection:Form()
    local SkillStatusRow = SkillForm:Row()
    SkillStatusRow:Left():TitleStack({ Title = "Skill Status", Subtitle = "Result of the last request." })
    local SkillStatusLabel = SkillStatusRow:Right():Label({ Text = "Idle" })
    local function SetSkillStatus(text)
        pcall(function() SkillStatusLabel.Text = tostring(text) end)
    end
    local skillWake = false
    local skillRemote = nil
    local function GetSkillRemote()
        if skillRemote and skillRemote.Parent then return skillRemote end
        skillRemote = GetLobbyRemote()
        return skillRemote
    end
    local function SkillInvoke(...)
        local remote = GetSkillRemote()
        if not remote then return false, "remote not found" end
        local args = table.pack(...)
        local done, ok, result = false, false, nil
        task.spawn(function()
            ok, result = pcall(function()
                return remote:InvokeServer(table.unpack(args, 1, args.n))
            end)
            done = true
        end)
        local t0 = os.clock()
        while not done and os.clock() - t0 < SKILL_TIMEOUT do task.wait(0.1) end
        if not done then return false, "timeout" end
        return ok, result
    end
    local SKILL_LANES = {
        { Name = "Left",   On = "SkillLeft",   Pick = "SkillLeftPick",   Pri = "SkillLeftPriority" },
        { Name = "Middle", On = "SkillMiddle", Pick = "SkillMiddlePick", Pri = "SkillMiddlePriority" },
        { Name = "Right",  On = "SkillRight",  Pick = "SkillRightPick",  Pri = "SkillRightPriority" },
    }
    local function UpgradeSkills()
        local lanes = {}
        for i, lane in ipairs(SKILL_LANES) do
            if Cfg[lane.On] then
                lanes[#lanes + 1] = { lane = lane, order = i }
            end
        end
        if #lanes == 0 then
            SetSkillStatus("No path enabled")
            return
        end
        table.sort(lanes, function(a, b)
            local pa, pb = Cfg[a.lane.Pri], Cfg[b.lane.Pri]
            if pa ~= pb then return pa < pb end
            return a.order < b.order
        end)
        for _, entry in ipairs(lanes) do
            if not Alive() or not Cfg.AutoUpgradeSkills then return end
            local lane = entry.lane
            local pick = Cfg[lane.Pick]
            local ids = SKILL_PATHS[lane.Name] and SKILL_PATHS[lane.Name][pick]
            if not ids then
                SetSkillStatus(lane.Name .. " ( " .. tostring(pick) .. " ): not supported yet")
            else
                local ok, r = SkillInvoke("S_Equipment", "Unlock", table.clone(ids))
                SetSkillStatus(ok and (lane.Name .. " ( " .. pick .. " ) sent: " .. tostring(r))
                    or (lane.Name .. " ( " .. pick .. " ) failed: " .. tostring(r)))
                task.wait(SKILL_GAP)
            end
        end
    end
    task.spawn(function()
        local last = 0
        while Alive() do
            if Cfg.AutoUpgradeSkills and (skillWake or os.clock() - last >= SKILL_INTERVAL) then
                skillWake = false
                last = os.clock()
                UpgradeSkills()
            end
            task.wait(1)
        end
    end)
    local function SkillToggle(form, title, subtitle, key)
        local row = form:Row()
        row:Left():TitleStack({ Title = title, Subtitle = subtitle })
        UiSync.Link(row:Right():Toggle({
            Value = Cfg[key],
            ValueChanged = function(self, value)
                Cfg[key] = value and true or false
                Save()
                if value then skillWake = true end
            end
        }), Cfg, key)
    end
    local function SkillPick(form, title, options, key)
        local row = form:Row()
        row:Left():TitleStack({ Title = title })
        local btn = row:Right():PullDownButton({
            Label = Cfg[key],
            Options = options,
            Value = table.find(options, Cfg[key]) or 1,
            ValueChanged = function(self, index)
                if options[index] then
                    Cfg[key] = options[index]
                    self.Label = options[index]
                    Save()
                end
            end
        })
        StyleDropdown(btn)
        UiSync.Add(function()
            local i = table.find(options, Cfg[key]) or 1
            btn.Value = i
            btn.Label = options[i]
        end)
    end
    SkillToggle(SkillForm, "Auto Upgrade Skills", "Automatically upgrade skills tree.", "AutoUpgradeSkills")
    SkillToggle(SkillForm, "Left", "Upgrade the left path.", "SkillLeft")
    SkillPick(SkillForm, "Left Path", { "Regen VI", "Injury III" }, "SkillLeftPick")
    SkillToggle(SkillForm, "Middle", "Upgrade the middle path.", "SkillMiddle")
    SkillPick(SkillForm, "Middle Path", { "Damage V", "Crit Damage V" }, "SkillMiddlePick")
    SkillToggle(SkillForm, "Right", "Upgrade the right path.", "SkillRight")
    SkillPick(SkillForm, "Right Path", { "Tank VIII", "Health XI" }, "SkillRightPick")
    local PrioritySection = SkillTreesTab:PageSection({
        Title = "Upgrade Priority",
        Subtitle = "Adjust the upgrade priority to determine which path you want to upgrade first."
    })
    local PriorityForm = PrioritySection:Form()
    local function SkillPriority(title, key)
        local range = FARM_RANGES[key]
        local row = PriorityForm:Row()
        local function titleFor(v) return title .. " ( " .. v .. " )" end
        local stack = row:Left():TitleStack({ Title = titleFor(Cfg[key]) })
        UiSync.Link(row:Right():Slider({
            Minimum = range[1],
            Maximum = range[2],
            Value = Cfg[key],
            ValueChanged = function(self, value)
                local v = math.clamp(math.floor(value + 0.5), range[1], range[2])
                Cfg[key] = v
                pcall(function() stack.Title = titleFor(v) end)
                Save()
            end
        }), Cfg, key, function(_, want)
            pcall(function() stack.Title = titleFor(want) end)
        end)
    end
    SkillPriority("Left Priority", "SkillLeftPriority")
    SkillPriority("Middle Priority", "SkillMiddlePriority")
    SkillPriority("Right Priority", "SkillRightPriority")
end
local PerksTab = LobbyCategory:Tab({
    Title = "Perks",
    Icon = Icon("sparkles", "sparkle", "starFill"),
})
do
    local function PerkToggle(form, title, subtitle, key)
        local row = form:Row()
        row:Left():TitleStack({ Title = title, Subtitle = subtitle })
        UiSync.Link(row:Right():Toggle({
            Value = Cfg[key],
            ValueChanged = function(self, value)
                Cfg[key] = value and true or false
                Save()
            end
        }), Cfg, key)
    end
    local function PerkSlider(form, title, key)
        local range = FARM_RANGES[key]
        local row = form:Row()
        local function titleFor(v) return title .. " ( " .. v .. " )" end
        local stack = row:Left():TitleStack({ Title = titleFor(Cfg[key]) })
        UiSync.Link(row:Right():Slider({
            Minimum = range[1],
            Maximum = range[2],
            Value = Cfg[key],
            ValueChanged = function(self, value)
                local v = math.clamp(math.floor(value + 0.5), range[1], range[2])
                Cfg[key] = v
                pcall(function() stack.Title = titleFor(v) end)
                Save()
            end
        }), Cfg, key, function(_, want)
            pcall(function() stack.Title = titleFor(want) end)
        end)
    end
    local CraftSection = PerksTab:PageSection({
        Title = "🔨 Crafting",
        Subtitle = "Automatically craft perks."
    })
    local CraftForm = CraftSection:Form()
    PerkToggle(CraftForm, "Auto Craft Perks", "Automatically craft perks.", "AutoCraftPerks")
    PerkToggle(CraftForm, "Common → Rare", nil, "CraftCommonRare")
    PerkSlider(CraftForm, "Common → Rare Chance", "CraftChanceCommonRare")
    PerkToggle(CraftForm, "Rare → Epic", nil, "CraftRareEpic")
    PerkSlider(CraftForm, "Rare → Epic Chance", "CraftChanceRareEpic")
    PerkToggle(CraftForm, "Epic → Legendary", nil, "CraftEpicLegendary")
    PerkSlider(CraftForm, "Epic → Legendary Chance", "CraftChanceEpicLegendary")
    PerkToggle(CraftForm, "Legendary → Mythic", nil, "CraftLegendaryMythic")
    PerkSlider(CraftForm, "Legendary → Mythic Chance", "CraftChanceLegendaryMythic")
end
local GameModeCategory = Cascade.Components.Section(Window, {
    Title = "Game Mode",
    Disclosure = false
})
local MissionsTab = GameModeCategory:Tab({
    Title = "Missions",
    Icon = Icon("listClipboardFill", "clipboardFill", "checklist"),
})
local WaveModeTab = GameModeCategory:Tab({
    Title = "Wave Mode",
    Icon = Icon("waveformCircleFill", "waveform", "tornado"),
})
local RaidModeTab = GameModeCategory:Tab({
    Title = "Raid Mode",
    Icon = Icon("diamondFill", "shieldFill", "flameFill"),
})
local MISSION_OPTIONS    = { "Shiganshina", "Trost", "Outskirts", "Forest", "Utgard", "Docks", "Stohess", "Chapel" }
local OBJECTIVE_OPTIONS  = { "Skirmish" }
local DIFFICULTY_OPTIONS = { "Easy (E- Grade)", "Normal (E+ Grade)", "Hard (D+ Grade)", "Severe (B- Grade)", "Aberrant (A- Grade)" }
local MODIFIER_OPTIONS   = { "No Perks", "No Skills", "No Memories", "Nightmare", "Oddball", "Injury Prone", "Chronic Injuries", "Fog", "Glass Cannon", "Time Trial", "Boring", "Simple" }
do
    local MissionsSection = MissionsTab:PageSection({
        Title = "📜 Mission Settings",
        Subtitle = "Pick the mission, objective, difficulty and modifiers for your room."
    })
    local MissionForm = MissionsSection:Form()
    local AutoMissionSection = MissionsTab:PageSection({
        Title = "🤖 Auto Mission",
        Subtitle = "Create your room first, then turn on Auto Start."
    })
    local AutoMissionForm = AutoMissionSection:Form()
    local MissionStatusRow = MissionForm:Row()
    MissionStatusRow:Left():TitleStack({ Title = "Mission Status", Subtitle = "Current step and last result." })
    local MissionStatusLabel = MissionStatusRow:Right():Label({ Text = "Idle" })
    local STATUS_RED = Color3.fromRGB(255, 69, 58)
    local statusDefaultColor = nil
    pcall(function()
        local o = LabelObject(MissionStatusLabel)
        if o then statusDefaultColor = o.TextColor3 end
    end)
    local function SetMissionStatus(text, isError)
        pcall(function() MissionStatusLabel.Text = tostring(text) end)
        pcall(function()
            local o = LabelObject(MissionStatusLabel)
            if not o then return end
            if isError then
                o.TextColor3 = STATUS_RED
            elseif statusDefaultColor then
                o.TextColor3 = statusDefaultColor
            end
        end)
    end
    local missionToggles = {}
    local function SetMissionToggle(key, value)
        pcall(function() missionToggles[key].Value = value end)
    end
    local function ResetAutoCreate(reason, quiet)
        if not Cfg.AutoCreateMission then return end
        Cfg.AutoCreateMission = false
        Save()
        SetMissionToggle("AutoCreateMission", false)
        if not quiet and reason then SetMissionStatus("Auto Create off (" .. tostring(reason) .. ")") end
    end
    local missionRecreateAt = nil
    local function RequestRecreate()
        if Cfg.AutoCreateMission then missionRecreateAt = os.clock() + 1.5 end
    end
    local createdRoom = nil
    local function MyRoomObject()
        local folder = ReplicatedStorage:FindFirstChild("Missions")
        if not folder then return nil end
        for _, room in ipairs(folder:GetChildren()) do
            local leader = room:FindFirstChild("Leader")
            if leader and leader:IsA("ValueBase") and leader.Value == LocalPlayer.Name then
                return room
            end
        end
        return nil
    end
    local function HasRoom()
        if createdRoom and createdRoom.Parent ~= nil then return true end
        return MyRoomObject() ~= nil
    end
    local missionStacks = {}
    local function KeepValid(options, value, fallback)
        return table.find(options, value) and value or fallback
    end
    local function KeepValidList(options, list)
        local out, seen = {}, {}
        if type(list) == "table" then
            for _, name in ipairs(list) do
                if table.find(options, name) and not seen[name] then
                    seen[name] = true
                    out[#out + 1] = name
                end
            end
        end
        return out
    end
    Cfg.MissionSelect = KeepValid(MISSION_OPTIONS, Cfg.MissionSelect, MISSION_OPTIONS[1])
    Cfg.MissionObjective = KeepValid(OBJECTIVE_OPTIONS, Cfg.MissionObjective, OBJECTIVE_OPTIONS[1])
    Cfg.MissionLevel = KeepValid(DIFFICULTY_OPTIONS, Cfg.MissionLevel, DIFFICULTY_OPTIONS[1])
    Cfg.MissionModifiers = KeepValidList(MODIFIER_OPTIONS, Cfg.MissionModifiers)
    local function AddSingleSelect(title, subtitle, options, key)
        local row = MissionForm:Row()
        row:Left():TitleStack({ Title = title, Subtitle = subtitle })
        local btn = row:Right():PullDownButton({
            Label = Cfg[key],
            Options = options,
            Value = table.find(options, Cfg[key]) or 1,
            ValueChanged = function(self, index)
                if options[index] then
                    Cfg[key] = options[index]
                    self.Label = options[index]
                    Save()
                    RequestRecreate()
                end
            end
        })
        StyleDropdown(btn)
        UiSync.Add(function()
            local i = table.find(options, Cfg[key]) or 1
            btn.Value = i
            btn.Label = options[i]
        end)
    end
    local function AddMultiSelect(title, subtitle, options, key)
        local row = MissionForm:Row()
        row:Left():TitleStack({ Title = title, Subtitle = subtitle })
        local function apply(value)
            local indexes = type(value) == "table" and value or { value }
            local names = {}
            for _, index in ipairs(SettingsStore.ValidIndexes(indexes, #options)) do
                names[#names + 1] = options[index]
            end
            Cfg[key] = names
            Save()
            RequestRecreate()
        end
        local current = {}
        for i, name in ipairs(options) do
            if table.find(Cfg[key], name) then current[#current + 1] = i end
        end
        local ok, btn = pcall(function()
            return row:Right():PopUpButton({
                Options = options,
                Maximum = #options,
                Value = current,
                ValueChanged = function(self, value) apply(value) end
            })
        end)
        if not ok or not btn then
            btn = row:Right():PullDownButton({
                Label = Cfg[key][1] or "None",
                Options = options,
                Value = table.find(options, Cfg[key][1]) or 1,
                ValueChanged = function(self, index)
                    apply(index)
                    self.Label = options[index] or "None"
                end
            })
        end
        StyleDropdown(btn)
        UiSync.Add(function()
            if ok then
                local picked = {}
                for i, name in ipairs(options) do
                    if table.find(Cfg[key], name) then picked[#picked + 1] = i end
                end
                btn.Value = picked
            else
                local i = table.find(options, Cfg[key][1]) or 1
                btn.Value = i
                btn.Label = options[i]
            end
        end)
    end
    local function AddMissionToggle(title, subtitle, key, form, onChange)
        local row = (form or MissionForm):Row()
        missionStacks[key] = { stack = row:Left():TitleStack({ Title = title, Subtitle = subtitle }), text = subtitle }
        missionToggles[key] = UiSync.Link(row:Right():Toggle({
            Value = Cfg[key],
            ValueChanged = function(self, value)
                Cfg[key] = value and true or false
                Save()
                if onChange then onChange(Cfg[key]) end
            end
        }), Cfg, key)
    end
    local initializing = true
    local CreateRoomOnce
    AddSingleSelect("Select Mission", "Choose the mission.", MISSION_OPTIONS, "MissionSelect")
    AddSingleSelect("Select Objective", "Only Skirmish for now.", OBJECTIVE_OPTIONS, "MissionObjective")
    AddSingleSelect("Select Difficulty", "Difficulty used when creating the room.", DIFFICULTY_OPTIONS, "MissionLevel")
    AddMultiSelect("Select Modifiers", "Tick the Modifiers to apply after creating.", MODIFIER_OPTIONS, "MissionModifiers")
    AddMissionToggle("Auto Create Mission", "Keeps a room ready with these settings. Remembered next time.", "AutoCreateMission", AutoMissionForm, function(on)
        if on then SetMissionToggle("AutoCreateRaid", false) SetMissionToggle("AutoCreateWave", false) end
        if on and not initializing then missionRecreateAt = os.clock() SH.autoPaused = false end
    end)
    AddMissionToggle("Auto Start Missions", "Starts the mission in your room. Remembered next time.", "AutoStartMission", AutoMissionForm, function(on)
        if on then SetMissionToggle("AutoStartRaid", false) SetMissionToggle("AutoStartWave", false) end
    end)
    local MissionDelayRow = AutoMissionForm:Row()
    local delaySubtitle = "Seconds between starts (" .. MIN_DELAY .. " - " .. MAX_DELAY .. ")."
    missionStacks.JoinDelay = {
        stack = MissionDelayRow:Left():TitleStack({ Title = "Join Delay", Subtitle = delaySubtitle }),
        text = delaySubtitle,
    }
    local MissionDelayRight = MissionDelayRow:Right()
    local MissionDelayLabel = MissionDelayRight:Label({ Text = Cfg.MissionJoinDelay .. "s" })
    UiSync.Link(MissionDelayRight:Slider({
        Minimum = MIN_DELAY,
        Maximum = MAX_DELAY,
        Value = Cfg.MissionJoinDelay,
        ValueChanged = function(self, value)
            Cfg.MissionJoinDelay = ClampDelay(value)
            pcall(function() MissionDelayLabel.Text = Cfg.MissionJoinDelay .. "s" end)
            Save()
        end
    }), Cfg, "MissionJoinDelay", function(_, want)
        pcall(function() MissionDelayLabel.Text = want .. "s" end)
    end)
    local MissionCountRow = AutoMissionForm:Row()
    MissionCountRow:Left():TitleStack({ Title = "Next Mission", Subtitle = "Countdown to the next start." })
    local MissionCountLabel = MissionCountRow:Right():Label({ Text = "Off" })
    local lastCountText = nil
    local function SetMissionCountdown(text)
        if text == lastCountText then return end
        lastCountText = text
        pcall(function() MissionCountLabel.Text = text end)
    end
    local function RefreshRoomGate() return HasRoom() end
    local LOBBY_PLACE_ID = 14916516914
    local ON_LOBBY_PLACE = (game.PlaceId == LOBBY_PLACE_ID)
    local CALL_TIMEOUT = 8
    local START_GAP = 1.5
    local missionRemote = nil
    local function MissionInvoke(...)
        if not missionRemote or not missionRemote.Parent then
            missionRemote = GetLobbyRemote()
        end
        if not missionRemote then return false, "remote not found" end
        local remote = missionRemote
        local args = table.pack(...)
        local done, ok, result = false, false, nil
        task.spawn(function()
            ok, result = pcall(function()
                return remote:InvokeServer(table.unpack(args, 1, args.n))
            end)
            done = true
        end)
        local t0 = os.clock()
        while not done and os.clock() - t0 < CALL_TIMEOUT do task.wait(0.1) end
        if not done then return false, "timeout" end
        return ok, result
    end
    local missionBusy = false
    local MODIFY_GAP = 0.17
    local function LeaveRoom(silent)
        if not ON_LOBBY_PLACE then
            if not silent then SetMissionStatus("Not in the lobby place") end
            return false
        end
        local ok, r = MissionInvoke("S_Missions", "Leave")
        if not silent then
            SetMissionStatus(ok and "Leave sent" or ("Leave failed: " .. tostring(r)))
        end
        return ok
    end
    local function RoomServerDifficulty(room)
        if typeof(room) ~= "Instance" then return nil end
        local okV, value = pcall(function() return room.Value end)
        if okV and type(value) == "string" then return value end
        return nil
    end
    local function RoomMapName(room)
        if typeof(room) ~= "Instance" then return nil end
        local okN, name = pcall(function() return room.Name end)
        if okN and type(name) == "string" then return name end
        return nil
    end
    local function DifficultyKey(label)
        return (label or ""):match("^(%S+)") or "Easy"
    end
    local function NormKey(v)
        if type(v) ~= "string" then return nil end
        local w = v:match("^%s*(%a+)")
        return w and w:lower() or nil
    end
    local function BoostedMap()
        local function fromHolder(holder)
            local okA, attrs = pcall(function() return holder:GetAttributes() end)
            if not okA or type(attrs) ~= "table" then return nil end
            local name, left
            for k, v in pairs(attrs) do
                local lk = tostring(k):lower()
                if lk:find("boost") then
                    if type(v) == "string" and table.find(MISSION_OPTIONS, v) then name = v
                    elseif type(v) == "number" and (lk:find("time") or lk:find("left")) then left = v end
                end
            end
            return name, left
        end
        local name = workspace:GetAttribute("Boosted_Map")
        local left = workspace:GetAttribute("Boosted_Timer")
        if type(name) ~= "string" or not table.find(MISSION_OPTIONS, name) then
            name, left = nil, nil
            for _, holder in ipairs({ workspace, ReplicatedStorage, LocalPlayer }) do
                local n, l = fromHolder(holder)
                if n then name, left = n, l break end
            end
        end
        if not name then return nil end
        if type(left) == "number" and left <= 3 then return nil end
        return name, (type(left) == "number") and left or nil
    end
    local bestGradeCache = nil
    local BEST_CACHE_SECONDS = 600
    local GRADE_RANK = { E = 1, D = 2, C = 3, B = 4, A = 5, S = 6 }
    local function GradeRankOf(text)
        if type(text) ~= "string" then return nil end
        local letter = text:upper():match("[%[%(]%s*([A-S])[%+%-]?%s*GRADE")
        return letter and GRADE_RANK[letter] or nil
    end
    local function ReadGearRank()
        local ok, text = pcall(function()
            return PlayerGui.Interface.Equipment.Categories.Upgrades.Main.Title.Text
        end)
        if not ok then return nil end
        return GradeRankOf(text), text
    end
    local function DifficultyCandidates()
        local list = {}
        for i = #DIFFICULTY_OPTIONS, 1, -1 do
            list[#list + 1] = DifficultyKey(DIFFICULTY_OPTIONS[i])
        end
        local gearRank = ReadGearRank()
        if gearRank then
            local allowed = {}
            for _, key in ipairs(list) do
                for _, opt in ipairs(DIFFICULTY_OPTIONS) do
                    if DifficultyKey(opt) == key then
                        local need = GradeRankOf(opt)
                        if not need or need <= gearRank then allowed[#allowed + 1] = key end
                    end
                end
            end
            if #allowed == 0 then allowed[1] = list[#list] end
            list = allowed
        end
        if bestGradeCache and os.clock() - bestGradeCache.at < BEST_CACHE_SECONDS then
            local start = table.find(list, bestGradeCache.key)
            if start then
                start = math.max(1, start - 1)
                local trimmed = {}
                for i = start, #list do trimmed[#trimmed + 1] = list[i] end
                return trimmed
            end
        end
        return list
    end
    CreateRoomOnce = function(oneShot)
        if not ON_LOBBY_PLACE then SetMissionStatus("Not in the lobby place") return false end
        if missionBusy then SetMissionStatus("Busy - turn Auto Create off and on again") return false end
        missionBusy = true
        local function Off()
            if oneShot or Cfg.AutoCreateMission then return false end
            SetMissionStatus("Stopped (Auto Create turned off)")
            missionBusy = false
            return true
        end
        local boosted = Cfg.AutoBoostMission and BoostedMap() or nil
        local maps = {}
        if boosted then maps[#maps + 1] = boosted end
        if boosted ~= Cfg.MissionSelect then maps[#maps + 1] = Cfg.MissionSelect end
        local bestMode = Cfg.AutoBestGrade
        local fixedKey = DifficultyKey(Cfg.MissionLevel)
        local mapName, difficulty, room = nil, nil, nil
        local failMsg = nil
        local trace, unverified = {}, false
        local known = {}
        for _, o in ipairs(DIFFICULTY_OPTIONS) do known[NormKey(o)] = true end
        for _, tryMap in ipairs(maps) do
            local keys = bestMode and DifficultyCandidates() or { fixedKey }
            local mapRejected = false
            for _, key in ipairs(keys) do
                SetMissionStatus(("Leaving old room... (%s)"):format(tryMap))
                LeaveRoom(true)
                task.wait(0.6)
                if Off() then return false end
                SetMissionStatus(("Creating %s (%s)%s%s..."):format(
                    tryMap, key, tryMap == boosted and " (boost)" or "", bestMode and " (best grade)" or ""))
                local ok, r = MissionInvoke("S_Missions", "Create", {
                    Difficulty = key,
                    Type = "Missions",
                    Objective = Cfg.MissionObjective,
                    Name = tryMap,
                })
                if not ok then
                    SetMissionStatus("Create failed: " .. tostring(r), true)
                    missionBusy = false
                    return false
                end
                if Off() then return false end
                if r == nil or r == false then
                    failMsg = "Create refused (no room returned)"
                    trace[#trace + 1] = key .. ":refused"
                    if not bestMode then
                        mapRejected = true
                        break
                    end
                    continue
                end
                local gotMap = RoomMapName(r)
                if gotMap and gotMap ~= tryMap then
                    failMsg = tryMap .. " is locked"
                    mapRejected = true
                    break
                end
                local gotKey = RoomServerDifficulty(r)
                local gotNorm, wantNorm = NormKey(gotKey), NormKey(key)
                trace[#trace + 1] = key .. ">" .. tostring(gotKey)
                if gotNorm == nil or not known[gotNorm] or gotNorm == wantNorm then
                    if gotNorm ~= nil and not known[gotNorm] then unverified = true end
                    mapName, difficulty, room = tryMap, key, r
                    break
                end
                if not bestMode then
                    LeaveRoom(true)
                    ResetAutoCreate(nil, true)
                    SetMissionStatus(Cfg.MissionLevel .. " is locked", true)
                    missionBusy = false
                    return false
                end
            end
            if room then break end
            if not mapRejected then failMsg = failMsg or "No playable difficulty found" end
        end
        if not room then
            LeaveRoom(true)
            local detail = (#trace > 0) and (" [" .. table.concat(trace, ", ") .. "]") or ""
            SetMissionStatus((failMsg or "Create refused (no room returned)") .. detail, true)
            missionBusy = false
            return false
        end
        createdRoom = (typeof(room) == "Instance") and room or createdRoom
        if bestMode then bestGradeCache = { key = difficulty, at = os.clock() } end
        local picked = {}
        for _, name in ipairs(MODIFIER_OPTIONS) do
            if table.find(Cfg.MissionModifiers, name) then picked[#picked + 1] = name end
        end
        for i, name in ipairs(picked) do
            SetMissionStatus(("Modifier %d/%d: %s"):format(i, #picked, name))
            local okM, rM = MissionInvoke("S_Missions", "Modify", name)
            if not okM then
                SetMissionStatus("Modify failed (" .. name .. "): " .. tostring(rM), true)
                missionBusy = false
                return false
            end
            task.wait(MODIFY_GAP)
            if Off() then return false end
        end
        SetMissionStatus(("Room created: %s%s / %s%s%s"):format(
            mapName, mapName == boosted and " (boost)" or "", difficulty, bestMode and " (best)" or "",
            unverified and " (unverified)" or ""))
        missionBusy = false
        return true
    end
    local function StartMission()
        if not ON_LOBBY_PLACE then SetMissionStatus("Not in the lobby place") return false end
        if missionBusy then return false end
        missionBusy = true
        SetMissionStatus("Starting mission...")
        local ok, r = MissionInvoke("S_Missions", "Start")
        SetMissionStatus(ok and "Start sent" or ("Start failed: " .. tostring(r)), not ok)
        missionBusy = false
        return ok
    end
    local MissionLeaveRow = AutoMissionForm:Row()
    MissionLeaveRow:Left():TitleStack({ Title = "Leave Room", Subtitle = "Leave the current mission room." })
    local MissionLeaveBtn = MissionLeaveRow:Right():Button({ Label = "Leave", Callback = function() end })
    BindButton(MissionLeaveBtn, function()
        ResetAutoCreate("left the room")
        SH.autoPaused = true
        task.spawn(function()
            local t0 = os.clock()
            while missionBusy and os.clock() - t0 < 10 do task.wait(0.1) end
            if missionBusy then SetMissionStatus("Busy - try again in a moment") return end
            LeaveRoom(false)
        end)
    end)
    task.spawn(function()
        local readyAt = os.clock() + 4
        local fails, nextTry = 0, 0
        while Alive() do
            task.wait(0.5)
            local now = os.clock()
            local bestOnly = (not Cfg.AutoCreateMission) and (Cfg.AutoBestGrade or Cfg.AutoBoostMission)
                and not Cfg.AutoCreateRaid and not Cfg.AutoStartRaid and not (Cfg.AutoCreateWave and SH.PlayOn()) and not (Cfg.AutoStartWave and SH.PlayOn()) and not SH.autoPaused
            if ON_LOBBY_PLACE and (Cfg.AutoCreateMission or bestOnly) and not missionBusy and now >= readyAt and not SH.Coord.Blocker(100) then
                local need = false
                if missionRecreateAt and now >= missionRecreateAt then
                    missionRecreateAt = nil
                    need = true
                elseif now >= nextTry and not HasRoom() then
                    need = true
                end
                if need then
                    if CreateRoomOnce(bestOnly) then
                        fails = 0
                        nextTry = os.clock() + 20
                    elseif Cfg.AutoCreateMission or bestOnly then
                        fails += 1
                        nextTry = os.clock() + 6
                        if fails >= 5 then
                            fails = 0
                            if Cfg.AutoCreateMission then ResetAutoCreate(nil, true) else SH.autoPaused = true end
                            SetMissionStatus("Auto Create stopped (failed 5 times)", true)
                        end
                    end
                end
            end
        end
    end)
    task.spawn(function()
        local lastFire = nil
        while Alive() do
            local hasRoom = HasRoom()
            if not ON_LOBBY_PLACE then
                lastFire = nil
                SetMissionCountdown("Wrong place")
            elseif not Cfg.AutoStartMission then
                lastFire = nil
                SetMissionCountdown("Off")
            elseif not hasRoom then
                lastFire = nil
                SetMissionCountdown("Waiting for room...")
            elseif SH.Coord.Blocker(100) then
                lastFire = nil
                SetMissionCountdown("Waiting: " .. tostring(SH.Coord.last))
            else
                local now = os.clock()
                local delay = ClampDelay(Cfg.MissionJoinDelay)
                if not lastFire then lastFire = now end
                local remaining = lastFire + delay - now
                if remaining <= 0 then
                    SetMissionCountdown("Starting now...")
                    StartMission()
                    lastFire = os.clock()
                else
                    SetMissionCountdown(("Next mission in %ds"):format(math.ceil(remaining)))
                end
            end
            task.wait(0.25)
        end
    end)
    local AdvMissionsSection = MissionsTab:PageSection({
        Title = "🚀 Advance Missions",
        Subtitle = "Auto-pick the best grade or boost mission."
    })
    local AdvMissionsForm = AdvMissionsSection:Form()
    local function OnAdvanceToggle(on)
        if initializing then return end
        SH.autoPaused = false
        bestGradeCache = nil
        if Cfg.AutoCreateMission then
            RequestRecreate()
        elseif on then
            task.spawn(function()
                local t0 = os.clock()
                while missionBusy and os.clock() - t0 < 10 do task.wait(0.1) end
                CreateRoomOnce(true)
            end)
        end
    end
    AddMissionToggle("Auto Select Best Grade", "Creates the highest difficulty you can play.", "AutoBestGrade", AdvMissionsForm, OnAdvanceToggle)
    AddMissionToggle("Auto Select Boost Mission", "Creates the map that has the reward boost now.", "AutoBoostMission", AdvMissionsForm, OnAdvanceToggle)
    local BoostInfoRow = AdvMissionsForm:Row()
    BoostInfoRow:Left():TitleStack({ Title = "Boost Now", Subtitle = "Map with the reward boost right now." })
    local BoostInfoLabel = BoostInfoRow:Right():Label({ Text = "-" })
    local BestInfoRow = AdvMissionsForm:Row()
    BestInfoRow:Left():TitleStack({ Title = "Best Grade Found", Subtitle = "Highest difficulty the last room got." })
    local BestInfoLabel = BestInfoRow:Right():Label({ Text = "-" })
    task.spawn(function()
        local lastB, lastG
        while Alive() do
            local m, left = BoostedMap()
            local b = "No boost"
            if m then
                b = m
                if left then b = ("%s (%d:%02d)"):format(m, math.floor(left / 60), math.floor(left % 60)) end
            end
            local g = bestGradeCache and bestGradeCache.key or "-"
            if b ~= lastB then lastB = b pcall(function() BoostInfoLabel.Text = b end) end
            if g ~= lastG then lastG = g pcall(function() BestInfoLabel.Text = g end) end
            task.wait(1)
        end
    end)
    pcall(function()
        workspace:GetAttributeChangedSignal("Boosted_Map"):Connect(function()
            if not Alive() or initializing or not Cfg.AutoBoostMission then return end
            RequestRecreate()
        end)
    end)
    if not canSave then
        SetMissionStatus("Can't save settings (executor has no file access)", true)
    elseif Cfg.AutoCreateMission or Cfg.AutoStartMission then
        if ON_LOBBY_PLACE then
            SetMissionStatus("Resuming your saved Auto switches...")
        else
            SetMissionStatus("Saved Auto switches will run in the lobby place")
        end
    end
    SH.Guard("block@5425", function()
    local RAIDS = {
        { name = "Attack Titan",   map = "Trost",       diffs = { "Hard", "Severe", "Aberrant" } },
        { name = "Armored Titan",  map = "Shiganshina", diffs = { "Hard", "Severe", "Aberrant" } },
        { name = "Female Titan",   map = "Stohess",     diffs = { "Hard", "Severe", "Aberrant" } },
        { name = "Colossal Titan", map = "Shiganshina", diffs = { "Aberrant" }, minimum = 3 },
    }
    local RAID_NAMES = {}
    for i, r in ipairs(RAIDS) do RAID_NAMES[i] = r.name end
    local RAID_DIFF_LABELS = { "Hard (C- Grade)", "Severe", "Aberrant (A Grade)" }
    local function RaidInfo(name)
        for _, r in ipairs(RAIDS) do if r.name == name then return r end end
        return RAIDS[1]
    end
    local function RaidDifficulty()
        local info = RaidInfo(Cfg.RaidSelect)
        if table.find(info.diffs, Cfg.RaidLevel) then return Cfg.RaidLevel end
        return info.diffs[#info.diffs]
    end
    Cfg.RaidSelect = KeepValid(RAID_NAMES, Cfg.RaidSelect, RAID_NAMES[1])
    Cfg.RaidModifiers = KeepValidList(MODIFIER_OPTIONS, Cfg.RaidModifiers)
    if not table.find({ "Hard", "Severe", "Aberrant" }, Cfg.RaidLevel) then Cfg.RaidLevel = "Hard" end
    local RaidSection = RaidModeTab:PageSection({
        Title = "⚔️ Raid Settings",
        Subtitle = "Raids start at Hard. Colossal Titan is Aberrant only."
    })
    local RaidForm = RaidSection:Form()
    local RaidAutoSection = RaidModeTab:PageSection({
        Title = "🤖 Auto Raid",
        Subtitle = "Create your raid room first, then turn on Auto Start."
    })
    local RaidAutoForm = RaidAutoSection:Form()
    local RaidStatusRow = RaidForm:Row()
    RaidStatusRow:Left():TitleStack({ Title = "Raid Status", Subtitle = "Current step and last result." })
    local RaidStatusLabel = RaidStatusRow:Right():Label({ Text = "Idle" })
    local raidDefaultColor = nil
    pcall(function()
        local o = LabelObject(RaidStatusLabel)
        if o then raidDefaultColor = o.TextColor3 end
    end)
    local function SetRaidStatus(text, isError)
        pcall(function() RaidStatusLabel.Text = tostring(text) end)
        pcall(function()
            local o = LabelObject(RaidStatusLabel)
            if not o then return end
            if isError then o.TextColor3 = STATUS_RED
            elseif raidDefaultColor then o.TextColor3 = raidDefaultColor end
        end)
    end
    local raidRecreateAt = nil
    local function RequestRaidRecreate()
        if Cfg.AutoCreateRaid then raidRecreateAt = os.clock() + 1.5 end
    end
    local function ResetAutoCreateRaid(quiet)
        if not Cfg.AutoCreateRaid then return end
        Cfg.AutoCreateRaid = false
        Save()
        SetMissionToggle("AutoCreateRaid", false)
    end
    local raidDiffNote
    local function AddRaidSelect(title, subtitle, options, getValue, setValue)
        local row = RaidForm:Row()
        row:Left():TitleStack({ Title = title, Subtitle = subtitle })
        local btn = row:Right():PullDownButton({
            Label = getValue(),
            Options = options,
            Value = table.find(options, getValue()) or 1,
            ValueChanged = function(self, index)
                if options[index] then
                    setValue(options[index])
                    self.Label = options[index]
                    Save()
                    RequestRaidRecreate()
                end
            end
        })
        StyleDropdown(btn)
        local function refresh()
            local i = table.find(options, getValue()) or 1
            pcall(function() btn.Value = i btn.Label = options[i] end)
        end
        UiSync.Add(refresh)
        return refresh
    end
    local refreshRaidLevel = function() end
    AddRaidSelect("Select Raid", "Choose the raid boss.", RAID_NAMES,
        function() return Cfg.RaidSelect end,
        function(v) Cfg.RaidSelect = v task.defer(function() refreshRaidLevel() end) end)
    local function RaidLevelLabel()
        for i, k in ipairs({ "Hard", "Severe", "Aberrant" }) do
            if k == RaidDifficulty() then return RAID_DIFF_LABELS[i] end
        end
        return RAID_DIFF_LABELS[1]
    end
    refreshRaidLevel = AddRaidSelect("Select Difficulty", "Colossal Titan always uses Aberrant.", RAID_DIFF_LABELS,
        RaidLevelLabel,
        function(v) Cfg.RaidLevel = v:match("^(%S+)") or "Hard" end)
    do
        local row = RaidForm:Row()
        row:Left():TitleStack({ Title = "Select Modifiers", Subtitle = "Tick the Modifiers to apply after creating." })
        local function apply(value)
            local indexes = type(value) == "table" and value or { value }
            local names = {}
            for _, index in ipairs(SettingsStore.ValidIndexes(indexes, #MODIFIER_OPTIONS)) do
                names[#names + 1] = MODIFIER_OPTIONS[index]
            end
            Cfg.RaidModifiers = names
            Save()
            RequestRaidRecreate()
        end
        local current = {}
        for i, name in ipairs(MODIFIER_OPTIONS) do
            if table.find(Cfg.RaidModifiers, name) then current[#current + 1] = i end
        end
        local ok, btn = pcall(function()
            return row:Right():PopUpButton({
                Options = MODIFIER_OPTIONS,
                Maximum = #MODIFIER_OPTIONS,
                Value = current,
                ValueChanged = function(self, value) apply(value) end
            })
        end)
        if not ok or not btn then
            btn = row:Right():PullDownButton({
                Label = Cfg.RaidModifiers[1] or "None",
                Options = MODIFIER_OPTIONS,
                Value = table.find(MODIFIER_OPTIONS, Cfg.RaidModifiers[1]) or 1,
                ValueChanged = function(self, index)
                    apply(index)
                    self.Label = MODIFIER_OPTIONS[index] or "None"
                end
            })
        end
        StyleDropdown(btn)
        UiSync.Add(function()
            if ok then
                local picked = {}
                for i, name in ipairs(MODIFIER_OPTIONS) do
                    if table.find(Cfg.RaidModifiers, name) then picked[#picked + 1] = i end
                end
                btn.Value = picked
            else
                local i = table.find(MODIFIER_OPTIONS, Cfg.RaidModifiers[1]) or 1
                btn.Value = i
                btn.Label = MODIFIER_OPTIONS[i]
            end
        end)
    end
    local function CreateRaidOnce(oneShot)
        if not ON_LOBBY_PLACE then SetRaidStatus("Not in the lobby place") return false end
        if missionBusy then SetRaidStatus("Busy - try again in a moment") return false end
        missionBusy = true
        local info = RaidInfo(Cfg.RaidSelect)
        local diff = RaidDifficulty()
        SetRaidStatus("Leaving old room...")
        LeaveRoom(true)
        task.wait(0.6)
        if not oneShot and not Cfg.AutoCreateRaid then
            SetRaidStatus("Stopped (Auto Create turned off)")
            missionBusy = false
            return false
        end
        SetRaidStatus(("Creating %s (%s)..."):format(info.name, diff))
        local args = { Difficulty = diff, Type = "Raids", Objective = info.name, Name = info.map }
        if info.minimum then args.Minimum = info.minimum end
        local ok, r = MissionInvoke("S_Missions", "Create", args)
        if not ok then
            SetRaidStatus("Create failed: " .. tostring(r), true)
            missionBusy = false
            return false
        end
        if r == nil or r == false then
            LeaveRoom(true)
            ResetAutoCreateRaid(true)
            SetRaidStatus("Create refused (locked or no room returned)", true)
            missionBusy = false
            return false
        end
        local got = RoomServerDifficulty(r)
        if got ~= nil and got ~= diff then
            LeaveRoom(true)
            ResetAutoCreateRaid(true)
            SetRaidStatus(("%s (%s) is locked"):format(info.name, diff), true)
            missionBusy = false
            return false
        end
        createdRoom = (typeof(r) == "Instance") and r or createdRoom
        local picked = {}
        for _, name in ipairs(MODIFIER_OPTIONS) do
            if table.find(Cfg.RaidModifiers, name) then picked[#picked + 1] = name end
        end
        for i, name in ipairs(picked) do
            SetRaidStatus(("Modifier %d/%d: %s"):format(i, #picked, name))
            local okM, rM = MissionInvoke("S_Missions", "Modify", name)
            if not okM then
                SetRaidStatus("Modify failed (" .. name .. "): " .. tostring(rM), true)
                missionBusy = false
                return false
            end
            task.wait(MODIFY_GAP)
            if not oneShot and not Cfg.AutoCreateRaid then
                SetRaidStatus("Stopped (Auto Create turned off)")
                missionBusy = false
                return false
            end
        end
        SetRaidStatus(("Room created: %s / %s"):format(info.name, diff))
        missionBusy = false
        return true
    end
    local function StartRaid()
        if not ON_LOBBY_PLACE then SetRaidStatus("Not in the lobby place") return false end
        if missionBusy then return false end
        missionBusy = true
        SetRaidStatus("Starting raid...")
        local ok, r = MissionInvoke("S_Missions", "Start")
        local note = ""
        if ok and type(r) == "string" and r ~= "" then note = " (" .. r .. ")" end
        local info = RaidInfo(Cfg.RaidSelect)
        if ok and info.minimum then note = note .. " | needs " .. info.minimum .. "+ players" end
        SetRaidStatus(ok and ("Start sent" .. note) or ("Start failed: " .. tostring(r)), not ok)
        missionBusy = false
        return ok
    end
    AddMissionToggle("Auto Create Raid", "Keeps a raid room ready with these settings. Remembered next time.", "AutoCreateRaid", RaidAutoForm, function(on)
        if on then SetMissionToggle("AutoCreateMission", false) SetMissionToggle("AutoCreateWave", false) end
        if on and not initializing then raidRecreateAt = os.clock() end
    end)
    AddMissionToggle("Auto Start Raid", "Starts the raid in your room. Remembered next time.", "AutoStartRaid", RaidAutoForm, function(on)
        if on then SetMissionToggle("AutoStartMission", false) SetMissionToggle("AutoStartWave", false) end
    end)
    local RaidDelayRow = RaidAutoForm:Row()
    RaidDelayRow:Left():TitleStack({ Title = "Join Delay", Subtitle = "Seconds between starts (" .. MIN_DELAY .. " - " .. MAX_DELAY .. ")." })
    local RaidDelayRight = RaidDelayRow:Right()
    local RaidDelayLabel = RaidDelayRight:Label({ Text = Cfg.RaidJoinDelay .. "s" })
    UiSync.Link(RaidDelayRight:Slider({
        Minimum = MIN_DELAY,
        Maximum = MAX_DELAY,
        Value = Cfg.RaidJoinDelay,
        ValueChanged = function(self, value)
            Cfg.RaidJoinDelay = ClampDelay(value)
            pcall(function() RaidDelayLabel.Text = Cfg.RaidJoinDelay .. "s" end)
            Save()
        end
    }), Cfg, "RaidJoinDelay", function(_, want)
        pcall(function() RaidDelayLabel.Text = want .. "s" end)
    end)
    local RaidCountRow = RaidAutoForm:Row()
    RaidCountRow:Left():TitleStack({ Title = "Next Raid", Subtitle = "Countdown to the next start." })
    local RaidCountLabel = RaidCountRow:Right():Label({ Text = "Off" })
    local lastRaidCount = nil
    local function SetRaidCountdown(text)
        if text == lastRaidCount then return end
        lastRaidCount = text
        pcall(function() RaidCountLabel.Text = text end)
    end
    local RaidLeaveRow = RaidAutoForm:Row()
    RaidLeaveRow:Left():TitleStack({ Title = "Leave Room", Subtitle = "Leave the current raid room." })
    local RaidLeaveBtn = RaidLeaveRow:Right():Button({ Label = "Leave", Callback = function() end })
    BindButton(RaidLeaveBtn, function()
        ResetAutoCreateRaid(true)
        task.spawn(function()
            local t0 = os.clock()
            while missionBusy and os.clock() - t0 < 10 do task.wait(0.1) end
            if missionBusy then SetRaidStatus("Busy - try again in a moment") return end
            local okL = LeaveRoom(true)
            SetRaidStatus(okL and "Leave sent" or "Leave failed", not okL)
        end)
    end)
    task.spawn(function()
        local readyAt = os.clock() + 4
        local fails, nextTry = 0, 0
        while Alive() do
            task.wait(0.5)
            local now = os.clock()
            if ON_LOBBY_PLACE and Cfg.AutoCreateRaid and not missionBusy and now >= readyAt and not SH.Coord.Blocker(100) then
                local need = false
                if raidRecreateAt and now >= raidRecreateAt then
                    raidRecreateAt = nil
                    need = true
                elseif now >= nextTry and not HasRoom() then
                    need = true
                end
                if need then
                    if CreateRaidOnce(false) then
                        fails = 0
                        nextTry = os.clock() + 20
                    elseif Cfg.AutoCreateRaid then
                        fails += 1
                        nextTry = os.clock() + 8
                        if fails >= 3 then
                            fails = 0
                            ResetAutoCreateRaid(true)
                            SetRaidStatus("Auto Create stopped (failed 3 times)", true)
                        end
                    end
                end
            end
        end
    end)
    task.spawn(function()
        local lastFire = nil
        while Alive() do
            local hasRoom = HasRoom()
            if not ON_LOBBY_PLACE then
                lastFire = nil
                SetRaidCountdown("Wrong place")
            elseif not Cfg.AutoStartRaid then
                lastFire = nil
                SetRaidCountdown("Off")
            elseif not hasRoom then
                lastFire = nil
                SetRaidCountdown("Waiting for room...")
            elseif SH.Coord.Blocker(100) then
                lastFire = nil
                SetRaidCountdown("Waiting: " .. tostring(SH.Coord.last))
            else
                local now = os.clock()
                local delay = ClampDelay(Cfg.RaidJoinDelay)
                if not lastFire then lastFire = now end
                local remaining = lastFire + delay - now
                if remaining <= 0 then
                    SetRaidCountdown("Starting now...")
                    StartRaid()
                    lastFire = os.clock()
                else
                    SetRaidCountdown(("Next raid in %ds"):format(math.ceil(remaining)))
                end
            end
            task.wait(0.25)
        end
    end)
    SH.Guard("block@5754", function()
        local ExtraForm = RaidModeTab:PageSection({
            Title = "🎁 Raid Extras",
            Subtitle = "Skip cutscenes and open the reward chest by pressing the real buttons."
        }):Form()
        AddMissionToggle("Auto Skip Cutscene", "Presses SKIP [E] on cutscenes once your character has loaded.", "AutoSkipCutscene", ExtraForm)
        do
            local row = ExtraForm:Row()
            row:Left():TitleStack({ Title = "Skip Cutscene Status", Subtitle = "What Auto Skip Cutscene is doing." })
            local label = row:Right():Label({ Text = "Off" })
            local last = nil
            function Farm.SetSkipStatus(text)
                text = tostring(text)
                if text == last then return end
                last = text
                pcall(function() label.Text = text end)
            end
        end
        AddMissionToggle("Auto Open Chest (Free)", "Presses OPEN on the Free chest when the chest screen shows.", "AutoOpenChestFree", ExtraForm)
        AddMissionToggle("Auto Open Chest (Premium)", "Presses OPEN on the Premium chest. Only turn on if you want to open it.", "AutoOpenChestPremium", ExtraForm)
        AddMissionToggle("Auto Finish Chest", "Presses FINISH after the chests you selected are opened.", "AutoFinishChest", ExtraForm)
        local chestLabel
        do
            local row = ExtraForm:Row()
            row:Left():TitleStack({ Title = "Chest Status", Subtitle = "What Auto Open Chest sees right now." })
            chestLabel = row:Right():Label({ Text = "Off" })
        end
        local lastChestText = nil
        local function SetChest(text)
            text = tostring(text)
            if text == lastChestText then return end
            lastChestText = text
            pcall(function() chestLabel.Text = text end)
        end
        local function PathOf(obj)
            local names, cur = {}, obj
            while cur and cur ~= PlayerGui and cur ~= game do
                table.insert(names, 1, cur.Name)
                cur = cur.Parent
            end
            return table.concat(names, ".")
        end
        local function ChestButtons()
            local found = {}
            for _, d in ipairs(PlayerGui:GetDescendants()) do
                if IsTextObj(d) and IsShown(d) and (function()
                    local t = TextOf(d)
                    return t == "OPEN" or t:match("^OPEN%s*%(%d+%)$") ~= nil
                end)() then
                    local btn = d
                    while btn and btn ~= PlayerGui and not btn:IsA("GuiButton") do btn = btn.Parent end
                    if btn and btn ~= PlayerGui then
                        local path = PathOf(btn):lower()
                        local kind = "Unknown"
                        if path:find("premium") then kind = "Premium" elseif path:find("free") then kind = "Free" end
                        local n = TextOf(d):match("%((%d+)%)")
                        found[#found + 1] = { btn = btn, kind = kind, path = PathOf(btn), empty = (n ~= nil and tonumber(n) == 0) }
                    end
                end
            end
            return found
        end
        local FinishButton
        if SH.DEV then
            local copyRow = ExtraForm:Row()
            copyRow:Left():TitleStack({ Title = "Copy Chest Debug", Subtitle = "Copies the OPEN buttons it can see (send this if a chest is not opened)." })
            local copyBtn = copyRow:Right():Button({ Label = "Copy", Callback = function() end })
            BindButton(copyBtn, function()
                local lines = {}
                for _, b in ipairs(ChestButtons()) do lines[#lines + 1] = b.kind .. " | " .. b.path end
                local fb = FinishButton and FinishButton()
                lines[#lines + 1] = fb and ("FINISH | " .. PathOf(fb)) or "FINISH | not visible"
                local text = table.concat(lines, "\n")
                pcall(function() setclipboard(text) end)
                SetChest(#lines > 0 and ("Copied " .. #lines .. " button(s)") or "No visible OPEN button")
            end)
        end
        FinishButton = function()
            for _, d in ipairs(PlayerGui:GetDescendants()) do
                if IsTextObj(d) and IsShown(d) and TextOf(d):match("^FINISH") then
                    local btn = d
                    while btn and btn ~= PlayerGui and not btn:IsA("GuiButton") do btn = btn.Parent end
                    if btn and btn ~= PlayerGui then return btn end
                end
            end
            return nil
        end
        task.spawn(function()
            local opened, lastPress = 0, {}
            local screenSince, lastAction = nil, 0
            local GAP = 5
            local FINISH_WAIT = 4
            while Alive() do
                task.wait(0.7)
                local wantFree, wantPremium, wantFinish = Cfg.AutoOpenChestFree, Cfg.AutoOpenChestPremium, Cfg.AutoFinishChest
                if not (wantFree or wantPremium) then
                    SetChest("Off")
                else
                    local all = ChestButtons()
                    local list, emptyCount = {}, 0
                    for _, b in ipairs(all) do
                        if b.empty then emptyCount += 1 else list[#list + 1] = b end
                    end
                    local pressable = false
                    for _, b in ipairs(list) do
                        if (b.kind == "Free" and wantFree) or (b.kind == "Premium" and wantPremium)
                            or (b.kind == "Unknown" and wantFree and wantPremium) then
                            pressable = true
                        end
                    end
                    if pressable then
                        for _, b in ipairs(list) do
                            local okKind = (b.kind == "Free" and wantFree) or (b.kind == "Premium" and wantPremium)
                                or (b.kind == "Unknown" and wantFree and wantPremium)
                            if okKind and os.clock() - (lastPress[b.kind] or 0) >= GAP then
                                lastPress[b.kind] = os.clock()
                                lastAction = os.clock()
                                SetChest("Opening " .. b.kind .. " chest...")
                                pcall(ActivateButton, b.btn)
                                opened += 1
                                break
                            end
                        end
                    else
                        local fin = FinishButton()
                        if fin and not screenSince then screenSince = os.clock() end
                        if not fin then
                            screenSince = nil
                            if #list == 0 and emptyCount > 0 then
                                SetChest("No keys left - nothing to open")
                            elseif #list == 0 then
                                SetChest(opened > 0 and ("Waiting for chest (opened " .. opened .. ")") or "Waiting for chest")
                            else
                                local unknown = false
                                for _, b in ipairs(list) do if b.kind == "Unknown" then unknown = true end end
                                SetChest(unknown and "OPEN found but can't tell Free / Premium (use Copy)" or "OPEN found (not selected)")
                            end
                        elseif not wantFinish then
                            SetChest(emptyCount > 0 and "No keys left - Auto Finish is off" or ("Chests done (opened %d) - Auto Finish is off"):format(opened))
                        elseif os.clock() - math.max(lastAction, screenSince or os.clock()) >= FINISH_WAIT then
                            SetChest("Finishing...")
                            lastAction = os.clock()
                            pcall(ActivateButton, fin)
                            task.wait(0.5)
                            if fin.Parent and IsShown(fin) then
                                pcall(function()
                                    local pos, size = fin.AbsolutePosition, fin.AbsoluteSize
                                    local inset = GuiService:GetGuiInset()
                                    local cx, cy = pos.X + size.X / 2, pos.Y + size.Y / 2 + inset.Y
                                    VirtualInputManager:SendMouseMoveEvent(cx, cy, game)
                                    VirtualInputManager:SendMouseButtonEvent(cx, cy, 0, true, game, 1)
                                    task.wait(0.05)
                                    VirtualInputManager:SendMouseButtonEvent(cx, cy, 0, false, game, 1)
                                end)
                            end
                        else
                            SetChest("Chests opened - finishing soon...")
                        end
                    end
                end
            end
        end)
    end)
    SH.Guard("block@5917", function()
        local SPAWN_WAIT = 2
        local GAP = 1.5
        local function SetSkip(text)
            if Farm.SetSkipStatus then Farm.SetSkipStatus(text) end
        end
        local function FindSkip()
            local seenText = false
            for _, d in ipairs(PlayerGui:GetDescendants()) do
                if IsTextObj(d) and IsShown(d) then
                    local t = TextOf(d):upper()
                    if t:match("^SKIP") and #t <= 14 then
                        seenText = true
                        local btn = d
                        while btn and btn ~= PlayerGui and not btn:IsA("GuiButton") do btn = btn.Parent end
                        if btn and btn ~= PlayerGui then return btn, true end
                    end
                end
            end
            return nil, seenText
        end
        local function PressE()
            pcall(function()
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                task.wait(0.05)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
            end)
        end
        task.spawn(function()
            local skipped, lastPress = 0, 0
            local lastChar, spawnedAt = nil, 0
            while Alive() do
                task.wait(0.4)
                if not Cfg.AutoSkipCutscene then
                    SetSkip("Off")
                    lastChar = nil
                elseif IN_MENU then
                    SetSkip("Not in a match")
                else
                    local char = LocalPlayer.Character
                    local hum = char and char:FindFirstChildOfClass("Humanoid")
                    local root = char and char:FindFirstChild("HumanoidRootPart")
                    if not (hum and root and hum.Health > 0) then
                        lastChar = nil
                        SetSkip("Waiting for character")
                    else
                        if char ~= lastChar then lastChar, spawnedAt = char, os.clock() end
                        if os.clock() - spawnedAt < SPAWN_WAIT then
                            SetSkip("Character loading...")
                        else
                            local btn, seenText = FindSkip()
                            if (btn or seenText) and os.clock() - lastPress >= GAP then
                                lastPress = os.clock()
                                SetSkip("Skipping...")
                                if btn then pcall(ActivateButton, btn) end
                                local again = FindSkip()
                                if (not btn) or again then PressE() end
                                skipped += 1
                                SetSkip(("Skipped (%d)"):format(skipped))
                            elseif not (btn or seenText) then
                                SetSkip(skipped > 0 and ("Waiting for cutscene (skipped %d)"):format(skipped) or "Waiting for cutscene")
                            end
                        end
                    end
                end
            end
        end)
    end)
    SH.Guard("block@5985", function()
        local SHOOT_ARGS = { BarrelWood = 40, Base = 0 }
        local IMPACT_BURST = 30
        local Form = RaidModeTab:PageSection({
            Title = "🏰 Colossal Titan",
            Subtitle = "Shoots the wall cannon at the Colossal Titan's nape."
        }):Form()
        AddMissionToggle("Auto Cannon (Colossal Titan)", "Phase 1: mounts the wall cannon and shoots the Colossal Titan until the cutscene (Stall Bertholdt complete). Phase 2: the cannon stops so you can kill the Colossal.", "AutoCannon", Form, function() end)
        AddMissionToggle("Auto Defend (only Eren Thunder Spears)", "Phase 1: while the cannon shoots, Auto Farm also kills the titans that get close to Eren. Needs Auto Farm on.", "AutoDefendEren", Form, function() end)
        do
            local range = FARM_RANGES.DefendErenRadius
            local function titleFor(v) return "Defend Radius ( " .. v .. " )" end
            local row = Form:Row()
            local stack = row:Left():TitleStack({ Title = titleFor(Cfg.DefendErenRadius), Subtitle = "Titans closer than this to Eren (studs) are killed first." })
            UiSync.Link(row:Right():Slider({
                Minimum = range[1],
                Maximum = range[2],
                Value = Cfg.DefendErenRadius,
                ValueChanged = function(self, value)
                    local v = math.clamp(math.floor(value + 0.5), range[1], range[2])
                    Cfg.DefendErenRadius = v
                    pcall(function() stack.Title = titleFor(v) end)
                    Save()
                end
            }), Cfg, "DefendErenRadius", function(_, want)
                pcall(function() stack.Title = titleFor(want) end)
            end)
        end
        local defendLabel
        do
            local row = Form:Row()
            row:Left():TitleStack({ Title = "Auto Defend Status", Subtitle = "What Auto Defend is doing." })
            defendLabel = row:Right():Label({ Text = "Off" })
        end
        local lastDefendText = nil
        local function SetDefendStatus(text)
            text = tostring(text)
            if text == lastDefendText then return end
            lastDefendText = text
            pcall(function() defendLabel.Text = text end)
        end
        local statusLabel
        do
            local row = Form:Row()
            row:Left():TitleStack({ Title = "Cannon Status", Subtitle = "What Auto Cannon is doing." })
            statusLabel = row:Right():Label({ Text = "Off" })
        end
        local lastText = nil
        local function SetStatus(text)
            text = tostring(text)
            if text == lastText then return end
            lastText = text
            pcall(function() statusLabel.Text = text end)
        end
        local shots, impacts, events = 0, 0, 0
        local lastState, lastShoot = "-", "-"
        local function CannonModel()
            local climb = workspace:FindFirstChild("Climbable")
            for _, d in ipairs(climb and climb:GetDescendants() or {}) do
                if d.Name == "Cannons" and not d:IsA("BasePart") then
                    local m = d:FindFirstChildWhichIsA("Model")
                    if m then return m end
                end
            end
            return nil
        end
        local function ColossalAlive()
            local titans = workspace:FindFirstChild("Titans")
            local ct = titans and titans:FindFirstChild("Colossal_Titan")
            local hum = ct and ct:FindFirstChildOfClass("Humanoid")
            return (ct and hum and hum.Health > 0) and ct or nil
        end
        local function NapePos()
            local ct = ColossalAlive()
            if not ct then return nil end
            local hb = ct:FindFirstChild("Hitboxes")
            local hit = hb and hb:FindFirstChild("Hit")
            local nape = hit and hit:FindFirstChild("Nape")
            if nape and nape:IsA("BasePart") then return nape.Position end
            local fake = ct:FindFirstChild("Fake")
            local head = fake and fake:FindFirstChild("Head")
            return head and head:IsA("BasePart") and head.Position or nil
        end
        local function StallObjective()
            local o = ReplicatedStorage:FindFirstChild("Objectives")
            if not o then return nil end
            local names = { "Stall_Colossal_Titan", "Stall_Colossal", "Stall_Bertholdt", "Stall_Bertholdt_Titan" }
            for _, name in ipairs(names) do
                local obj = o:FindFirstChild(name)
                if obj then return obj end
            end
            return nil
        end
        local function StallProgress()
            local so = StallObjective()
            if not so then return nil, nil end
            return tonumber(so.Value) or 0, tonumber(so:GetAttribute("Requirement")) or 1
        end
        local function StallDone()
            local v, req = StallProgress()
            return v ~= nil and v >= req
        end
        local phase2Latched, sawStallObjective = false, false
        local function Phase2()
            if not ColossalAlive() then
                phase2Latched, sawStallObjective = false, false
                return false
            end
            if phase2Latched then return true end
            local objective = StallObjective()
            if objective then
                sawStallObjective = true
            elseif sawStallObjective then
                phase2Latched = true
            end
            if StallDone() then
                phase2Latched = true
            end
            return phase2Latched
        end
        local function Phase1()
            return Cfg.AutoCannon and Farm.CanUseHere() and ColossalAlive() ~= nil and not Phase2()
        end
        Farm.CannonFarmSmall = false
        Farm.ColossalPhase2 = Phase2
        Farm.ColossalPhase1 = Phase1
        local function PostRemote()
            local ok, r = pcall(function() return ReplicatedStorage.Assets.Remotes.POST end)
            return ok and r or nil
        end
        task.spawn(function()
            local calmSince = nil
            while Alive() do
                task.wait(0.25)
                local defend = false
                if not Cfg.AutoDefendEren then
                    SetDefendStatus("Off")
                    calmSince = nil
                elseif not (Cfg.AutoFarm or Cfg.AutoFarmThunder) then
                    SetDefendStatus("Turn on Auto Farm")
                    calmSince = nil
                elseif not (Cfg.AutoCannon and Phase1()) then
                    SetDefendStatus("Waiting for phase 1")
                    calmSince = nil
                else
                    local threats, eren = Farm.ErenThreats()
                    if not eren then
                        SetDefendStatus("Eren not found")
                    elseif threats > 0 then
                        defend = true
                        calmSince = nil
                        SetDefendStatus(("Defending Eren | %d titan(s) near"):format(threats))
                    else
                        calmSince = calmSince or os.clock()
                        if Farm.DefendErenActive and os.clock() - calmSince < 1.5 then defend = true end
                        SetDefendStatus("Eren is safe")
                    end
                end
                Farm.DefendErenActive = defend
                if defend then
                    Farm.PauseUntil = 0
                    Farm.MovePauseUntil = 0
                elseif Cfg.AutoCannon and Phase1() then
                    Farm.PauseUntil = os.clock() + 1.2
                    Farm.MovePauseUntil = os.clock() + 1.2
                elseif Farm.PauseUntil and Farm.PauseUntil > 0 then
                    Farm.PauseUntil = 0
                    Farm.MovePauseUntil = 0
                end
            end
        end)
        task.spawn(function()
            local conn, mounted = nil, nil
            local function Disconnect()
                if conn then pcall(function() conn:Disconnect() end) conn = nil end
            end
            while Alive() do
                task.wait(0.2)
                local ct = ColossalAlive()
                local want = Cfg.AutoCannon and Farm.CanUseHere() and ct ~= nil and not Phase2() and not Farm.DefendErenActive
                if not want then
                    if mounted or conn then
                        Disconnect()
                        local c = mounted
                        mounted = nil
                        if c then pcall(MissionInvoke, "Cannon", "State", c, false, nil) end
                    end
                    if not Cfg.AutoCannon then
                        SetStatus("Off")
                    elseif ct and Farm.DefendErenActive then
                        SetStatus("Cannon paused: defending Eren")
                    elseif ct and Phase2() then
                        SetStatus("Phase 2: cannon stopped - kill the Colossal")
                    else
                        SetStatus("Waiting for Colossal Titan")
                    end
                else
                    local cannon = CannonModel()
                    local post = PostRemote()
                    if not cannon then
                        SetStatus("No cannon found")
                    elseif not post then
                        SetStatus("POST remote not found")
                    else
                        if not conn then
                            conn = post.OnClientEvent:Connect(function(a1, a2, cannonObj)
                                if a1 ~= "Skills" or a2 ~= "Impact" then return end
                                if not Cfg.AutoCannon then return end
                                events += 1
                                local ref = cannonObj or workspace:FindFirstChild("Cannon")
                                if not ref then return end
                                for _ = 1, IMPACT_BURST do
                                    local pos = NapePos()
                                    if pos then
                                        pcall(function() post:FireServer("S_Skills", "Impact", ref, pos) end)
                                        impacts += 1
                                    end
                                end
                            end)
                        end
                        local okS, resS = MissionInvoke("Cannon", "State", cannon, true, nil)
                        lastState = ("ok=%s res=%s"):format(tostring(okS), type(resS) == "table" and "table" or tostring(resS))
                        mounted = cannon
                        task.wait(0.3)
                        for _ = 1, 3 do
                            local ok, res = MissionInvoke("Cannon", "Shoot", SHOOT_ARGS)
                            lastShoot = ("ok=%s res=%s"):format(tostring(ok), tostring(res))
                            if ok then shots += 1 break end
                            task.wait(0.1)
                        end
                        local v, req = StallProgress()
                        SetStatus(("Phase 1: shooting Colossal | stall %s/%s | shots %d | hits %d"):format(tostring(v), tostring(req), shots, events))
                        task.wait(1.8)
                    end
                end
            end
            Disconnect()
        end)
    end)
    end)
    SH.Guard("boss-check-ui", function()
        local Section = RaidModeTab:PageSection({
            Title = "🛰️ Boss Check",
            Subtitle = "Waits until the raid boss is fully spawned before Auto Farm starts, so you don't farm while the boss is still loading or frozen."
        })
        local Form = Section:Form()
        local Row = Form:Row()
        Row:Left():TitleStack({ Title = "Wait For Boss", Subtitle = "Auto Farm / Clear Wave pause while the boss is missing, still loading (no body/nape, anchored) or just spawned." })
        UiSync.Link(Row:Right():Toggle({
            Value = Cfg.WaitForBoss,
            ValueChanged = function(self, value)
                Cfg.WaitForBoss = value and true or false
                Save()
            end
        }), Cfg, "WaitForBoss")
        local range = FARM_RANGES.BossSettle
        local SRow = Form:Row()
        local SStack = SRow:Left():TitleStack({ Title = "Boss Settle Time ( " .. Cfg.BossSettle .. "s )", Subtitle = "How long the boss must stay fully loaded before farming starts. Also how long to wait for a boss to appear after you spawn." })
        UiSync.Link(SRow:Right():Slider({
            Minimum = range[1], Maximum = range[2], Value = Cfg.BossSettle,
            ValueChanged = function(self, value)
                local v = math.clamp(math.floor(value + 0.5), range[1], range[2])
                Cfg.BossSettle = v
                pcall(function() SStack.Title = "Boss Settle Time ( " .. v .. "s )" end)
                Save()
            end
        }), Cfg, "BossSettle", function(_, want)
            pcall(function() SStack.Title = "Boss Settle Time ( " .. want .. "s )" end)
        end)
        local StatusRow = Form:Row()
        StatusRow:Left():TitleStack({ Title = "Boss Status", Subtitle = "Spawned / loading / ready." })
        local StatusLabel = StatusRow:Right():Label({ Text = "Off" })
        task.spawn(function()
            local last = nil
            while Alive() do
                task.wait(0.5)
                local text = "Off"
                if Cfg.WaitForBoss then
                    pcall(Farm.BossBlock)
                    text = Farm.BossStatus or "Off"
                end
                if text ~= last then
                    last = text
                    pcall(function() StatusLabel.Text = tostring(text) end)
                end
            end
        end)
        local DumpRow = Form:Row()
        DumpRow:Left():TitleStack({ Title = "Boss Info", Subtitle = "Prints the boss state to the Console (F9). Use it while the boss looks stuck and send it to me." })
        DumpRow:Right():Button({ Label = "Print", Callback = function() pcall(Farm.BossDump) end })
    end)
    SH.Guard("auto-play", function()
        local PLAY_SET = {
            { key = "AutoCreateWave", name = "Create Wave" },
            { key = "AutoStartWave", name = "Start Waves" },
            { key = "AutoReady", name = "Ready" },
            { key = "AutoVoteSkip", name = "Vote Skip" },
            { key = "AutoClearWave", name = "Clear Wave" },
            { key = "AutoLootCrate", name = "Loot Crate" },
            { key = "AutoRefillWave", name = "Refill" },
        }
        local Section = WaveModeTab:PageSection({
            Title = "▶️ Auto Play",
            Subtitle = "Master switch. Wave features (Create, Start, Ready, Vote Skip, Clear Wave, Loot, Refill, Shop) only run while this is ON."
        })
        local Form = Section:Form()
        local Row = Form:Row()
        Row:Left():TitleStack({
            Title = "Auto Play",
            Subtitle = "Must be ON for Auto Create/Start Wave, Ready, Vote Skip, Clear Wave, Loot Crate, Refill and Shop to work. Turning it off pauses them all (your toggles stay as set)."
        })
        UiSync.Link(Row:Right():Toggle({
            Value = Cfg.AutoPlay,
            ValueChanged = function(self, value)
                Cfg.AutoPlay = value and true or false
                if Cfg.AutoPlay then
                    local anyOn = false
                    for _, item in ipairs(PLAY_SET) do if Cfg[item.key] then anyOn = true break end end
                    if not anyOn then for _, item in ipairs(PLAY_SET) do Cfg[item.key] = true end end
                end
                Save()
                UiSync.Refresh()
                if Cfg.AutoClearWave then Farm.Fire("OnAutoClearWave", Cfg.AutoPlay) end
            end
        }), Cfg, "AutoPlay")
        local StatusRow = Form:Row()
        StatusRow:Left():TitleStack({ Title = "Auto Play Status", Subtitle = "Which parts are running." })
        local StatusLabel = StatusRow:Right():Label({ Text = "Off" })
        task.spawn(function()
            local last = nil
            while Alive() do
                task.wait(0.5)
                local on, off = 0, {}
                for _, item in ipairs(PLAY_SET) do
                    if Cfg[item.key] then on += 1 else off[#off + 1] = item.name end
                end
                local text
                if on == 0 then text = "Off"
                elseif #off == 0 then text = "All on (" .. on .. "/" .. #PLAY_SET .. ")"
                else text = on .. "/" .. #PLAY_SET .. " on (off: " .. table.concat(off, ", ") .. ")" end
                if text ~= last then
                    last = text
                    pcall(function() StatusLabel.Text = text end)
                end
            end
        end)
    end)
    SH.Guard("block@6225", function()
        local WAVE_MAPS = { "Trost" }
        local WAVE_DIFFS = { "Easy (E- Grade)" }
        Cfg.WaveSelect = KeepValid(WAVE_MAPS, Cfg.WaveSelect, WAVE_MAPS[1])
        Cfg.WaveLevel = KeepValid(WAVE_DIFFS, Cfg.WaveLevel, WAVE_DIFFS[1])
        local WaveSection = WaveModeTab:PageSection({
            Title = "🌊 Wave Settings",
            Subtitle = "Pick the map and difficulty, then turn on Auto Create Wave."
        })
        local WaveForm = WaveSection:Form()
        local WaveAutoSection = WaveModeTab:PageSection({
            Title = "🤖 Auto Wave",
            Subtitle = "Create your wave room first, then turn on Auto Start."
        })
        local WaveAutoForm = WaveAutoSection:Form()
        local WaveStatusRow = WaveForm:Row()
        WaveStatusRow:Left():TitleStack({ Title = "Wave Status", Subtitle = "Current step and last result." })
        local WaveStatusLabel = WaveStatusRow:Right():Label({ Text = "Idle" })
        local waveDefaultColor = nil
        pcall(function()
            local o = LabelObject(WaveStatusLabel)
            if o then waveDefaultColor = o.TextColor3 end
        end)
        local function SetWaveStatus(text, isError)
            pcall(function() WaveStatusLabel.Text = tostring(text) end)
            pcall(function()
                local o = LabelObject(WaveStatusLabel)
                if not o then return end
                if isError then o.TextColor3 = STATUS_RED
                elseif waveDefaultColor then o.TextColor3 = waveDefaultColor end
            end)
        end
        local waveRecreateAt = nil
        local function RequestWaveRecreate()
            if Cfg.AutoCreateWave then waveRecreateAt = os.clock() + 1.5 end
        end
        local function ResetAutoCreateWave()
            if not Cfg.AutoCreateWave then return end
            Cfg.AutoCreateWave = false
            Save()
            SetMissionToggle("AutoCreateWave", false)
        end
        local function AddWaveSelect(title, subtitle, options, key)
            local row = WaveForm:Row()
            row:Left():TitleStack({ Title = title, Subtitle = subtitle })
            local btn = row:Right():PullDownButton({
                Label = Cfg[key],
                Options = options,
                Value = table.find(options, Cfg[key]) or 1,
                ValueChanged = function(self, index)
                    if options[index] then
                        Cfg[key] = options[index]
                        self.Label = options[index]
                        Save()
                        RequestWaveRecreate()
                    end
                end
            })
            StyleDropdown(btn)
            UiSync.Add(function()
                local i = table.find(options, Cfg[key]) or 1
                pcall(function() btn.Value = i btn.Label = options[i] end)
            end)
        end
        AddWaveSelect("Select Map", "Choose the wave map.", WAVE_MAPS, "WaveSelect")
        AddWaveSelect("Select Difficulty", "Waves only has Easy for now.", WAVE_DIFFS, "WaveLevel")
        local function CreateWaveRoom(oneShot)
            if not ON_LOBBY_PLACE then SetWaveStatus("Not in the lobby place") return false end
            if missionBusy then SetWaveStatus("Busy - try again in a moment") return false end
            if oneShot and (Cfg.AutoCreateMission or Cfg.AutoCreateRaid) then
                SetWaveStatus("Turn off Auto Create Mission / Raid first", true)
                return false
            end
            missionBusy = true
            local map = Cfg.WaveSelect
            local diff = DifficultyKey(Cfg.WaveLevel)
            SetWaveStatus("Leaving old room...")
            LeaveRoom(true)
            task.wait(0.6)
            if not oneShot and not Cfg.AutoCreateWave then
                SetWaveStatus("Stopped (Auto Create turned off)")
                missionBusy = false
                return false
            end
            SetWaveStatus(("Creating Waves (%s / %s)..."):format(map, diff))
            local ok, r = MissionInvoke("S_Missions", "Create", { Difficulty = diff, Type = "Waves", Objective = "Waves", Name = map })
            if not ok then
                SetWaveStatus("Create failed: " .. tostring(r), true)
                missionBusy = false
                return false
            end
            if r == nil or r == false then
                LeaveRoom(true)
                ResetAutoCreateWave()
                SetWaveStatus("Create refused (locked or no room returned)", true)
                missionBusy = false
                return false
            end
            local got = RoomServerDifficulty(r)
            if got ~= nil and got ~= diff then
                LeaveRoom(true)
                ResetAutoCreateWave()
                SetWaveStatus(("Waves (%s) is locked"):format(diff), true)
                missionBusy = false
                return false
            end
            createdRoom = (typeof(r) == "Instance") and r or createdRoom
            SetWaveStatus(("Room created: Waves / %s / %s"):format(map, diff))
            missionBusy = false
            return true
        end
        local function StartWave()
            if not ON_LOBBY_PLACE then SetWaveStatus("Not in the lobby place") return false end
            if missionBusy then return false end
            missionBusy = true
            SetWaveStatus("Starting wave...")
            local ok, r = MissionInvoke("S_Missions", "Start")
            local note = ""
            if ok and type(r) == "string" and r ~= "" then note = " (" .. r .. ")" end
            SetWaveStatus(ok and ("Start sent" .. note) or ("Start failed: " .. tostring(r)), not ok)
            missionBusy = false
            return ok
        end
        AddMissionToggle("Auto Create Wave", "Keeps a wave room ready with these settings. Remembered next time.", "AutoCreateWave", WaveAutoForm, function(on)
            if on then SetMissionToggle("AutoCreateMission", false) SetMissionToggle("AutoCreateRaid", false) end
            if on and not initializing then waveRecreateAt = os.clock() end
        end)
        AddMissionToggle("Auto Start Waves", "Starts the wave in your room. Remembered next time.", "AutoStartWave", WaveAutoForm, function(on)
            if on then SetMissionToggle("AutoStartMission", false) SetMissionToggle("AutoStartRaid", false) end
        end)
        local WaveDelayRow = WaveAutoForm:Row()
        WaveDelayRow:Left():TitleStack({ Title = "Join Delay", Subtitle = "Seconds between starts (" .. MIN_DELAY .. " - " .. MAX_DELAY .. ")." })
        local WaveDelayRight = WaveDelayRow:Right()
        local WaveDelayLabel = WaveDelayRight:Label({ Text = Cfg.WaveJoinDelay .. "s" })
        UiSync.Link(WaveDelayRight:Slider({
            Minimum = MIN_DELAY,
            Maximum = MAX_DELAY,
            Value = Cfg.WaveJoinDelay,
            ValueChanged = function(self, value)
                Cfg.WaveJoinDelay = ClampDelay(value)
                pcall(function() WaveDelayLabel.Text = Cfg.WaveJoinDelay .. "s" end)
                Save()
            end
        }), Cfg, "WaveJoinDelay", function(_, want)
            pcall(function() WaveDelayLabel.Text = want .. "s" end)
        end)
        local WaveCountRow = WaveAutoForm:Row()
        WaveCountRow:Left():TitleStack({ Title = "Next Wave", Subtitle = "Countdown to the next start." })
        local WaveCountLabel = WaveCountRow:Right():Label({ Text = "Off" })
        local lastWaveCount = nil
        local function SetWaveCountdown(text)
            if text == lastWaveCount then return end
            lastWaveCount = text
            pcall(function() WaveCountLabel.Text = text end)
        end
        local WaveLeaveRow = WaveAutoForm:Row()
        WaveLeaveRow:Left():TitleStack({ Title = "Leave Room", Subtitle = "Leave the current wave room." })
        local WaveLeaveBtn = WaveLeaveRow:Right():Button({ Label = "Leave", Callback = function() end })
        BindButton(WaveLeaveBtn, function()
            ResetAutoCreateWave()
            task.spawn(function()
                local t0 = os.clock()
                while missionBusy and os.clock() - t0 < 10 do task.wait(0.1) end
                if missionBusy then SetWaveStatus("Busy - try again in a moment") return end
                local okL = LeaveRoom(true)
                SetWaveStatus(okL and "Leave sent" or "Leave failed", not okL)
            end)
        end)
        task.spawn(function()
            local readyAt = os.clock() + 4
            local fails, nextTry = 0, 0
            while Alive() do
                task.wait(0.5)
                local now = os.clock()
                if ON_LOBBY_PLACE and Cfg.AutoCreateWave and SH.PlayOn() and not missionBusy and now >= readyAt and not SH.Coord.Blocker(100) then
                    local need = false
                    if waveRecreateAt and now >= waveRecreateAt then
                        waveRecreateAt = nil
                        need = true
                    elseif now >= nextTry and not HasRoom() then
                        need = true
                    end
                    if need then
                        if CreateWaveRoom(false) then
                            fails = 0
                            nextTry = os.clock() + 20
                        elseif Cfg.AutoCreateWave then
                            fails += 1
                            nextTry = os.clock() + 8
                            if fails >= 3 then
                                fails = 0
                                ResetAutoCreateWave()
                                SetWaveStatus("Auto Create stopped (failed 3 times)", true)
                            end
                        end
                    end
                end
            end
        end)
        task.spawn(function()
            local lastFire = nil
            while Alive() do
                local hasRoom = HasRoom()
                if not ON_LOBBY_PLACE then
                    lastFire = nil
                    SetWaveCountdown("Wrong place")
                elseif not (Cfg.AutoStartWave and SH.PlayOn()) then
                    lastFire = nil
                    SetWaveCountdown("Off")
                elseif not hasRoom then
                    lastFire = nil
                    SetWaveCountdown("Waiting for room...")
                elseif SH.Coord.Blocker(100) then
                    lastFire = nil
                    SetWaveCountdown("Waiting: " .. tostring(SH.Coord.last))
                else
                    local now = os.clock()
                    local delay = ClampDelay(Cfg.WaveJoinDelay)
                    if not lastFire then lastFire = now end
                    local remaining = lastFire + delay - now
                    if remaining <= 0 then
                        SetWaveCountdown("Starting now...")
                        StartWave()
                        lastFire = os.clock()
                    else
                        SetWaveCountdown(("Next wave in %ds"):format(math.ceil(remaining)))
                    end
                end
                task.wait(0.25)
            end
        end)
    end)
    SH.Guard("block@6573", function()
        local RefillSection = WaveModeTab:PageSection({
            Title = "⛽ Auto Refill [ Wave ]",
            Subtitle = "Flies to the refill tank and presses R for you (mobile friendly)."
        })
        local RefillForm = RefillSection:Form()
        local ToggleRow = RefillForm:Row()
        ToggleRow:Left():TitleStack({ Title = "Auto Refill [ Wave ]", Subtitle = "When your blades / Thunder Spears run out, goes to the nearest tank, refills, then flies back." })
        UiSync.Link(ToggleRow:Right():Toggle({
            Value = Cfg.AutoRefillWave,
            ValueChanged = function(self, value)
                Cfg.AutoRefillWave = value and true or false
                Save()
            end
        }), Cfg, "AutoRefillWave")
        local StatusRow = RefillForm:Row()
        StatusRow:Left():TitleStack({ Title = "Refill Status", Subtitle = "Current action..." })
        local RefillStatusLabel = StatusRow:Right():Label({ Text = "Off" })
        task.spawn(function()
            local last = nil
            while Alive() do
                task.wait(0.5)
                local text = Farm.WaveRefillStatus and Farm.WaveRefillStatus() or "Off"
                if text ~= last then
                    last = text
                    pcall(function() RefillStatusLabel.Text = tostring(text) end)
                end
            end
        end)
    end)
    SH.Guard("block@6603", function()
        local ReadySection = WaveModeTab:PageSection({
            Title = "✅ Auto Ready",
            Subtitle = "Presses Ready for you when the vote to start appears."
        })
        local ReadyForm = ReadySection:Form()
        local ReadyRow = ReadyForm:Row()
        ReadyRow:Left():TitleStack({ Title = "Auto Ready", Subtitle = "Automatically presses Ready when the vote to start appears." })
        UiSync.Link(ReadyRow:Right():Toggle({
            Value = Cfg.AutoReady,
            ValueChanged = function(self, value)
                Cfg.AutoReady = value and true or false
                Save()
            end
        }), Cfg, "AutoReady")
        local SkipRow = ReadyForm:Row()
        SkipRow:Left():TitleStack({ Title = "Auto Vote Skip", Subtitle = "Automatically presses Ready on the vote to skip the wait between waves." })
        UiSync.Link(SkipRow:Right():Toggle({
            Value = Cfg.AutoVoteSkip,
            ValueChanged = function(self, value)
                Cfg.AutoVoteSkip = value and true or false
                Save()
            end
        }), Cfg, "AutoVoteSkip")
    end)
    SH.Guard("block@6628", function()
        local LeaveSection = WaveModeTab:PageSection({
            Title = "🚪 Leave At Wave",
            Subtitle = "Leave the match once enough waves are cleared."
        })
        local LeaveForm = LeaveSection:Form()
        local LeaveRow = LeaveForm:Row()
        LeaveRow:Left():TitleStack({ Title = "Leave At Wave", Subtitle = "Leave to the lobby when Waves Cleared reaches the number below." })
        UiSync.Link(LeaveRow:Right():Toggle({
            Value = Cfg.AutoLeaveAtWave,
            ValueChanged = function(self, value)
                Cfg.AutoLeaveAtWave = value and true or false
                Save()
            end
        }), Cfg, "AutoLeaveAtWave")
        local range = FARM_RANGES.LeaveAtWave
        local function titleFor(v) return "Leave After Waves Cleared ( " .. v .. " )" end
        local SliderRow = LeaveForm:Row()
        local stack = SliderRow:Left():TitleStack({ Title = titleFor(Cfg.LeaveAtWave), Subtitle = "Counts the Waves Cleared shown in the objectives." })
        UiSync.Link(SliderRow:Right():Slider({
            Minimum = range[1],
            Maximum = range[2],
            Value = Cfg.LeaveAtWave,
            ValueChanged = function(self, value)
                local v = math.clamp(math.floor(value + 0.5), range[1], range[2])
                Cfg.LeaveAtWave = v
                pcall(function() stack.Title = titleFor(v) end)
                Save()
            end
        }), Cfg, "LeaveAtWave", function(_, want)
            pcall(function() stack.Title = titleFor(want) end)
        end)
    end)
    SH.Guard("block@6454", function()
        local DROP_POS = Vector3.new(-745.373169, 6.16312218, 174.26799)
        local LOOT_HEIGHT = 150
        local MAX_CRATE_DIST = 5000
        local MAX_CRATE_UP = 600
        local MAX_CRATE_DOWN = 400
        local CRATE_COOLDOWN = 3
        local LootSection = WaveModeTab:PageSection({
            Title = "📦 Auto Loot Crate",
            Subtitle = "Auto loot your own crate (Crate_<your name>) with NoClip."
        })
        local LootForm = LootSection:Form()
        local ToggleRow = LootForm:Row()
        ToggleRow:Left():TitleStack({ Title = "Auto Loot Crate", Subtitle = "Automatically enables NoClip while looting." })
        UiSync.Link(ToggleRow:Right():Toggle({
            Value = Cfg.AutoLootCrate,
            ValueChanged = function(self, value)
                Cfg.AutoLootCrate = value and true or false
                Save()
            end
        }), Cfg, "AutoLootCrate")
        local StatusRow = LootForm:Row()
        StatusRow:Left():TitleStack({ Title = "Loot Status", Subtitle = "Current action..." })
        local LootStatusLabel = StatusRow:Right():Label({ Text = "Off" })
        local function SetLootStatus(text)
            pcall(function() LootStatusLabel.Text = tostring(text) end)
        end
        local function MyRoot()
            local char = LocalPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if root and hum and hum.Health > 0 then return root end
            return nil
        end
        local function FlyTo(targetPos, maxTime)
            local r0 = MyRoot()
            if r0 then
                local need = (targetPos - r0.Position).Magnitude / (Cfg.FlySpeed or 600) + 1
                if need > maxTime then maxTime = need end
                pcall(function() LocalPlayer:RequestStreamAroundAsync(targetPos, 0.5) end)
            end
            local elapsed = 0
            while elapsed < maxTime and Alive() do
                local dt = task.wait()
                elapsed = elapsed + dt
                local root = MyRoot()
                if not root then return end
                local diff = targetPos - root.Position
                local dist = diff.Magnitude
                if dist < 2 then break end
                local step = math.min((Cfg.FlySpeed or 600) * dt, dist)
                root.CFrame = CFrame.new(root.Position + diff.Unit * step)
                pcall(function() root.AssemblyLinearVelocity = Vector3.zero end)
            end
        end
        local function HeightOf(pos) return pos + Vector3.new(0, LOOT_HEIGHT, 0) end
        local function SetFarmFlag(key, value)
            Cfg[key] = value
            local ctl = Farm.Toggles and Farm.Toggles[key]
            if ctl then pcall(function() ctl.Value = value end) end
        end
        local function NearestCrate(root)
            local waves = workspace:FindFirstChild("Waves")
            local folder = waves and waves:FindFirstChild("Crates")
            if not folder then return nil end
            local best, bestDist = nil, MAX_CRATE_DIST
            local mine1 = ("crate_" .. LocalPlayer.Name):lower()
            local mine2 = ("crate_" .. LocalPlayer.DisplayName):lower()
            for _, crate in ipairs(folder:GetChildren()) do
              local cname = crate.Name:lower()
              if cname == mine1 or cname == mine2 then
                local hitbox = crate:FindFirstChild("Hitbox")
                if not hitbox and crate:IsA("BasePart") then hitbox = crate end
                if hitbox and hitbox:IsA("BasePart") then
                    local hp = hitbox.Position
                    local finite = hp.X == hp.X and hp.Y == hp.Y and hp.Z == hp.Z and math.abs(hp.Y) < 1e5
                    local dy = hp.Y - root.Position.Y
                    if finite and dy <= MAX_CRATE_UP and dy >= -MAX_CRATE_DOWN then
                        local d = (hp - root.Position).Magnitude
                        if d < bestDist then best, bestDist = hitbox, d end
                    end
                end
              end
            end
            return best
        end
        local function LootCycle(crate)
            local wasFarm, wasThunder, wasNoClip = Cfg.AutoFarm, Cfg.AutoFarmThunder, Cfg.NoClip
            SetFarmFlag("AutoFarm", false)
            SetFarmFlag("AutoFarmThunder", false)
            SetFarmFlag("NoClip", true)
            pcall(function()
                SetLootStatus("Looting crate (NoClip ON)...")
                local root = MyRoot()
                if not root then return end
                FlyTo(HeightOf(root.Position), 0.5)
                FlyTo(HeightOf(crate.Position), 1.5)
                FlyTo(crate.Position + Vector3.new(0, 3, 0), 0.5)
                task.wait(0.3)
                SetLootStatus("Returning to drop position...")
                root = MyRoot()
                if not root then return end
                FlyTo(HeightOf(root.Position), 0.5)
                FlyTo(HeightOf(DROP_POS), 1.5)
                FlyTo(DROP_POS, 0.5)
                task.wait(0.5)
            end)
            SetFarmFlag("NoClip", wasNoClip)
            if wasFarm then SetFarmFlag("AutoFarm", true) end
            if wasThunder then SetFarmFlag("AutoFarmThunder", true) end
            SetLootStatus((wasFarm or wasThunder) and "Returned. Resuming Auto Farm." or "Returned.")
        end
        task.spawn(function()
            local crateCooldown = 0
            local lootTries = setmetatable({}, { __mode = "k" })
            while Alive() do
                task.wait(0.5)
                if not (Cfg.AutoLootCrate and SH.PlayOn()) or not Farm.CanUseHere() then
                    Farm.CratePending = false
                    SetLootStatus("Off")
                else
                    local root = MyRoot()
                    local anyCrate = root and NearestCrate(root) or nil
                    if anyCrate and (lootTries[anyCrate] or 0) >= 3 then
                        if lootTries[anyCrate] == 3 then
                            lootTries[anyCrate] = 4
                            print("[AotrUpdate5][Loot] crate still there after 3 tries -> skipping it so Auto Farm keeps killing titans")
                        end
                        anyCrate = nil
                    end
                    Farm.CratePending = anyCrate ~= nil
                    local crate = (anyCrate and os.clock() > crateCooldown) and anyCrate or nil
                    if crate and Farm.NpcBusy then
                        SetLootStatus("Crate ready. Waiting for the NPC visit to finish...")
                    elseif crate then
                        print(string.format("[AotrUpdate5][Loot] crate %s | dist=%.0f dy=%.0f", crate:GetFullName(), (crate.Position - root.Position).Magnitude, crate.Position.Y - root.Position.Y))
                        Farm.LootBusy = true
                        pcall(LootCycle, crate)
                        Farm.LootBusy = false
                        local tries = (lootTries[crate] or 0) + 1
                        lootTries[crate] = tries
                        crateCooldown = os.clock() + CRATE_COOLDOWN + (tries - 1) * 5
                    elseif root then
                        SetLootStatus((Cfg.AutoFarm or Cfg.AutoFarmThunder) and "No crate. Attacking titan..." or "No crate. Waiting...")
                    end
                end
            end
        end)
    end)
    SH.Guard("auto-clear-wave-ui", function()
        local Section = WaveModeTab:PageSection({
            Title = "⚔️ Auto Clear Wave",
            Subtitle = "Stand still and kill titans in range - no flying to them. Turns Auto Farm [ Blades ] and [ TS ] off while it is on."
        })
        local Form = Section:Form()
        local Row = Form:Row()
        Row:Left():TitleStack({ Title = "Auto Clear Wave", Subtitle = "Same blade attacks as Auto Farm [ Blades ], but you stay where you are." })
        Farm.Toggles = Farm.Toggles or {}
        Farm.Toggles.AutoClearWave = UiSync.Link(Row:Right():Toggle({
            Value = Cfg.AutoClearWave,
            ValueChanged = function(self, value)
                Cfg.AutoClearWave = value and true or false
                Save()
                Farm.Fire("OnAutoClearWave", Cfg.AutoClearWave)
            end
        }), Cfg, "AutoClearWave")
        do
            local key = "ClearWaveRange"
            local range = FARM_RANGES[key]
            local function titleFor(v) return "Attack Range ( " .. v .. " studs )" end
            local row = Form:Row()
            local stack = row:Left():TitleStack({ Title = titleFor(Cfg[key]), Subtitle = "Only titans whose nape is within this distance of you are hit. Raise it if titans are not dying." })
            UiSync.Link(row:Right():Slider({
                Minimum = range[1], Maximum = range[2], Value = Cfg[key],
                ValueChanged = function(self, value)
                    local v = math.clamp(math.floor(value / 10 + 0.5) * 10, range[1], range[2])
                    Cfg[key] = v
                    pcall(function() stack.Title = titleFor(v) end)
                    Save()
                end
            }), Cfg, key, function(_, want)
                pcall(function() stack.Title = titleFor(want) end)
            end)
        end
        local StatusRow = Form:Row()
        StatusRow:Left():TitleStack({ Title = "Clear Status", Subtitle = "Current action..." })
        local StatusLabel = StatusRow:Right():Label({ Text = "Off" })
        task.spawn(function()
            local last = nil
            while Alive() do
                task.wait(0.5)
                local text = Farm.ClearWaveStatus or "Off"
                if text ~= last then
                    last = text
                    pcall(function() StatusLabel.Text = tostring(text) end)
                end
            end
        end)
        if Cfg.AutoClearWave then Farm.Fire("OnAutoClearWave", true) end
    end)
    SH.Guard("wave-director", function()
        -- ============================================================
        -- ============================================================
        local PRIORITY = { Heal = 1, Character = 2, Blades = 3, Shop = 4, Blessing = 5 }
        local LABEL = { Heal = "Heal", Character = "Upgrade Character", Blades = "Upgrade Blades", Shop = "Shop", Blessing = "Blessings" }
        local queue, seq, nextFree = {}, 0, 0
        local failGold = {}
        local lastVisit = {}
        local REVISIT_GAP = { Blessing = 20 }
        local REVISIT_DEFAULT = 30
        function Farm.RevisitBlock(name)
            local lv = lastVisit[name]
            local gap = REVISIT_GAP[name] or REVISIT_DEFAULT
            if lv and os.clock() - lv < gap then
                return ("Cooling down (%ds)"):format(math.ceil(gap - (os.clock() - lv)))
            end
            return nil
        end
        Farm.NpcCurrent = nil

        local function ParseAmount(text)
            local num, suf = tostring(text):gsub(",", ""):match("^([%d%.]+)%s*([kKmMbB]?)$")
            local v = num and tonumber(num)
            if not v then return nil end
            suf = suf:lower()
            if suf == "k" then v = v * 1e3 elseif suf == "m" then v = v * 1e6 elseif suf == "b" then v = v * 1e9 end
            return v
        end
        local GOLD_PATHS = {
            "Interface.HUD.Main.Top.2.Gold.Title",
            "Interface.Topbar.Main.Currencies.Gold.Amount",
        }
        function Farm.ReadGold()
            for _, path in ipairs(GOLD_PATHS) do
                local ok, t = pcall(ReadGui, path)
                if ok and t then
                    local v = ParseAmount(t)
                    if v then return v end
                end
            end
            return nil
        end
        function Farm.GoldBlock(name)
            local cool = Farm.RevisitBlock(name)
            if cool then return cool end
            local gold = Farm.ReadGold()
            if gold == nil then return nil end
            local f = failGold[name]
            if f and gold > f then failGold[name] = nil f = nil end
            if (Cfg.WaveMinGold or 0) > 0 and gold < Cfg.WaveMinGold then
                return ("Waiting for gold (%d / %d)"):format(gold, Cfg.WaveMinGold)
            end
            if f then return ("Not enough gold last time, waiting for more (have %d)"):format(gold) end
            return nil
        end
        function Farm.GoldFail(name)
            failGold[name] = Farm.ReadGold()
        end

        function Farm.NpcAcquire(name)
            seq += 1
            local ticket = { name = name, prio = PRIORITY[name] or 9, seq = seq }
            queue[#queue + 1] = ticket
            task.wait(1.2)
            local function myTurn()
                if Farm.NpcBusy or Farm.Refilling or Farm.LootBusy or Farm.CratePending or os.clock() < nextFree then return false end
                for _, t in ipairs(queue) do
                    if t ~= ticket and (t.prio < ticket.prio or (t.prio == ticket.prio and t.seq < ticket.seq)) then return false end
                end
                return true
            end
            while Alive() and not myTurn() do task.wait(0.25) end
            for i, t in ipairs(queue) do
                if t == ticket then table.remove(queue, i) break end
            end
            Farm.NpcBusy = true
            Farm.NpcCurrent = name
            return true
        end
        function Farm.NpcRelease()
            if Farm.NpcCurrent then lastVisit[Farm.NpcCurrent] = os.clock() end
            Farm.NpcBusy = false
            Farm.NpcCurrent = nil
            nextFree = os.clock() + 0.5
        end

        local Section = WaveModeTab:PageSection({
            Title = "🧭 Wave Routine",
            Subtitle = "Crate looting and killing titans come first. Heal, upgrades, shop and blessings take turns in between and check your gold."
        })
        local Form = Section:Form()
        local StatusRow = Form:Row()
        StatusRow:Left():TitleStack({ Title = "Routine Status", Subtitle = "Order: Heal > Upgrade Character > Upgrade Blades > Shop > Blessings." })
        local StatusLabel = StatusRow:Right():Label({ Text = "Idle" })
        local FarmRow = Form:Row()
        FarmRow:Left():TitleStack({ Title = "Farm Status", Subtitle = "What Auto Farm is doing right now, and why it is paused." })
        local FarmLabel = FarmRow:Right():Label({ Text = "?" })
        local GoldRow = Form:Row()
        GoldRow:Left():TitleStack({ Title = "Your Gold", Subtitle = "Read from the HUD." })
        local GoldLabel = GoldRow:Right():Label({ Text = "?" })
        do
            local key = "WaveMinGold"
            local range = FARM_RANGES[key]
            local step = 100
            local function titleFor(v) return "Min Gold To Visit NPC ( " .. (v == 0 and "off" or v) .. " )" end
            local row = Form:Row()
            local stack = row:Left():TitleStack({ Title = titleFor(Cfg[key]), Subtitle = "Don't fly to Youmii / Cole / Lulu / Orange / Roll unless you have at least this much gold (0 = off)." })
            UiSync.Link(row:Right():Slider({
                Minimum = range[1], Maximum = range[2], Value = Cfg[key],
                ValueChanged = function(self, value)
                    local v = math.clamp(math.floor(value / step + 0.5) * step, range[1], range[2])
                    Cfg[key] = v
                    pcall(function() stack.Title = titleFor(v) end)
                    Save()
                end
            }), Cfg, key, function(_, want)
                pcall(function() stack.Title = titleFor(want) end)
            end)
        end
        task.spawn(function()
            local lastS, lastG, lastF = nil, nil, nil
            while Alive() do
                task.wait(0.5)
                local ftext
                do
                    local B = Farm.Blades
                    if not (Cfg.AutoFarm or Cfg.AutoFarmThunder) then
                        ftext = (Farm.NpcBusy or Farm.LootBusy) and "Paused for a short trip" or "Auto Farm is OFF"
                    elseif Farm.LootBusy then ftext = "Paused: looting crate"
                    elseif Farm.NpcBusy then ftext = "Paused: NPC visit (" .. tostring(Farm.NpcCurrent) .. ")"
                    elseif Farm.Refilling then ftext = "Paused: refilling"
                    elseif Farm.FailSafeActive then ftext = "Paused: fail safe"
                    else ftext = tostring(B and B.Status or "?") end
                    local tf = workspace:FindFirstChild("Titans")
                    ftext = ftext .. " | titans: " .. (tf and #tf:GetChildren() or "no folder")
                end
                if ftext ~= lastF then lastF = ftext pcall(function() FarmLabel.Text = ftext end) end
                local text
                if Farm.LootBusy then
                    text = "Looting crate (top priority)"
                elseif Farm.NpcCurrent then
                    text = "Running: " .. (LABEL[Farm.NpcCurrent] or Farm.NpcCurrent)
                elseif Farm.Refilling then
                    text = "Refilling"
                elseif #queue > 0 then
                    local names = {}
                    local sorted = {}
                    for _, t in ipairs(queue) do sorted[#sorted + 1] = t end
                    table.sort(sorted, function(a, b) if a.prio ~= b.prio then return a.prio < b.prio end return a.seq < b.seq end)
                    for _, t in ipairs(sorted) do names[#names + 1] = LABEL[t.name] or t.name end
                    text = "Queue: " .. table.concat(names, " > ")
                else
                    text = "Idle"
                end
                local gold = Farm.ReadGold()
                local gtext = gold and tostring(math.floor(gold)):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "") or "?"
                if text ~= lastS then lastS = text pcall(function() StatusLabel.Text = text end) end
                if gtext ~= lastG then lastG = gtext pcall(function() GoldLabel.Text = gtext end) end
            end
        end)
    end)
    SH.Guard("auto-shop-orange", function()
        -- ============================================================
        -- ============================================================
        local ShopSection = WaveModeTab:PageSection({
            Title = "🛒 Auto Shop [ Orange ]",
            Subtitle = "Goes to Orange, opens the Market and clicks the cards for you (once every wave)."
        })
        local ShopForm = ShopSection:Form()
        local function AddShopToggle(title, subtitle, key)
            local row = ShopForm:Row()
            row:Left():TitleStack({ Title = title, Subtitle = subtitle })
            UiSync.Link(row:Right():Toggle({
                Value = Cfg[key],
                ValueChanged = function(self, value)
                    Cfg[key] = value and true or false
                    Save()
                end
            }), Cfg, key)
        end
        AddShopToggle("Auto Shop [ Orange ]", "Shops automatically at the start of every new wave (the market refreshes each wave).", "AutoShop")
        local function AddShopMulti(title, subtitle, options, keys)
            local row = ShopForm:Row()
            row:Left():TitleStack({ Title = title, Subtitle = subtitle })
            local function selectedIndexes()
                local picked = {}
                for i, key in ipairs(keys) do
                    if Cfg[key] then picked[#picked + 1] = i end
                end
                return picked
            end
            local function apply(value)
                local indexes = type(value) == "table" and value or { value }
                local on = {}
                for _, index in ipairs(SettingsStore.ValidIndexes(indexes, #options)) do on[index] = true end
                for i, key in ipairs(keys) do Cfg[key] = on[i] == true end
                Save()
            end
            local ok, btn = pcall(function()
                return row:Right():PopUpButton({
                    Options = options,
                    Maximum = #options,
                    Value = selectedIndexes(),
                    ValueChanged = function(self, value) apply(value) end
                })
            end)
            if not ok or not btn then
                local first = selectedIndexes()[1]
                btn = row:Right():PullDownButton({
                    Label = first and options[first] or "None",
                    Options = options,
                    Value = first or 1,
                    ValueChanged = function(self, index)
                        apply(index)
                        self.Label = options[index] or "None"
                    end
                })
            end
            StyleDropdown(btn)
            UiSync.Add(function()
                if ok then
                    pcall(function() btn.Value = selectedIndexes() end)
                else
                    local first = selectedIndexes()[1] or 1
                    pcall(function() btn.Value = first btn.Label = options[first] end)
                end
            end)
        end
        local STAR_OPTIONS = { "1 Star", "2 Stars", "3 Stars", "4 Stars", "5 Stars" }
        local function StarKeys(prefix)
            local keys = {}
            for i = 1, 5 do keys[i] = prefix .. i end
            return keys
        end
        AddShopMulti("Buy Categories", "Pick what to buy: Perks (tab 1), Artifacts (tab 2), Memories (tab 3), Crates.",
            { "Perks", "Artifacts", "Memories", "Crates" },
            { "ShopPerk", "ShopArtifact", "ShopMemory", "ShopCrates" })
        AddShopMulti("Perk Stars", "Which star levels to buy for Perks (Common = 1 star, Rare = 3 stars ...).",
            STAR_OPTIONS, StarKeys("ShopPerkStar"))
        AddShopMulti("Artifact Stars", "Which star levels to buy for Artifacts (Goggles, Journal, Glasses, Ring, Key ...).",
            STAR_OPTIONS, StarKeys("ShopArtifactStar"))
        AddShopMulti("Memory Stars", "Which star levels to buy for Memories (Swiftshot, Riposte, Guardian ...).",
            STAR_OPTIONS, StarKeys("ShopMemoryStar"))

        local PRIORITY_OPTIONS = { "Highest star first", "Cheapest first", "Most expensive first" }
        if not table.find(PRIORITY_OPTIONS, Cfg.ShopPriority) then Cfg.ShopPriority = PRIORITY_OPTIONS[1] end
        local PrioRow = ShopForm:Row()
        PrioRow:Left():TitleStack({ Title = "Buy Order", Subtitle = "Used when you cannot afford everything." })
        local PrioBtn = PrioRow:Right():PullDownButton({
            Label = Cfg.ShopPriority,
            Options = PRIORITY_OPTIONS,
            Value = table.find(PRIORITY_OPTIONS, Cfg.ShopPriority) or 1,
            ValueChanged = function(self, index)
                if PRIORITY_OPTIONS[index] then
                    Cfg.ShopPriority = PRIORITY_OPTIONS[index]
                    self.Label = PRIORITY_OPTIONS[index]
                    Save()
                end
            end
        })
        StyleDropdown(PrioBtn)
        UiSync.Add(function()
            local i = table.find(PRIORITY_OPTIONS, Cfg.ShopPriority) or 1
            pcall(function() PrioBtn.Value = i PrioBtn.Label = PRIORITY_OPTIONS[i] end)
        end)

        local function AddShopSlider(title, subtitle, key, step)
            local range = FARM_RANGES[key]
            local function titleFor(v) return title .. " ( " .. (v == 0 and "off" or v) .. " )" end
            local row = ShopForm:Row()
            local stack = row:Left():TitleStack({ Title = titleFor(Cfg[key]), Subtitle = subtitle })
            UiSync.Link(row:Right():Slider({
                Minimum = range[1], Maximum = range[2], Value = Cfg[key],
                ValueChanged = function(self, value)
                    local v = math.clamp(math.floor(value / step + 0.5) * step, range[1], range[2])
                    Cfg[key] = v
                    pcall(function() stack.Title = titleFor(v) end)
                    Save()
                end
            }), Cfg, key, function(_, want)
                pcall(function() stack.Title = titleFor(want) end)
            end)
        end
        AddShopSlider("Max Price", "Skip cards that cost more than this (0 = no limit).", "ShopMaxPrice", 50)
        AddShopSlider("Keep Coins", "Always leave at least this many coins unspent.", "ShopReserve", 50)

        local StatusRow = ShopForm:Row()
        StatusRow:Left():TitleStack({ Title = "Shop Status", Subtitle = "Current action..." })
        local ShopStatusLabel = StatusRow:Right():Label({ Text = "Off" })
        local lastStatus = nil
        local function SetStatus(text)
            if text == lastStatus then return end
            lastStatus = text
            pcall(function() ShopStatusLabel.Text = tostring(text) end)
        end

        local function Clean(o)
            local t = tostring(o.Text or ""):gsub("<[^>]->", "")
            return (t:gsub("^%s+", ""):gsub("%s+$", ""))
        end
        local function Shown(obj)
            local cur = obj
            while cur and cur ~= PlayerGui do
                if cur:IsA("GuiObject") and not cur.Visible then return false end
                if cur:IsA("ScreenGui") and not cur.Enabled then return false end
                cur = cur.Parent
            end
            return obj:IsA("GuiObject") and obj.AbsoluteSize.X > 0 and obj.AbsoluteSize.Y > 0
        end
        local function IsText(d) return d:IsA("TextLabel") or d:IsA("TextButton") end
        local function CenterOf(o) return o.AbsolutePosition + o.AbsoluteSize / 2 end

        local function ClickObj(obj, attempt)
            attempt = attempt or 1
            local isBtn = obj:IsA("GuiButton")
            local method = (attempt - 1) % 3 + 1
            if method == 1 and (not isBtn or type(firesignal) ~= "function") then method = 2 end
            if method == 1 then
                pcall(firesignal, obj.Activated)
                pcall(firesignal, obj.MouseButton1Click)
            elseif method == 2 then
                local gui = obj:FindFirstAncestorOfClass("ScreenGui")
                local inset = (gui and gui.IgnoreGuiInset) and Vector2.zero or GuiService:GetGuiInset()
                local pos = CenterOf(obj) + inset
                pcall(function()
                    VirtualInputManager:SendMouseMoveEvent(pos.X, pos.Y, game)
                    task.wait(0.05)
                    VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, true, game, 0)
                    task.wait(0.06)
                    VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, false, game, 0)
                end)
            else
                if isBtn then
                    pcall(function() GuiService.SelectedObject = obj end)
                    task.wait(0.1)
                    pcall(function()
                        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                        task.wait(0.05)
                        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                    end)
                    task.wait(0.1)
                    pcall(function() GuiService.SelectedObject = nil end)
                end
            end
        end
        local function ButtonFor(label)
            if label:IsA("GuiButton") then return label end
            local cur = label.Parent
            for _ = 1, 4 do
                if not cur or cur == PlayerGui then break end
                if cur:IsA("GuiButton") then return cur end
                cur = cur.Parent
            end
            return label
        end
        local function FindText(pred)
            for _, d in ipairs(PlayerGui:GetDescendants()) do
                if IsText(d) and Shown(d) and pred(Clean(d):lower()) then return d end
            end
            return nil
        end

        local function OrangeNpc()
            local w = workspace:FindFirstChild("Waves")
            local n = w and w:FindFirstChild("NPCs")
            return n and n:FindFirstChild("Orange")
        end
        local function NpcPos(npc)
            local ok, p = pcall(function()
                if npc:IsA("Model") then return npc:GetPivot().Position end
                if npc:IsA("BasePart") then return npc.Position end
                local part = npc:FindFirstChildWhichIsA("BasePart", true)
                return part and part.Position
            end)
            return ok and p or nil
        end
        local function MyRoot()
            local char = LocalPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if root and hum and hum.Health > 0 then return root end
            return nil
        end
        local function MoveTo(cf)
            local root = MyRoot()
            if not root then return end
            pcall(function() LocalPlayer:RequestStreamAroundAsync(cf.Position, 0.5) end)
            local dist = (root.Position - cf.Position).Magnitude
            local t = math.clamp(dist / 900, 0.15, 6)
            local ok, tw = pcall(function()
                return game:GetService("TweenService"):Create(root, TweenInfo.new(t, Enum.EasingStyle.Linear), { CFrame = cf })
            end)
            if not ok or not tw then pcall(function() root.CFrame = cf end) return end
            local vel = game:GetService("RunService").Heartbeat:Connect(function()
                pcall(function() root.AssemblyLinearVelocity = Vector3.zero end)
            end)
            tw:Play()
            local t0 = os.clock()
            while os.clock() - t0 < t + 0.3 and tw.PlaybackState == Enum.PlaybackState.Playing and Alive() do task.wait() end
            pcall(function() tw:Cancel() end)
            vel:Disconnect()
            pcall(function() root.CFrame = cf end)
        end
        local function TapKey(key, hold)
            pcall(function() VirtualInputManager:SendKeyEvent(true, key, false, game) end)
            task.wait(hold or 0.15)
            pcall(function() VirtualInputManager:SendKeyEvent(false, key, false, game) end)
        end

        local TITLES = { PERKS = 1, ARTIFACTS = 2, MEMORIES = 3, SHIFTING = 4, PERK = 1, ARTIFACT = 2, MEMORY = 3 }
        local function MarketLabel()
            return FindText(function(t) return t:match("^market changes every wave") ~= nil end)
        end
        local function ShopScope()
            local lbl = MarketLabel()
            return lbl and (lbl:FindFirstAncestorOfClass("ScreenGui") or PlayerGui) or nil, lbl
        end
        local function CurrentTitle(scope)
            for _, d in ipairs(scope:GetDescendants()) do
                if d:IsA("TextLabel") and Shown(d) then
                    local idx = TITLES[Clean(d):upper()]
                    if idx then return idx, d end
                end
            end
            return nil
        end
        local function FindTabs(scope)
            local _, title = CurrentTitle(scope)
            if not title then return {} end
            local ty = title.AbsolutePosition.Y
            local list = {}
            for _, d in ipairs(scope:GetDescendants()) do
                if d:IsA("GuiButton") and Shown(d) then
                    local s, p = d.AbsoluteSize, d.AbsolutePosition
                    if s.X >= 40 and s.X <= 160 and s.Y >= 40 and s.Y <= 160 and p.Y + s.Y / 2 < ty then
                        local dup = false
                        for _, e in ipairs(list) do
                            if math.abs(CenterOf(e).X - CenterOf(d).X) < 25 and math.abs(CenterOf(e).Y - CenterOf(d).Y) < 25 then dup = true break end
                        end
                        if not dup then list[#list + 1] = d end
                    end
                end
            end
            table.sort(list, function(a, b) return CenterOf(a).X < CenterOf(b).X end)
            return list
        end
        local function TabRow(scope)
            local cam = workspace.CurrentCamera
            local vp = cam and cam.ViewportSize or Vector2.new(1920, 1080)
            local _, title = CurrentTitle(scope)
            local limit = title and title.AbsolutePosition.Y or vp.Y * 0.25
            local cands = {}
            for _, d in ipairs(scope:GetDescendants()) do
                if d:IsA("GuiButton") and Shown(d) then
                    local sz = d.AbsoluteSize
                    if sz.X >= 40 and sz.X <= 160 and sz.Y >= 40 and sz.Y <= 160 and CenterOf(d).Y < limit then
                        local dup = false
                        for _, e in ipairs(cands) do
                            if math.abs(CenterOf(e).X - CenterOf(d).X) < 25 and math.abs(CenterOf(e).Y - CenterOf(d).Y) < 25 then dup = true break end
                        end
                        if not dup then cands[#cands + 1] = d end
                    end
                end
            end
            local best = {}
            for _, a in ipairs(cands) do
                local group = {}
                for _, b in ipairs(cands) do
                    if math.abs(CenterOf(a).Y - CenterOf(b).Y) < 30 then group[#group + 1] = b end
                end
                if #group > #best then best = group end
            end
            table.sort(best, function(a, b) return CenterOf(a).X < CenterOf(b).X end)
            return best
        end
        local function SelectedTab(row)
            local bi, bw, second = nil, 0, 0
            for i, b in ipairs(row) do
                local w = b.AbsoluteSize.X
                if w > bw then second = bw bw = w bi = i elseif w > second then second = w end
            end
            if bi and bw - second >= 6 then return bi end
            return nil
        end
        local function AtTab(scope, idx)
            local cur = CurrentTitle(scope)
            if cur then return cur == idx end
            local sel = SelectedTab(TabRow(scope))
            if sel then return sel == idx end
            return nil
        end
        local function OpenTab(idx)
            local plan = { { 0, 1 }, { 0, 2 }, { 1, 2 }, { -1, 2 }, { 1, 1 }, { -1, 1 }, { 0, 3 } }
            for _, step in ipairs(plan) do
                local scope = ShopScope()
                if not scope then return false end
                if AtTab(scope, idx) == true then return true end
                local row = TabRow(scope)
                local btn = row[idx + step[1]]
                if btn then ClickObj(btn, step[2]) end
                local t0 = os.clock()
                while os.clock() - t0 < 1.0 do
                    task.wait(0.1)
                    local sc = ShopScope()
                    if sc then
                        local at = AtTab(sc, idx)
                        if at == true or (at == nil and step[1] == 0 and btn) then task.wait(0.35) return true end
                    end
                end
            end
            return false
        end

        local function ParseCount(text)
            local a, b = text:lower():gsub("o", "0"):match("^(%d+)%s*/%s*(%d+)$")
            if a then return tonumber(a), tonumber(b) end
            return nil
        end
        local function ParsePrice(text)
            local s = text:gsub("[,%.%s]", "")
            if s:match("^%d+$") then return tonumber(s) end
            return nil
        end
        local STAR_CHARS = { "★", "✦", "✧", "☆", "⭐", "✮", "✯" }
        local function CountStars(card, priceTop)
            for _, d in ipairs(card:GetDescendants()) do
                if d:IsA("TextLabel") and Shown(d) then
                    local total = 0
                    local txt = d.Text or ""
                    for _, ch in ipairs(STAR_CHARS) do total += select(2, txt:gsub(ch, "")) end
                    if total > 0 then return total end
                end
            end
            for _, d in ipairs(card:GetDescendants()) do
                if d:IsA("GuiObject") and Shown(d) and d.Name:lower():find("star") and not d.Name:lower():find("stars") then
                end
            end
            local groups = {}
            local top = card.AbsolutePosition.Y + card.AbsoluteSize.Y * 0.55
            for _, d in ipairs(card:GetDescendants()) do
                if (d:IsA("ImageLabel") or d:IsA("ImageButton")) and Shown(d) then
                    local s, c = d.AbsoluteSize, CenterOf(d)
                    if s.X <= 40 and s.Y <= 40 and c.Y > top and c.Y < priceTop - 2 then
                        local key = math.floor(c.Y / 6)
                        groups[key] = (groups[key] or 0) + 1
                    end
                end
            end
            local best = 0
            for _, n in pairs(groups) do if n > best then best = n end end
            return best > 0 and best or nil
        end
        local function ReadCards(scope)
            local cards, seen = {}, {}
            for _, d in ipairs(scope:GetDescendants()) do
                if d:IsA("TextLabel") and Shown(d) and ParseCount(Clean(d)) then
                    local cur, card = d.Parent, nil
                    for _ = 1, 6 do
                        if not cur or cur == scope or cur == PlayerGui then break end
                        if cur:IsA("GuiObject") and cur.AbsoluteSize.Y > 150 and cur.AbsoluteSize.X < 600 then
                            local hasPrice = false
                            for _, x in ipairs(cur:GetDescendants()) do
                                if x:IsA("TextLabel") and x ~= d and Shown(x) and ParsePrice(Clean(x)) then hasPrice = true break end
                            end
                            if hasPrice then card = cur break end
                        end
                        cur = cur.Parent
                    end
                    if card and not seen[card] then
                        seen[card] = true
                        local info = { Obj = card, Count = nil, Max = nil, Sold = false }
                        info.Count, info.Max = ParseCount(Clean(d))
                        local nameLbl, nameY, priceLbl, priceY = nil, math.huge, nil, -math.huge
                        for _, x in ipairs(card:GetDescendants()) do
                            if x:IsA("TextLabel") and Shown(x) and x ~= d then
                                local t = Clean(x)
                                local up = t:upper()
                                if up == "SOLD" then info.Sold = true
                                elseif ParsePrice(t) then
                                    if x.AbsolutePosition.Y > priceY then priceLbl, priceY = x, x.AbsolutePosition.Y end
                                elseif t ~= "?" and t:match("%a%a") and x.AbsolutePosition.Y < nameY then
                                    nameLbl, nameY = x, x.AbsolutePosition.Y
                                end
                            end
                        end
                        info.Name = nameLbl and Clean(nameLbl):upper() or "?"
                        info.Price = priceLbl and ParsePrice(Clean(priceLbl)) or nil
                        info.PriceObj = priceLbl
                        info.Stars = priceLbl and CountStars(card, priceLbl.AbsolutePosition.Y) or nil
                        info.IsCrate = info.Name:find("CRATE") ~= nil
                        if info.Price then cards[#cards + 1] = info end
                    end
                end
            end
            table.sort(cards, function(a, b)
                local pa, pb = CenterOf(a.Obj), CenterOf(b.Obj)
                if math.abs(pa.Y - pb.Y) > 30 then return pa.Y < pb.Y end
                return pa.X < pb.X
            end)
            return cards
        end
        local function ReadMoney(scope, cards)
            local best, bestY = nil, -math.huge
            for _, d in ipairs(scope:GetDescendants()) do
                if d:IsA("TextLabel") and Shown(d) then
                    local v = ParsePrice(Clean(d))
                    if v then
                        local inCard = false
                        for _, c in ipairs(cards) do
                            if d:IsDescendantOf(c.Obj) then inCard = true break end
                        end
                        if not inCard and d.AbsolutePosition.Y > bestY then best, bestY = v, d.AbsolutePosition.Y end
                    end
                end
            end
            return best
        end
        local function CardButton(card)
            if card:IsA("GuiButton") then return card end
            local best, area = nil, 0
            for _, d in ipairs(card:GetDescendants()) do
                if d:IsA("GuiButton") and Shown(d) then
                    local t = d:IsA("TextButton") and Clean(d) or ""
                    local a = d.AbsoluteSize.X * d.AbsoluteSize.Y
                    if t ~= "?" and a > card.AbsoluteSize.X * card.AbsoluteSize.Y * 0.35 and a > area then best, area = d, a end
                end
            end
            return best
        end
        local CONFIRM_WORDS = { confirm = true, yes = true, buy = true, purchase = true, ok = true, accept = true }
        local function TryConfirm(cards)
            local lbl = FindText(function(t) return CONFIRM_WORDS[t] == true end)
            if not lbl then return false end
            for _, c in ipairs(cards) do
                if lbl:IsDescendantOf(c.Obj) then return false end
            end
            ClickObj(ButtonFor(lbl), 1)
            return true
        end

        local SHOP_STAR_PREFIX = { "ShopPerkStar", "ShopArtifactStar", "ShopMemoryStar" }
        local function Allowed(card, money, tabIdx)
            if card.Sold or not card.Count or card.Count <= 0 or not card.Price then return false end
            if card.IsCrate and not Cfg.ShopCrates then return false end
            if card.Stars and not card.IsCrate then
                local prefix = SHOP_STAR_PREFIX[tabIdx] or "ShopPerkStar"
                if Cfg[prefix .. math.min(card.Stars, 5)] == false then return false end
            end
            if Cfg.ShopMaxPrice > 0 and card.Price > Cfg.ShopMaxPrice then return false end
            if money and card.Price > money - Cfg.ShopReserve then return false end
            return true
        end
        local function Rank(list)
            local mode = Cfg.ShopPriority
            table.sort(list, function(a, b)
                if mode == "Cheapest first" then
                    if a.Price ~= b.Price then return a.Price < b.Price end
                elseif mode == "Most expensive first" then
                    if a.Price ~= b.Price then return a.Price > b.Price end
                else
                    local sa, sb = a.Stars or 0, b.Stars or 0
                    if sa ~= sb then return sa > sb end
                    if a.Price ~= b.Price then return a.Price < b.Price end
                end
                return false
            end)
        end

        local boughtTotal, spentTotal = 0, 0
        local function BuyCard(card, scope)
            local before = ReadCards(scope)
            local moneyBefore = ReadMoney(scope, before)
            local countBefore = card.Count
            local btn = CardButton(card.Obj)
            local priceBtn = (card.PriceObj and card.PriceObj.Parent) and ButtonFor(card.PriceObj) or nil
            for attempt = 1, 4 do
                if not Alive() then return false end
                local target = btn or priceBtn or card.Obj
                ClickObj(target, attempt)
                local t0 = os.clock()
                while os.clock() - t0 < 1.8 do
                    task.wait(0.2)
                    local sc = ShopScope()
                    if not sc then return false end
                    local now = ReadCards(sc)
                    TryConfirm(now)
                    for _, c in ipairs(now) do
                        if c.Name == card.Name and math.abs(CenterOf(c.Obj).X - CenterOf(card.Obj).X) < 20 and math.abs(CenterOf(c.Obj).Y - CenterOf(card.Obj).Y) < 20 then
                            if c.Sold or (c.Count and countBefore and c.Count < countBefore) then
                                return true
                            end
                        end
                    end
                    local m = ReadMoney(sc, now)
                    if m and moneyBefore and m < moneyBefore then return true end
                end
            end
            return false
        end

        local function ShopTabPass(idx, label)
            if not OpenTab(idx) then return false, 0 end
            local failed, bought = {}, 0
            for _ = 1, 40 do
                local scope = ShopScope()
                if not scope or not Alive() then break end
                local cards = ReadCards(scope)
                local money = ReadMoney(scope, cards)
                local list = {}
                if #cards == 0 then
                    SetStatus(label .. ": no cards read (press Scan, see F9)")
                    print(("[AotrUpdate5][Shop] %s: 0 cards read | title=%s"):format(label, tostring(CurrentTitle(scope))))
                end
                for _, c in ipairs(cards) do
                    local key = c.Name .. "@" .. math.floor(CenterOf(c.Obj).X / 10) .. "," .. math.floor(CenterOf(c.Obj).Y / 10)
                    c.Key = key
                    if not failed[key] and Allowed(c, money, idx) then list[#list + 1] = c end
                end
                if #list == 0 then break end
                Rank(list)
                local pick = list[1]
                SetStatus(("%s: buying %s (%s coins)"):format(label, pick.Name, tostring(pick.Price)))
                if BuyCard(pick, scope) then
                    bought += 1
                    boughtTotal += 1
                    spentTotal += pick.Price
                    task.wait(0.3)
                else
                    failed[pick.Key] = true
                end
            end
            return true, bought
        end

        local function CloseShop()
            for _ = 1, 3 do
                local scope = ShopScope()
                if not scope then return end
                local vp = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1920, 1080)
                local best, bestScore = nil, math.huge
                for _, d in ipairs(scope:GetDescendants()) do
                    if d:IsA("GuiButton") and Shown(d) then
                        local c = CenterOf(d)
                        local txt = d:IsA("TextButton") and Clean(d):upper() or ""
                        if txt == "X" or (c.Y < 120 and c.X > vp.X - 160 and d.AbsoluteSize.X < 120) then
                            local score = (vp.X - c.X) + c.Y
                            if score < bestScore then best, bestScore = d, score end
                        end
                    end
                end
                if best then ClickObj(best, 1) end
                task.wait(0.6)
                if not ShopScope() then break end
            end
            local bye = FindText(function(t) return t == "au revoir" or t == "goodbye" or t == "bye" end)
            if bye then ClickObj(ButtonFor(bye), 1) task.wait(0.3) end
        end
        local function OpenMarket()
            if ShopScope() then return true end
            local npc = OrangeNpc()
            local pos = npc and NpcPos(npc)
            if not pos then SetStatus("Orange not found (not in wave mode?)") return false end
            for attempt = 1, 3 do
                if not MyRoot() then return false end
                SetStatus(("Going to Orange (%d/3)"):format(attempt))
                MoveTo(CFrame.new(pos + Vector3.new(4, 2, 4), pos))
                task.wait(0.4)
                SetStatus("Talking to Orange (E)")
                local prompt = npc:FindFirstChildWhichIsA("ProximityPrompt", true)
                if prompt and type(fireproximityprompt) == "function" and attempt ~= 2 then
                    pcall(fireproximityprompt, prompt)
                else
                    TapKey(Enum.KeyCode.E, (prompt and prompt.HoldDuration or 0) + 0.2)
                end
                local t0 = os.clock()
                local clicked = false
                while os.clock() - t0 < 4 do
                    task.wait(0.25)
                    if ShopScope() then return true end
                    local lbl = FindText(function(t) return t:match("^%[?e%]?%s*market$") ~= nil end)
                    if lbl and not clicked then
                        SetStatus("Clicking [E] Market")
                        ClickObj(ButtonFor(lbl), attempt)
                        clicked = true
                        t0 = os.clock() - 2
                    end
                end
            end
            SetStatus("Could not open the Market")
            return false
        end

        local shopping = false
        local function SetFlag(key, value)
            Cfg[key] = value
            local ctl = Farm.Toggles and Farm.Toggles[key]
            if ctl then pcall(function() ctl.Value = value end) end
        end
        local function RunShop()
            if shopping then return false end
            Farm.NpcAcquire("Shop")
            shopping = true
            local wasFarm, wasThunder = Cfg.AutoFarm, Cfg.AutoFarmThunder
            SetFlag("AutoFarm", false)
            SetFlag("AutoFarmThunder", false)
            local root0 = MyRoot()
            local back = root0 and root0.CFrame
            boughtTotal, spentTotal = 0, 0
            local ok, err = pcall(function()
                if not OpenMarket() then error("open failed", 0) end
                task.wait(0.5)
                local tabs = {}
                if Cfg.ShopPerk then tabs[#tabs + 1] = { 1, "Perks" } end
                if Cfg.ShopArtifact then tabs[#tabs + 1] = { 2, "Artifacts" } end
                if Cfg.ShopMemory then tabs[#tabs + 1] = { 3, "Memories" } end
                if #tabs == 0 then SetStatus("Nothing selected to buy") return end
                for _, t in ipairs(tabs) do
                    local opened = ShopTabPass(t[1], t[2])
                    if not opened then SetStatus("Could not open tab: " .. t[2]) end
                end
                SetStatus(("Done: bought %d item(s), spent %d coins"):format(boughtTotal, spentTotal))
            end)
            if not ok and err ~= "open failed" then
                SetStatus("Error: " .. tostring(err))
                warn("[Aotr:Update[5]] Auto Shop error: " .. tostring(err))
            end
            pcall(CloseShop)
            local root = MyRoot()
            if root and back then MoveTo(back) end
            if wasFarm then SetFlag("AutoFarm", true) end
            if wasThunder then SetFlag("AutoFarmThunder", true) end
            shopping = false
            Farm.NpcRelease()
            return ok
        end

        local NowRow = ShopForm:Row()
        NowRow:Left():TitleStack({ Title = "Shop Now", Subtitle = "Run one shopping round right now." })
        local NowBtn = NowRow:Right():Button({ Label = "Shop", Callback = function() end })
        BindButton(NowBtn, function()
            if not Farm.CanUseHere() then SetStatus("Not in a match") return end
            RunShop()
        end)
        if SH.DEV then
        local DbgRow = ShopForm:Row()
        DbgRow:Left():TitleStack({ Title = "Scan Shop (Debug)", Subtitle = "With the Market open: prints every card (name, stars, price, stock) to the F9 console." })
        local DbgBtn = DbgRow:Right():Button({ Label = "Scan", Callback = function() end })
        BindButton(DbgBtn, function()
            local scope = ShopScope()
            if not scope then SetStatus("Open the Market first") return end
            local cards = ReadCards(scope)
            print(("[AotrUpdate5][Shop] tab=%s cards=%d money=%s tabs=%d"):format(tostring(CurrentTitle(scope)), #cards, tostring(ReadMoney(scope, cards)), #FindTabs(scope)))
            local row = TabRow(scope)
            local widths = {}
            for i, b in ipairs(row) do widths[i] = math.floor(b.AbsoluteSize.X) end
            print(("[AotrUpdate5][Shop] tabRow=%d widths=%s selected=%s title=%s"):format(#row, table.concat(widths, ","), tostring(SelectedTab(row)), tostring(CurrentTitle(scope))))
            for i, c in ipairs(cards) do
                print(("[AotrUpdate5][Shop] #%d %s | stars=%s | price=%s | stock=%s/%s | sold=%s | btn=%s | %s"):format(
                    i, c.Name, tostring(c.Stars), tostring(c.Price), tostring(c.Count), tostring(c.Max), tostring(c.Sold),
                    tostring(CardButton(c.Obj) ~= nil), c.Obj:GetFullName()))
            end
            SetStatus(("Scanned %d cards (see F9)"):format(#cards))
        end)
        end

        local waveLabel, scanAt, lastWaveKnown = nil, 0, nil
        local function WaveKey()
            if not (waveLabel and waveLabel.Parent) then
                waveLabel = nil
                if os.clock() - scanAt < 2 then return lastWaveKnown end
                scanAt = os.clock()
                for _, d in ipairs(PlayerGui:GetDescendants()) do
                    if IsText(d) and Clean(d):lower():match("^waves cleared%s*%[%d+%s*/%s*%d+%]") then waveLabel = d break end
                end
            end
            if not waveLabel then return lastWaveKnown end
            local a = Clean(waveLabel):match("%[(%d+)%s*/")
            local v = a and tonumber(a) or nil
            if v then lastWaveKnown = v end
            return v or lastWaveKnown
        end
        task.spawn(function()
            local doneWave, fails, nextTry = -1, 0, 0
            while Alive() do
                task.wait(1)
                if not (Cfg.AutoShop and SH.PlayOn()) then
                    if not shopping then SetStatus("Off") end
                    doneWave, fails = -1, 0
                elseif not Farm.CanUseHere() or not OrangeNpc() then
                    SetStatus("Waiting for wave mode")
                elseif Farm.FailSafeActive then
                    SetStatus("Paused (Fail Safe is losing on purpose)")
                elseif not shopping and not Farm.Refilling and os.clock() >= nextTry then
                    local wave = WaveKey() or 0
                    local goldWhy = wave ~= doneWave and Farm.GoldBlock("Shop")
                    if goldWhy then
                        SetStatus(("Wave %d: %s"):format(wave, goldWhy))
                    elseif wave ~= doneWave then
                        SetStatus(("Wave %d: shopping..."):format(wave))
                        local ok = RunShop()
                        if ok then
                            doneWave, fails = wave, 0
                        else
                            fails += 1
                            nextTry = os.clock() + 6
                            if fails >= 3 then doneWave, fails = wave, 0 end
                        end
                    else
                        SetStatus(("Wave %d done. Waiting for next wave"):format(wave))
                    end
                end
            end
        end)
    end)
    SH.Guard("auto-heal-injuries", function()
        -- ============================================================
        -- ============================================================
        local InjSection = WaveModeTab:PageSection({
            Title = "🩹 Auto Heal Injuries [ Youmii ]",
            Subtitle = "Goes to Youmii, opens Injuries and clicks Heal for you (once every wave)."
        })
        local InjForm = InjSection:Form()
        local ToggleRow = InjForm:Row()
        ToggleRow:Left():TitleStack({ Title = "Auto Heal Injuries", Subtitle = "Visits Youmii at the start of every new wave and heals broken arms / legs (needs enough gold)." })
        UiSync.Link(ToggleRow:Right():Toggle({
            Value = Cfg.AutoHealInjuries,
            ValueChanged = function(self, value)
                Cfg.AutoHealInjuries = value and true or false
                Save()
            end
        }), Cfg, "AutoHealInjuries")
        local StatusRow = InjForm:Row()
        StatusRow:Left():TitleStack({ Title = "Heal Status", Subtitle = "Current action..." })
        local InjStatusLabel = StatusRow:Right():Label({ Text = "Off" })
        local lastStatus = nil
        local function SetStatus(text)
            if text == lastStatus then return end
            lastStatus = text
            pcall(function() InjStatusLabel.Text = tostring(text) end)
        end

        local function Clean(o)
            local t = tostring(o.Text or ""):gsub("<[^>]->", "")
            return (t:gsub("^%s+", ""):gsub("%s+$", ""))
        end
        local function Shown(obj)
            local cur = obj
            while cur and cur ~= PlayerGui do
                if cur:IsA("GuiObject") and not cur.Visible then return false end
                if cur:IsA("ScreenGui") and not cur.Enabled then return false end
                cur = cur.Parent
            end
            return obj:IsA("GuiObject") and obj.AbsoluteSize.X > 0 and obj.AbsoluteSize.Y > 0
        end
        local function IsText(d) return d:IsA("TextLabel") or d:IsA("TextButton") end
        local function CenterOf(o) return o.AbsolutePosition + o.AbsoluteSize / 2 end
        local function ClickObj(obj, attempt)
            attempt = attempt or 1
            local isBtn = obj:IsA("GuiButton")
            local method = (attempt - 1) % 3 + 1
            if method == 1 and (not isBtn or type(firesignal) ~= "function") then method = 2 end
            if method == 1 then
                pcall(firesignal, obj.Activated)
                pcall(firesignal, obj.MouseButton1Click)
            elseif method == 2 then
                local gui = obj:FindFirstAncestorOfClass("ScreenGui")
                local inset = (gui and gui.IgnoreGuiInset) and Vector2.zero or GuiService:GetGuiInset()
                local pos = CenterOf(obj) + inset
                pcall(function()
                    VirtualInputManager:SendMouseMoveEvent(pos.X, pos.Y, game)
                    task.wait(0.05)
                    VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, true, game, 0)
                    task.wait(0.06)
                    VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, false, game, 0)
                end)
            else
                if isBtn then
                    pcall(function() GuiService.SelectedObject = obj end)
                    task.wait(0.1)
                    pcall(function()
                        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                        task.wait(0.05)
                        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                    end)
                    task.wait(0.1)
                    pcall(function() GuiService.SelectedObject = nil end)
                end
            end
        end
        local function ButtonFor(label)
            if label:IsA("GuiButton") then return label end
            local cur = label.Parent
            for _ = 1, 4 do
                if not cur or cur == PlayerGui then break end
                if cur:IsA("GuiButton") then return cur end
                cur = cur.Parent
            end
            return label
        end
        local function FindText(pred)
            for _, d in ipairs(PlayerGui:GetDescendants()) do
                if IsText(d) and Shown(d) and pred(Clean(d):lower()) then return d end
            end
            return nil
        end

        local function YoumiiNpc()
            local w = workspace:FindFirstChild("Waves")
            local n = w and w:FindFirstChild("NPCs")
            return n and n:FindFirstChild("Youmii")
        end
        local function NpcPos(npc)
            local ok, p = pcall(function()
                if npc:IsA("Model") then return npc:GetPivot().Position end
                if npc:IsA("BasePart") then return npc.Position end
                local part = npc:FindFirstChildWhichIsA("BasePart", true)
                return part and part.Position
            end)
            return ok and p or nil
        end
        local function MyRoot()
            local char = LocalPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if root and hum and hum.Health > 0 then return root end
            return nil
        end
        local function MoveTo(cf)
            local root = MyRoot()
            if not root then return end
            pcall(function() LocalPlayer:RequestStreamAroundAsync(cf.Position, 0.5) end)
            local dist = (root.Position - cf.Position).Magnitude
            local t = math.clamp(dist / 900, 0.15, 6)
            local ok, tw = pcall(function()
                return game:GetService("TweenService"):Create(root, TweenInfo.new(t, Enum.EasingStyle.Linear), { CFrame = cf })
            end)
            if not ok or not tw then pcall(function() root.CFrame = cf end) return end
            local vel = game:GetService("RunService").Heartbeat:Connect(function()
                pcall(function() root.AssemblyLinearVelocity = Vector3.zero end)
            end)
            tw:Play()
            local t0 = os.clock()
            while os.clock() - t0 < t + 0.3 and tw.PlaybackState == Enum.PlaybackState.Playing and Alive() do task.wait() end
            pcall(function() tw:Cancel() end)
            vel:Disconnect()
            pcall(function() root.CFrame = cf end)
        end
        local function TapKey(key, hold)
            pcall(function() VirtualInputManager:SendKeyEvent(true, key, false, game) end)
            task.wait(hold or 0.15)
            pcall(function() VirtualInputManager:SendKeyEvent(false, key, false, game) end)
        end

        local function PanelScope()
            local lbl = FindText(function(t) return t == "injuries" end)
            return lbl and (lbl:FindFirstAncestorOfClass("ScreenGui") or PlayerGui) or nil
        end
        local function NoInjuries()
            return FindText(function(t) return t:match("^no injuries") ~= nil end) ~= nil
        end
        local function CloseInjuries()
            for _ = 1, 3 do
                local scope = PanelScope()
                if not scope then break end
                local vp = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1920, 1080)
                local best, bestScore = nil, math.huge
                for _, d in ipairs(scope:GetDescendants()) do
                    if d:IsA("GuiButton") and Shown(d) then
                        local c = CenterOf(d)
                        local txt = d:IsA("TextButton") and Clean(d):upper() or ""
                        if txt == "X" or (c.Y < 120 and c.X > vp.X - 160 and d.AbsoluteSize.X < 120) then
                            local score = (vp.X - c.X) + c.Y
                            if score < bestScore then best, bestScore = d, score end
                        end
                    end
                end
                if best then ClickObj(best, 1) end
                task.wait(0.6)
                if not PanelScope() then break end
            end
            local bye = FindText(function(t) return t:match("^nah") ~= nil or t == "goodbye" or t == "bye" end)
            if bye then ClickObj(ButtonFor(bye), 1) task.wait(0.3) end
        end
        local function OpenInjuries()
            if PanelScope() then return true end
            local npc = YoumiiNpc()
            local pos = npc and NpcPos(npc)
            if not pos then SetStatus("Youmii not found (not in wave mode?)") return false end
            for attempt = 1, 3 do
                if not MyRoot() then return false end
                SetStatus(("Going to Youmii (%d/3)"):format(attempt))
                MoveTo(CFrame.new(pos + Vector3.new(4, 2, 4), pos))
                task.wait(0.4)
                SetStatus("Talking to Youmii (E)")
                local prompt = npc:FindFirstChildWhichIsA("ProximityPrompt", true)
                if prompt and type(fireproximityprompt) == "function" and attempt ~= 2 then
                    pcall(fireproximityprompt, prompt)
                else
                    TapKey(Enum.KeyCode.E, (prompt and prompt.HoldDuration or 0) + 0.2)
                end
                local t0 = os.clock()
                local clicked = false
                while os.clock() - t0 < 4 do
                    task.wait(0.25)
                    if PanelScope() then return true end
                    local lbl = FindText(function(t) return t:match("^%[?e%]?%s*injuries$") ~= nil end)
                    if lbl and not clicked then
                        SetStatus("Clicking [E] Injuries")
                        ClickObj(ButtonFor(lbl), attempt)
                        clicked = true
                        t0 = os.clock() - 2
                    end
                end
            end
            SetStatus("Could not open Injuries")
            return false
        end

        local function HealAll()
            local healed, lastBtn, same = 0, nil, 0
            for _ = 1, 12 do
                if not PanelScope() then return healed, "closed" end
                if NoInjuries() then return healed, "none" end
                local lbl = FindText(function(t) return t:match("^heal") ~= nil end)
                if not lbl then return healed, "nobutton" end
                local btn = ButtonFor(lbl)
                if btn == lastBtn then same += 1 else same = 0 end
                if same >= 3 then return healed, "stuck" end
                lastBtn = btn
                if same == 0 then healed += 1 end
                SetStatus(("Healing... (%d)"):format(healed))
                ClickObj(btn, same + 1)
                task.wait(0.8)
            end
            return healed, "limit"
        end

        local healing = false
        local function SetFlag(key, value)
            Cfg[key] = value
            local ctl = Farm.Toggles and Farm.Toggles[key]
            if ctl then pcall(function() ctl.Value = value end) end
        end
        local function RunHeal()
            if healing then return false end
            Farm.NpcAcquire("Heal")
            healing = true
            local wasFarm, wasThunder = Cfg.AutoFarm, Cfg.AutoFarmThunder
            SetFlag("AutoFarm", false)
            SetFlag("AutoFarmThunder", false)
            local root0 = MyRoot()
            local back = root0 and root0.CFrame
            local ok, err = pcall(function()
                if not OpenInjuries() then error("open failed", 0) end
                task.wait(0.5)
                local n, why = HealAll()
                if why == "none" and n == 0 then SetStatus("No injuries")
                elseif why == "stuck" then SetStatus("Heal did not work (not enough gold?)") Farm.GoldFail("Heal")
                elseif why == "nobutton" and n == 0 then SetStatus("No Heal button found (press Scan and check F9)")
                else SetStatus(("Done: healed %d injury(ies)"):format(n)) end
            end)
            if not ok and err ~= "open failed" then
                SetStatus("Error: " .. tostring(err))
                warn("[Aotr:Update[5]] Auto Heal error: " .. tostring(err))
            end
            pcall(CloseInjuries)
            local root = MyRoot()
            if root and back then MoveTo(back) end
            if wasFarm then SetFlag("AutoFarm", true) end
            if wasThunder then SetFlag("AutoFarmThunder", true) end
            healing = false
            Farm.NpcRelease()
            return ok
        end

        local NowRow = InjForm:Row()
        NowRow:Left():TitleStack({ Title = "Heal Now", Subtitle = "Visit Youmii and heal right now." })
        local NowBtn = NowRow:Right():Button({ Label = "Heal", Callback = function() end })
        BindButton(NowBtn, function()
            if not Farm.CanUseHere() then SetStatus("Not in a match") return end
            RunHeal()
        end)
        if SH.DEV then
        local DbgRow = InjForm:Row()
        DbgRow:Left():TitleStack({ Title = "Scan Injuries (Debug)", Subtitle = "With the Injuries window open: prints every visible text/button to the F9 console." })
        local DbgBtn = DbgRow:Right():Button({ Label = "Scan", Callback = function() end })
        BindButton(DbgBtn, function()
            local scope = PanelScope()
            if not scope then SetStatus("Open the Injuries window first") return end
            local n = 0
            for _, d in ipairs(scope:GetDescendants()) do
                if IsText(d) and Shown(d) then
                    n += 1
                    print(("[AotrUpdate5][Heal] %s | %q | %s"):format(d.ClassName, Clean(d), d:GetFullName()))
                end
            end
            SetStatus(("Scanned %d texts (see F9)"):format(n))
        end)
        end

        local waveLabel, scanAt, lastWaveKnown = nil, 0, nil
        local function WaveKey()
            if not (waveLabel and waveLabel.Parent) then
                waveLabel = nil
                if os.clock() - scanAt < 2 then return lastWaveKnown end
                scanAt = os.clock()
                for _, d in ipairs(PlayerGui:GetDescendants()) do
                    if IsText(d) and Clean(d):lower():match("^waves cleared%s*%[%d+%s*/%s*%d+%]") then waveLabel = d break end
                end
            end
            if not waveLabel then return lastWaveKnown end
            local a = Clean(waveLabel):match("%[(%d+)%s*/")
            local v = a and tonumber(a) or nil
            if v then lastWaveKnown = v end
            return v or lastWaveKnown
        end
        task.spawn(function()
            local doneWave, fails, nextTry = -1, 0, 0
            while Alive() do
                task.wait(1)
                if not Cfg.AutoHealInjuries then
                    if not healing then SetStatus("Off") end
                    doneWave, fails = -1, 0
                elseif not Farm.CanUseHere() or not YoumiiNpc() then
                    SetStatus("Waiting for wave mode")
                elseif Farm.FailSafeActive then
                    SetStatus("Paused (Fail Safe is losing on purpose)")
                elseif not healing and not Farm.Refilling and os.clock() >= nextTry then
                    local wave = WaveKey() or 0
                    local goldWhy = wave ~= doneWave and Farm.GoldBlock("Heal")
                    if goldWhy then
                        SetStatus(("Wave %d: %s"):format(wave, goldWhy))
                    elseif wave ~= doneWave then
                        SetStatus(("Wave %d: checking injuries..."):format(wave))
                        local ok = RunHeal()
                        if ok then
                            doneWave, fails = wave, 0
                        else
                            fails += 1
                            nextTry = os.clock() + 6
                            if fails >= 3 then doneWave, fails = wave, 0 end
                        end
                    else
                        SetStatus(("Wave %d done. Waiting for next wave"):format(wave))
                    end
                end
            end
        end)
    end)
    SH.Guard("auto-upgrade-cole", function()
        -- ============================================================
        -- ============================================================
        local UpgSection = WaveModeTab:PageSection({
            Title = "⬆️ Auto Upgrade Character [ Cole ]",
            Subtitle = "Goes to Cole, opens Upgrades and buys the upgrades you picked (once every wave)."
        })
        local UpgForm = UpgSection:Form()
        local ToggleRow = UpgForm:Row()
        ToggleRow:Left():TitleStack({ Title = "Auto Upgrade Character", Subtitle = "Visits Cole at the start of every new wave and buys the selected upgrades while you have enough gold." })
        UiSync.Link(ToggleRow:Right():Toggle({
            Value = Cfg.AutoUpgradeChar,
            ValueChanged = function(self, value)
                Cfg.AutoUpgradeChar = value and true or false
                Save()
            end
        }), Cfg, "AutoUpgradeChar")

        local CARDS = {
            { name = "Max HP", title = "max hp", key = "UpgMaxHP" },
            { name = "Regen", title = "regen", key = "UpgRegen" },
            { name = "Replenish", title = "replenish", key = "UpgReplenish" },
            { name = "Refills", title = "refills", key = "UpgRefills" },
            { name = "Revive", title = "revive", key = "UpgRevive" },
        }
        local OPTIONS, KEYS = {}, {}
        for i, c in ipairs(CARDS) do OPTIONS[i] = c.name KEYS[i] = c.key end

        do
            local row = UpgForm:Row()
            row:Left():TitleStack({ Title = "Upgrades to Buy", Subtitle = "Pick which upgrades Cole should buy: Max HP, Regen, Replenish, Refills, Revive." })
            local function selectedIndexes()
                local picked = {}
                for i, key in ipairs(KEYS) do
                    if Cfg[key] then picked[#picked + 1] = i end
                end
                return picked
            end
            local function apply(value)
                local indexes = type(value) == "table" and value or { value }
                local on = {}
                for _, index in ipairs(SettingsStore.ValidIndexes(indexes, #OPTIONS)) do on[index] = true end
                for i, key in ipairs(KEYS) do Cfg[key] = on[i] == true end
                Save()
            end
            local ok, btn = pcall(function()
                return row:Right():PopUpButton({
                    Options = OPTIONS,
                    Maximum = #OPTIONS,
                    Value = selectedIndexes(),
                    ValueChanged = function(self, value) apply(value) end
                })
            end)
            if not ok or not btn then
                local first = selectedIndexes()[1]
                btn = row:Right():PullDownButton({
                    Label = first and OPTIONS[first] or "None",
                    Options = OPTIONS,
                    Value = first or 1,
                    ValueChanged = function(self, index)
                        apply(index)
                        self.Label = OPTIONS[index] or "None"
                    end
                })
            end
            StyleDropdown(btn)
            UiSync.Add(function()
                if ok then
                    pcall(function() btn.Value = selectedIndexes() end)
                else
                    local first = selectedIndexes()[1] or 1
                    pcall(function() btn.Value = first btn.Label = OPTIONS[first] end)
                end
            end)
        end

        local StatusRow = UpgForm:Row()
        StatusRow:Left():TitleStack({ Title = "Upgrade Status", Subtitle = "Current action..." })
        local UpgStatusLabel = StatusRow:Right():Label({ Text = "Off" })
        local lastStatus = nil
        local function SetStatus(text)
            if text == lastStatus then return end
            lastStatus = text
            pcall(function() UpgStatusLabel.Text = tostring(text) end)
        end

        local function Clean(o)
            local t = tostring(o.Text or ""):gsub("<[^>]->", "")
            return (t:gsub("^%s+", ""):gsub("%s+$", ""))
        end
        local function Shown(obj)
            local cur = obj
            while cur and cur ~= PlayerGui do
                if cur:IsA("GuiObject") and not cur.Visible then return false end
                if cur:IsA("ScreenGui") and not cur.Enabled then return false end
                cur = cur.Parent
            end
            return obj:IsA("GuiObject") and obj.AbsoluteSize.X > 0 and obj.AbsoluteSize.Y > 0
        end
        local function IsText(d) return d:IsA("TextLabel") or d:IsA("TextButton") end
        local function CenterOf(o) return o.AbsolutePosition + o.AbsoluteSize / 2 end
        local function ClickObj(obj, attempt)
            attempt = attempt or 1
            local isBtn = obj:IsA("GuiButton")
            local method = (attempt - 1) % 3 + 1
            if method == 1 and (not isBtn or type(firesignal) ~= "function") then method = 2 end
            if method == 1 then
                pcall(firesignal, obj.Activated)
                pcall(firesignal, obj.MouseButton1Click)
            elseif method == 2 then
                local gui = obj:FindFirstAncestorOfClass("ScreenGui")
                local inset = (gui and gui.IgnoreGuiInset) and Vector2.zero or GuiService:GetGuiInset()
                local pos = CenterOf(obj) + inset
                pcall(function()
                    VirtualInputManager:SendMouseMoveEvent(pos.X, pos.Y, game)
                    task.wait(0.05)
                    VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, true, game, 0)
                    task.wait(0.06)
                    VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, false, game, 0)
                end)
            else
                if isBtn then
                    pcall(function() GuiService.SelectedObject = obj end)
                    task.wait(0.1)
                    pcall(function()
                        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                        task.wait(0.05)
                        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                    end)
                    task.wait(0.1)
                    pcall(function() GuiService.SelectedObject = nil end)
                end
            end
        end
        local function ButtonFor(label)
            if label:IsA("GuiButton") then return label end
            local cur = label.Parent
            for _ = 1, 4 do
                if not cur or cur == PlayerGui then break end
                if cur:IsA("GuiButton") then return cur end
                cur = cur.Parent
            end
            return label
        end
        local function FindText(pred)
            for _, d in ipairs(PlayerGui:GetDescendants()) do
                if IsText(d) and Shown(d) and pred(Clean(d):lower()) then return d end
            end
            return nil
        end

        local function ColeNpc()
            local w = workspace:FindFirstChild("Waves")
            local n = w and w:FindFirstChild("NPCs")
            return n and n:FindFirstChild("Cole")
        end
        local function NpcPos(npc)
            local ok, p = pcall(function()
                if npc:IsA("Model") then return npc:GetPivot().Position end
                if npc:IsA("BasePart") then return npc.Position end
                local part = npc:FindFirstChildWhichIsA("BasePart", true)
                return part and part.Position
            end)
            return ok and p or nil
        end
        local function MyRoot()
            local char = LocalPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if root and hum and hum.Health > 0 then return root end
            return nil
        end
        local function MoveTo(cf)
            local root = MyRoot()
            if not root then return end
            pcall(function() LocalPlayer:RequestStreamAroundAsync(cf.Position, 0.5) end)
            local dist = (root.Position - cf.Position).Magnitude
            local t = math.clamp(dist / 900, 0.15, 6)
            local ok, tw = pcall(function()
                return game:GetService("TweenService"):Create(root, TweenInfo.new(t, Enum.EasingStyle.Linear), { CFrame = cf })
            end)
            if not ok or not tw then pcall(function() root.CFrame = cf end) return end
            local vel = game:GetService("RunService").Heartbeat:Connect(function()
                pcall(function() root.AssemblyLinearVelocity = Vector3.zero end)
            end)
            tw:Play()
            local t0 = os.clock()
            while os.clock() - t0 < t + 0.3 and tw.PlaybackState == Enum.PlaybackState.Playing and Alive() do task.wait() end
            pcall(function() tw:Cancel() end)
            vel:Disconnect()
            pcall(function() root.CFrame = cf end)
        end
        local function TapKey(key, hold)
            pcall(function() VirtualInputManager:SendKeyEvent(true, key, false, game) end)
            task.wait(hold or 0.15)
            pcall(function() VirtualInputManager:SendKeyEvent(false, key, false, game) end)
        end

        local function PanelScope()
            local lbl = FindText(function(t) return t == "upgrades" end)
            return lbl and (lbl:FindFirstAncestorOfClass("ScreenGui") or PlayerGui) or nil
        end
        local function TitleFor(scope, card)
            for _, d in ipairs(scope:GetDescendants()) do
                if IsText(d) and Shown(d) and Clean(d):lower() == card.title then return d end
            end
            return nil
        end
        local function BuyBtnFor(scope, titleLbl)
            local tc = CenterOf(titleLbl)
            local best, bestDx = nil, 150
            for _, d in ipairs(scope:GetDescendants()) do
                if IsText(d) and Shown(d) then
                    local t = Clean(d):lower()
                    if t:match("^buy%s*%(") or t:match("^max%s*%(") then
                        local c = CenterOf(d)
                        local dx = math.abs(c.X - tc.X)
                        if c.Y > tc.Y and dx < bestDx then best, bestDx = d, dx end
                    end
                end
            end
            return best
        end
        local function CloseUpgrades()
            for _ = 1, 3 do
                local scope = PanelScope()
                if not scope then break end
                local vp = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1920, 1080)
                local best, bestScore = nil, math.huge
                for _, d in ipairs(scope:GetDescendants()) do
                    if d:IsA("GuiButton") and Shown(d) then
                        local c = CenterOf(d)
                        local txt = d:IsA("TextButton") and Clean(d):upper() or ""
                        if txt == "X" or (c.Y < 120 and c.X > vp.X - 160 and d.AbsoluteSize.X < 120) then
                            local score = (vp.X - c.X) + c.Y
                            if score < bestScore then best, bestScore = d, score end
                        end
                    end
                end
                if best then ClickObj(best, 1) end
                task.wait(0.6)
                if not PanelScope() then break end
            end
            local bye = FindText(function(t) return t == "bye" or t == "goodbye" end)
            if bye then ClickObj(ButtonFor(bye), 1) task.wait(0.3) end
        end
        local function OpenUpgrades()
            if PanelScope() then return true end
            local npc = ColeNpc()
            local pos = npc and NpcPos(npc)
            if not pos then SetStatus("Cole not found (not in wave mode?)") return false end
            for attempt = 1, 3 do
                if not MyRoot() then return false end
                SetStatus(("Going to Cole (%d/3)"):format(attempt))
                MoveTo(CFrame.new(pos + Vector3.new(4, 2, 4), pos))
                task.wait(0.4)
                SetStatus("Talking to Cole (E)")
                local prompt = npc:FindFirstChildWhichIsA("ProximityPrompt", true)
                if prompt and type(fireproximityprompt) == "function" and attempt ~= 2 then
                    pcall(fireproximityprompt, prompt)
                else
                    TapKey(Enum.KeyCode.E, (prompt and prompt.HoldDuration or 0) + 0.2)
                end
                local t0 = os.clock()
                local clicked = false
                while os.clock() - t0 < 4 do
                    task.wait(0.25)
                    if PanelScope() then return true end
                    local lbl = FindText(function(t) return t:match("^%[?e%]?%s*upgrades?$") ~= nil end)
                    if lbl and not clicked then
                        SetStatus("Clicking [E] Upgrade")
                        ClickObj(ButtonFor(lbl), attempt)
                        clicked = true
                        t0 = os.clock() - 2
                    end
                end
            end
            SetStatus("Could not open Upgrades")
            return false
        end

        local function BuyCard(card)
            local bought, tries = 0, 0
            for _ = 1, 30 do
                local scope = PanelScope()
                if not scope then return bought, "closed" end
                local title = TitleFor(scope, card)
                if not title then return bought, "notfound" end
                local btn = BuyBtnFor(scope, title)
                if not btn then return bought, "nobutton" end
                local before = Clean(btn):lower()
                if before:match("^max") then return bought, "max" end
                SetStatus(("Buying %s %s"):format(card.name, before))
                ClickObj(ButtonFor(btn), tries + 1)
                task.wait(0.8)
                local scope2 = PanelScope()
                local title2 = scope2 and TitleFor(scope2, card)
                local btn2 = title2 and BuyBtnFor(scope2, title2)
                local after = btn2 and Clean(btn2):lower() or ""
                if after ~= before then
                    bought += 1
                    tries = 0
                else
                    tries += 1
                    if tries >= 3 then return bought, "gold" end
                end
            end
            return bought, "limit"
        end

        local upgrading = false
        local function SetFlag(key, value)
            Cfg[key] = value
            local ctl = Farm.Toggles and Farm.Toggles[key]
            if ctl then pcall(function() ctl.Value = value end) end
        end
        local function RunUpgrade()
            if upgrading then return false end
            Farm.NpcAcquire("Character")
            upgrading = true
            local wasFarm, wasThunder = Cfg.AutoFarm, Cfg.AutoFarmThunder
            SetFlag("AutoFarm", false)
            SetFlag("AutoFarmThunder", false)
            local root0 = MyRoot()
            local back = root0 and root0.CFrame
            local ok, err = pcall(function()
                local picked = {}
                for _, c in ipairs(CARDS) do
                    if Cfg[c.key] then picked[#picked + 1] = c end
                end
                if #picked == 0 then SetStatus("Nothing selected to upgrade") return end
                if not OpenUpgrades() then error("open failed", 0) end
                task.wait(0.5)
                local total, noGold = 0, {}
                for _, c in ipairs(picked) do
                    local n, why = BuyCard(c)
                    total += n
                    if why == "gold" then noGold[#noGold + 1] = c.name end
                    if why == "notfound" or why == "nobutton" then warn("[Aotr:Update[5]] Auto Upgrade: could not find the card/button for " .. c.name .. " (" .. why .. ")") end
                end
                if #noGold > 0 then
                    Farm.GoldFail("Character")
                    SetStatus(("Bought %d. Not enough gold for: %s"):format(total, table.concat(noGold, ", ")))
                else
                    SetStatus(("Done: bought %d upgrade(s)"):format(total))
                end
            end)
            if not ok and err ~= "open failed" then
                SetStatus("Error: " .. tostring(err))
                warn("[Aotr:Update[5]] Auto Upgrade error: " .. tostring(err))
            end
            pcall(CloseUpgrades)
            local root = MyRoot()
            if root and back then MoveTo(back) end
            if wasFarm then SetFlag("AutoFarm", true) end
            if wasThunder then SetFlag("AutoFarmThunder", true) end
            upgrading = false
            Farm.NpcRelease()
            return ok
        end

        local NowRow = UpgForm:Row()
        NowRow:Left():TitleStack({ Title = "Upgrade Now", Subtitle = "Visit Cole and buy the selected upgrades right now." })
        local NowBtn = NowRow:Right():Button({ Label = "Upgrade", Callback = function() end })
        BindButton(NowBtn, function()
            if not Farm.CanUseHere() then SetStatus("Not in a match") return end
            RunUpgrade()
        end)
        if SH.DEV then
        local DbgRow = UpgForm:Row()
        DbgRow:Left():TitleStack({ Title = "Scan Upgrades (Debug)", Subtitle = "With the Upgrades window open: prints every visible text/button to the F9 console." })
        local DbgBtn = DbgRow:Right():Button({ Label = "Scan", Callback = function() end })
        BindButton(DbgBtn, function()
            local scope = PanelScope()
            if not scope then SetStatus("Open the Upgrades window first") return end
            local n = 0
            for _, d in ipairs(scope:GetDescendants()) do
                if IsText(d) and Shown(d) then
                    n += 1
                    print(("[AotrUpdate5][Upgrade] %s | %q | %s"):format(d.ClassName, Clean(d), d:GetFullName()))
                end
            end
            SetStatus(("Scanned %d texts (see F9)"):format(n))
        end)
        end

        local waveLabel, scanAt, lastWaveKnown = nil, 0, nil
        local function WaveKey()
            if not (waveLabel and waveLabel.Parent) then
                waveLabel = nil
                if os.clock() - scanAt < 2 then return lastWaveKnown end
                scanAt = os.clock()
                for _, d in ipairs(PlayerGui:GetDescendants()) do
                    if IsText(d) and Clean(d):lower():match("^waves cleared%s*%[%d+%s*/%s*%d+%]") then waveLabel = d break end
                end
            end
            if not waveLabel then return lastWaveKnown end
            local a = Clean(waveLabel):match("%[(%d+)%s*/")
            local v = a and tonumber(a) or nil
            if v then lastWaveKnown = v end
            return v or lastWaveKnown
        end
        task.spawn(function()
            local doneWave, fails, nextTry = -1, 0, 0
            while Alive() do
                task.wait(1)
                if not Cfg.AutoUpgradeChar then
                    if not upgrading then SetStatus("Off") end
                    doneWave, fails = -1, 0
                elseif not Farm.CanUseHere() or not ColeNpc() then
                    SetStatus("Waiting for wave mode")
                elseif Farm.FailSafeActive then
                    SetStatus("Paused (Fail Safe is losing on purpose)")
                elseif not upgrading and not Farm.Refilling and os.clock() >= nextTry then
                    local wave = WaveKey() or 0
                    local goldWhy = wave ~= doneWave and Farm.GoldBlock("Character")
                    if goldWhy then
                        SetStatus(("Wave %d: %s"):format(wave, goldWhy))
                    elseif wave ~= doneWave then
                        SetStatus(("Wave %d: upgrading..."):format(wave))
                        local ok = RunUpgrade()
                        if ok then
                            doneWave, fails = wave, 0
                        else
                            fails += 1
                            nextTry = os.clock() + 6
                            if fails >= 3 then doneWave, fails = wave, 0 end
                        end
                    else
                        SetStatus(("Wave %d done. Waiting for next wave"):format(wave))
                    end
                end
            end
        end)
    end)
    SH.Guard("auto-upgrade-blades-lulu", function()
        -- ============================================================
        -- ============================================================
        local BladeSection = WaveModeTab:PageSection({
            Title = "🗡️ Auto Upgrade [ Blades ] All",
            Subtitle = "Goes to Lulu, opens Equipment and presses UPGRADE ALL for you (once every wave)."
        })
        local BladeForm = BladeSection:Form()
        local ToggleRow = BladeForm:Row()
        ToggleRow:Left():TitleStack({ Title = "Auto Upgrade [ Blades ] All", Subtitle = "Visits Lulu at the start of every new wave and upgrades all your blade stats while you have enough gold." })
        UiSync.Link(ToggleRow:Right():Toggle({
            Value = Cfg.AutoUpgradeBlades,
            ValueChanged = function(self, value)
                Cfg.AutoUpgradeBlades = value and true or false
                Save()
            end
        }), Cfg, "AutoUpgradeBlades")
        local StatusRow = BladeForm:Row()
        StatusRow:Left():TitleStack({ Title = "Blade Upgrade Status", Subtitle = "Current action..." })
        local BladeStatusLabel = StatusRow:Right():Label({ Text = "Off" })
        local lastStatus = nil
        local function SetStatus(text)
            if text == lastStatus then return end
            lastStatus = text
            pcall(function() BladeStatusLabel.Text = tostring(text) end)
        end

        local function Clean(o)
            local t = tostring(o.Text or ""):gsub("<[^>]->", "")
            return (t:gsub("^%s+", ""):gsub("%s+$", ""))
        end
        local function Shown(obj)
            local cur = obj
            while cur and cur ~= PlayerGui do
                if cur:IsA("GuiObject") and not cur.Visible then return false end
                if cur:IsA("ScreenGui") and not cur.Enabled then return false end
                cur = cur.Parent
            end
            return obj:IsA("GuiObject") and obj.AbsoluteSize.X > 0 and obj.AbsoluteSize.Y > 0
        end
        local function IsText(d) return d:IsA("TextLabel") or d:IsA("TextButton") end
        local function CenterOf(o) return o.AbsolutePosition + o.AbsoluteSize / 2 end
        local function ClickObj(obj, attempt)
            attempt = attempt or 1
            local isBtn = obj:IsA("GuiButton")
            local method = (attempt - 1) % 3 + 1
            if method == 1 and (not isBtn or type(firesignal) ~= "function") then method = 2 end
            if method == 1 then
                pcall(firesignal, obj.Activated)
                pcall(firesignal, obj.MouseButton1Click)
            elseif method == 2 then
                local gui = obj:FindFirstAncestorOfClass("ScreenGui")
                local inset = (gui and gui.IgnoreGuiInset) and Vector2.zero or GuiService:GetGuiInset()
                local pos = CenterOf(obj) + inset
                pcall(function()
                    VirtualInputManager:SendMouseMoveEvent(pos.X, pos.Y, game)
                    task.wait(0.05)
                    VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, true, game, 0)
                    task.wait(0.06)
                    VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, false, game, 0)
                end)
            else
                if isBtn then
                    pcall(function() GuiService.SelectedObject = obj end)
                    task.wait(0.1)
                    pcall(function()
                        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                        task.wait(0.05)
                        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                    end)
                    task.wait(0.1)
                    pcall(function() GuiService.SelectedObject = nil end)
                end
            end
        end
        local function ButtonFor(label)
            if label:IsA("GuiButton") then return label end
            local cur = label.Parent
            for _ = 1, 4 do
                if not cur or cur == PlayerGui then break end
                if cur:IsA("GuiButton") then return cur end
                cur = cur.Parent
            end
            return label
        end
        local function FindText(pred)
            for _, d in ipairs(PlayerGui:GetDescendants()) do
                if IsText(d) and Shown(d) and pred(Clean(d):lower()) then return d end
            end
            return nil
        end

        local function LuluNpc()
            local w = workspace:FindFirstChild("Waves")
            local n = w and w:FindFirstChild("NPCs")
            return n and n:FindFirstChild("Lulu")
        end
        local function NpcPos(npc)
            local ok, p = pcall(function()
                if npc:IsA("Model") then return npc:GetPivot().Position end
                if npc:IsA("BasePart") then return npc.Position end
                local part = npc:FindFirstChildWhichIsA("BasePart", true)
                return part and part.Position
            end)
            return ok and p or nil
        end
        local function MyRoot()
            local char = LocalPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if root and hum and hum.Health > 0 then return root end
            return nil
        end
        local function MoveTo(cf)
            local root = MyRoot()
            if not root then return end
            pcall(function() LocalPlayer:RequestStreamAroundAsync(cf.Position, 0.5) end)
            local dist = (root.Position - cf.Position).Magnitude
            local t = math.clamp(dist / 900, 0.15, 6)
            local ok, tw = pcall(function()
                return game:GetService("TweenService"):Create(root, TweenInfo.new(t, Enum.EasingStyle.Linear), { CFrame = cf })
            end)
            if not ok or not tw then pcall(function() root.CFrame = cf end) return end
            local vel = game:GetService("RunService").Heartbeat:Connect(function()
                pcall(function() root.AssemblyLinearVelocity = Vector3.zero end)
            end)
            tw:Play()
            local t0 = os.clock()
            while os.clock() - t0 < t + 0.3 and tw.PlaybackState == Enum.PlaybackState.Playing and Alive() do task.wait() end
            pcall(function() tw:Cancel() end)
            vel:Disconnect()
            pcall(function() root.CFrame = cf end)
        end
        local function TapKey(key, hold)
            pcall(function() VirtualInputManager:SendKeyEvent(true, key, false, game) end)
            task.wait(hold or 0.15)
            pcall(function() VirtualInputManager:SendKeyEvent(false, key, false, game) end)
        end

        local function UpgradeAllLabel()
            return FindText(function(t) return t == "upgrade all" end)
        end
        local function PanelScope()
            local lbl = UpgradeAllLabel()
            return lbl and (lbl:FindFirstAncestorOfClass("ScreenGui") or PlayerGui) or nil
        end
        local function CloseEquipment()
            for _ = 1, 3 do
                local scope = PanelScope()
                if not scope then break end
                local vp = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1920, 1080)
                local best, bestScore = nil, math.huge
                for _, d in ipairs(scope:GetDescendants()) do
                    if d:IsA("GuiButton") and Shown(d) then
                        local c = CenterOf(d)
                        local txt = d:IsA("TextButton") and Clean(d):upper() or ""
                        if txt == "X" or (c.Y < 120 and c.X > vp.X - 160 and d.AbsoluteSize.X < 120) then
                            local score = (vp.X - c.X) + c.Y
                            if score < bestScore then best, bestScore = d, score end
                        end
                    end
                end
                if best then ClickObj(best, 1) end
                task.wait(0.6)
                if not PanelScope() then break end
            end
            local bye = FindText(function(t) return t == "bye" or t == "goodbye" end)
            if bye then ClickObj(ButtonFor(bye), 1) task.wait(0.3) end
        end
        local function OpenEquipment()
            if PanelScope() then return true end
            local npc = LuluNpc()
            local pos = npc and NpcPos(npc)
            if not pos then SetStatus("Lulu not found (not in wave mode?)") return false end
            for attempt = 1, 3 do
                if not MyRoot() then return false end
                SetStatus(("Going to Lulu (%d/3)"):format(attempt))
                MoveTo(CFrame.new(pos + Vector3.new(4, 2, 4), pos))
                task.wait(0.4)
                SetStatus("Talking to Lulu (E)")
                local prompt = npc:FindFirstChildWhichIsA("ProximityPrompt", true)
                if prompt and type(fireproximityprompt) == "function" and attempt ~= 2 then
                    pcall(fireproximityprompt, prompt)
                else
                    TapKey(Enum.KeyCode.E, (prompt and prompt.HoldDuration or 0) + 0.2)
                end
                local t0 = os.clock()
                local clicked = false
                while os.clock() - t0 < 4 do
                    task.wait(0.25)
                    if PanelScope() then return true end
                    local lbl = FindText(function(t) return t:match("^%[?e%]?%s*equipment$") ~= nil end)
                    if lbl and not clicked then
                        SetStatus("Clicking [E] Equipment")
                        ClickObj(ButtonFor(lbl), attempt)
                        clicked = true
                        t0 = os.clock() - 2
                    end
                end
            end
            SetStatus("Could not open Equipment")
            return false
        end

        local working = false
        local function SetFlag(key, value)
            Cfg[key] = value
            local ctl = Farm.Toggles and Farm.Toggles[key]
            if ctl then pcall(function() ctl.Value = value end) end
        end
        local function RunUpgrade()
            if working then return false end
            Farm.NpcAcquire("Blades")
            working = true
            local wasFarm, wasThunder = Cfg.AutoFarm, Cfg.AutoFarmThunder
            SetFlag("AutoFarm", false)
            SetFlag("AutoFarmThunder", false)
            local root0 = MyRoot()
            local back = root0 and root0.CFrame
            local ok, err = pcall(function()
                if not OpenEquipment() then error("open failed", 0) end
                task.wait(0.6)
                for attempt = 1, 2 do
                    local lbl = UpgradeAllLabel()
                    if not lbl then error("UPGRADE ALL button not found", 0) end
                    SetStatus(("Pressing UPGRADE ALL (%d/2)"):format(attempt))
                    ClickObj(ButtonFor(lbl), attempt)
                    task.wait(1)
                end
                SetStatus("Done: pressed UPGRADE ALL")
            end)
            if not ok and err ~= "open failed" then
                SetStatus("Error: " .. tostring(err))
                warn("[Aotr:Update[5]] Auto Upgrade Blades error: " .. tostring(err))
            end
            pcall(CloseEquipment)
            local root = MyRoot()
            if root and back then MoveTo(back) end
            if wasFarm then SetFlag("AutoFarm", true) end
            if wasThunder then SetFlag("AutoFarmThunder", true) end
            working = false
            Farm.NpcRelease()
            return ok
        end

        local NowRow = BladeForm:Row()
        NowRow:Left():TitleStack({ Title = "Upgrade Now", Subtitle = "Visit Lulu and press UPGRADE ALL right now." })
        local NowBtn = NowRow:Right():Button({ Label = "Upgrade", Callback = function() end })
        BindButton(NowBtn, function()
            if not Farm.CanUseHere() then SetStatus("Not in a match") return end
            RunUpgrade()
        end)
        if SH.DEV then
        local DbgRow = BladeForm:Row()
        DbgRow:Left():TitleStack({ Title = "Scan Equipment (Debug)", Subtitle = "With the Equipment window open: prints every visible text/button to the F9 console." })
        local DbgBtn = DbgRow:Right():Button({ Label = "Scan", Callback = function() end })
        BindButton(DbgBtn, function()
            local scope = PanelScope()
            if not scope then SetStatus("Open the Equipment window first") return end
            local n = 0
            for _, d in ipairs(scope:GetDescendants()) do
                if IsText(d) and Shown(d) then
                    n += 1
                    print(("[AotrUpdate5][Blades] %s | %q | %s"):format(d.ClassName, Clean(d), d:GetFullName()))
                end
            end
            SetStatus(("Scanned %d texts (see F9)"):format(n))
        end)
        end

        local waveLabel, scanAt, lastWaveKnown = nil, 0, nil
        local function WaveKey()
            if not (waveLabel and waveLabel.Parent) then
                waveLabel = nil
                if os.clock() - scanAt < 2 then return lastWaveKnown end
                scanAt = os.clock()
                for _, d in ipairs(PlayerGui:GetDescendants()) do
                    if IsText(d) and Clean(d):lower():match("^waves cleared%s*%[%d+%s*/%s*%d+%]") then waveLabel = d break end
                end
            end
            if not waveLabel then return lastWaveKnown end
            local a = Clean(waveLabel):match("%[(%d+)%s*/")
            local v = a and tonumber(a) or nil
            if v then lastWaveKnown = v end
            return v or lastWaveKnown
        end
        task.spawn(function()
            local doneWave, fails, nextTry = -1, 0, 0
            while Alive() do
                task.wait(1)
                if not Cfg.AutoUpgradeBlades then
                    if not working then SetStatus("Off") end
                    doneWave, fails = -1, 0
                elseif not Farm.CanUseHere() or not LuluNpc() then
                    SetStatus("Waiting for wave mode")
                elseif Farm.FailSafeActive then
                    SetStatus("Paused (Fail Safe is losing on purpose)")
                elseif not working and not Farm.Refilling and os.clock() >= nextTry then
                    local wave = WaveKey() or 0
                    local goldWhy = wave ~= doneWave and Farm.GoldBlock("Blades")
                    if goldWhy then
                        SetStatus(("Wave %d: %s"):format(wave, goldWhy))
                    elseif wave ~= doneWave then
                        SetStatus(("Wave %d: upgrading blades..."):format(wave))
                        local ok = RunUpgrade()
                        if ok then
                            doneWave, fails = wave, 0
                        else
                            fails += 1
                            nextTry = os.clock() + 6
                            if fails >= 3 then doneWave, fails = wave, 0 end
                        end
                    else
                        SetStatus(("Wave %d done. Waiting for next wave"):format(wave))
                    end
                end
            end
        end)
    end)
    SH.Guard("auto-roll-blessings", function()
        -- ============================================================
        -- ============================================================
        local ROLL_MIN_GOLD = 2000
        local MAX_ROLLS = 40
        local SETTLE = 3.5
        local RollSection = WaveModeTab:PageSection({
            Title = "🎰 Auto Roll Blessings [ Roll ]",
            Subtitle = "Goes to Roll and spins the Blessings machine whenever you have 2,000 gold or more."
        })
        local RollForm = RollSection:Form()
        local ToggleRow = RollForm:Row()
        ToggleRow:Left():TitleStack({ Title = "Auto Roll Blessings", Subtitle = "Rolls (2,000 gold each) while your gold is 2,000 or more, then flies back to your spot." })
        UiSync.Link(ToggleRow:Right():Toggle({
            Value = Cfg.AutoRollBlessing,
            ValueChanged = function(self, value)
                Cfg.AutoRollBlessing = value and true or false
                Save()
            end
        }), Cfg, "AutoRollBlessing")
        local StopRow = RollForm:Row()
        StopRow:Left():TitleStack({ Title = "Stop When 3 Cards Match", Subtitle = "Stops rolling (and turns Auto Roll off) as soon as the machine lands 3 matching cards and shows a reward." })
        UiSync.Link(StopRow:Right():Toggle({
            Value = Cfg.RollStopOnMatch,
            ValueChanged = function(self, value)
                Cfg.RollStopOnMatch = value and true or false
                Save()
            end
        }), Cfg, "RollStopOnMatch")
        local StatusRow = RollForm:Row()
        StatusRow:Left():TitleStack({ Title = "Roll Status", Subtitle = "Current action..." })
        local RollStatusLabel = StatusRow:Right():Label({ Text = "Off" })
        local lastStatus = nil
        local function SetStatus(text)
            if text == lastStatus then return end
            lastStatus = text
            pcall(function() RollStatusLabel.Text = tostring(text) end)
        end

        local function Clean(o)
            local t = tostring(o.Text or ""):gsub("<[^>]->", "")
            return (t:gsub("^%s+", ""):gsub("%s+$", ""))
        end
        local function Shown(obj)
            local cur = obj
            while cur and cur ~= PlayerGui do
                if cur:IsA("GuiObject") and not cur.Visible then return false end
                if cur:IsA("ScreenGui") and not cur.Enabled then return false end
                cur = cur.Parent
            end
            return obj:IsA("GuiObject") and obj.AbsoluteSize.X > 0 and obj.AbsoluteSize.Y > 0
        end
        local function IsText(d) return d:IsA("TextLabel") or d:IsA("TextButton") end
        local function CenterOf(o) return o.AbsolutePosition + o.AbsoluteSize / 2 end
        local function ClickObj(obj, attempt)
            attempt = attempt or 1
            local isBtn = obj:IsA("GuiButton")
            local method = (attempt - 1) % 3 + 1
            if method == 1 and (not isBtn or type(firesignal) ~= "function") then method = 2 end
            if method == 1 then
                pcall(firesignal, obj.Activated)
                pcall(firesignal, obj.MouseButton1Click)
            elseif method == 2 then
                local gui = obj:FindFirstAncestorOfClass("ScreenGui")
                local inset = (gui and gui.IgnoreGuiInset) and Vector2.zero or GuiService:GetGuiInset()
                local pos = CenterOf(obj) + inset
                pcall(function()
                    VirtualInputManager:SendMouseMoveEvent(pos.X, pos.Y, game)
                    task.wait(0.05)
                    VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, true, game, 0)
                    task.wait(0.06)
                    VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, false, game, 0)
                end)
            else
                if isBtn then
                    pcall(function() GuiService.SelectedObject = obj end)
                    task.wait(0.1)
                    pcall(function()
                        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                        task.wait(0.05)
                        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                    end)
                    task.wait(0.1)
                    pcall(function() GuiService.SelectedObject = nil end)
                end
            end
        end
        local function ButtonFor(label)
            if label:IsA("GuiButton") then return label end
            local cur = label.Parent
            for _ = 1, 4 do
                if not cur or cur == PlayerGui then break end
                if cur:IsA("GuiButton") then return cur end
                cur = cur.Parent
            end
            return label
        end
        local function FindText(pred)
            for _, d in ipairs(PlayerGui:GetDescendants()) do
                if IsText(d) and Shown(d) and pred(Clean(d):lower()) then return d end
            end
            return nil
        end
        local function RollNpc()
            local w = workspace:FindFirstChild("Waves")
            local n = w and w:FindFirstChild("NPCs")
            return n and n:FindFirstChild("Roll")
        end
        local function NpcPos(npc)
            local ok, p = pcall(function()
                if npc:IsA("Model") then return npc:GetPivot().Position end
                if npc:IsA("BasePart") then return npc.Position end
                local part = npc:FindFirstChildWhichIsA("BasePart", true)
                return part and part.Position
            end)
            return ok and p or nil
        end
        local function MyRoot()
            local char = LocalPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if root and hum and hum.Health > 0 then return root end
            return nil
        end
        local function MoveTo(cf)
            local root = MyRoot()
            if not root then return end
            pcall(function() LocalPlayer:RequestStreamAroundAsync(cf.Position, 0.5) end)
            local dist = (root.Position - cf.Position).Magnitude
            local t = math.clamp(dist / 900, 0.15, 6)
            local ok, tw = pcall(function()
                return game:GetService("TweenService"):Create(root, TweenInfo.new(t, Enum.EasingStyle.Linear), { CFrame = cf })
            end)
            if not ok or not tw then pcall(function() root.CFrame = cf end) return end
            local vel = game:GetService("RunService").Heartbeat:Connect(function()
                pcall(function() root.AssemblyLinearVelocity = Vector3.zero end)
            end)
            tw:Play()
            local t0 = os.clock()
            while os.clock() - t0 < t + 0.3 and tw.PlaybackState == Enum.PlaybackState.Playing and Alive() do task.wait() end
            pcall(function() tw:Cancel() end)
            vel:Disconnect()
            pcall(function() root.CFrame = cf end)
        end
        local function TapKey(key, hold)
            pcall(function() VirtualInputManager:SendKeyEvent(true, key, false, game) end)
            task.wait(hold or 0.15)
            pcall(function() VirtualInputManager:SendKeyEvent(false, key, false, game) end)
        end

        local function ParseAmount(text)
            local num, suf = tostring(text):match("^([%d,%.]+)%s*([kKmM]?)$")
            if not num then return nil end
            local v = tonumber((num:gsub(",", "")))
            if not v then return nil end
            suf = suf:lower()
            if suf == "k" then v = v * 1000 elseif suf == "m" then v = v * 1000000 end
            return v
        end
        local GOLD_HINTS = { "gold", "coin", "money", "currenc", "cash" }
        local function HintedName(d)
            local cur = d
            for _ = 1, 5 do
                if not cur or cur == PlayerGui then break end
                local n = cur.Name:lower()
                for _, h in ipairs(GOLD_HINTS) do
                    if n:find(h, 1, true) then return true end
                end
                cur = cur.Parent
            end
            return false
        end
        local goldCache = nil
        local function ReadGold(panel)
            if goldCache and goldCache.Parent and Shown(goldCache) then
                local v = ParseAmount(Clean(goldCache))
                if v then return v end
            end
            goldCache = nil
            local best, bestScore, bestV = nil, -1, nil
            for _, d in ipairs(PlayerGui:GetDescendants()) do
                if d:IsA("TextLabel") and Shown(d) and HintedName(d) then
                    local v = ParseAmount(Clean(d))
                    if v then
                        local score = 1
                        local par = d.Parent
                        if par and par:FindFirstChildWhichIsA("ImageLabel", true) then score = 2 end
                        if score > bestScore then best, bestScore, bestV = d, score, v end
                    end
                end
            end
            if best then goldCache = best return bestV end
            if panel then
                local bestY, v2 = -math.huge, nil
                for _, d in ipairs(panel:GetDescendants()) do
                    if d:IsA("TextLabel") and Shown(d) then
                        local v = ParseAmount(Clean(d))
                        if v and d.AbsolutePosition.Y > bestY then bestY, v2 = d.AbsolutePosition.Y, v end
                    end
                end
                return v2
            end
            return nil
        end
        local function DumpNumbers()
            local n = 0
            for _, d in ipairs(PlayerGui:GetDescendants()) do
                if d:IsA("TextLabel") and Shown(d) and ParseAmount(Clean(d)) then
                    n += 1
                    if n <= 12 then print(("[AotrUpdate5][Roll] number label %q | %s"):format(Clean(d), d:GetFullName())) end
                end
            end
        end

        local function RollButton()
            return FindText(function(t) return t:match("^roll%s*%(") ~= nil end)
        end
        local function RollingLabel()
            return FindText(function(t) return t:match("^rolling") ~= nil end)
        end
        local function RollPrice()
            local lbl = RollButton()
            local inner = lbl and Clean(lbl):match("%(([%d,%.]+%s*[kKmM]?)%)")
            if not inner then return nil end
            return ParseAmount((inner:gsub("%s", "")))
        end
        local function PanelRoot()
            local title = FindText(function(t) return t == "blessings" end)
            if not title then return nil end
            local cur = title.Parent
            for _ = 1, 8 do
                if not cur or cur == PlayerGui then break end
                for _, d in ipairs(cur:GetDescendants()) do
                    if IsText(d) and Clean(d):lower():match("^roll") then return cur end
                end
                cur = cur.Parent
            end
            return title:FindFirstAncestorOfClass("ScreenGui") or PlayerGui
        end
        local function ClosePanel()
            for attempt = 1, 5 do
                local root = PanelRoot()
                if not root then break end
                if not root:IsA("GuiObject") then
                    local title = FindText(function(t) return t == "blessings" end)
                    local cur = title
                    while cur and cur ~= PlayerGui do
                        if cur:IsA("GuiObject") and cur.AbsoluteSize.X >= 250 and cur.AbsoluteSize.Y >= 300 then root = cur break end
                        cur = cur.Parent
                    end
                end
                local best, bestScore = nil, math.huge
                local rp, rs
                if root:IsA("GuiObject") then
                    rp, rs = root.AbsolutePosition, root.AbsoluteSize
                else
                    rp = Vector2.zero
                    rs = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1920, 1080)
                end
                for _, d in ipairs(root:GetDescendants()) do
                    if d:IsA("GuiButton") and Shown(d) then
                        local c = CenterOf(d)
                        local txt = d:IsA("TextButton") and Clean(d):upper() or ""
                        local nm = d.Name:lower()
                        local nameHit = nm:find("close", 1, true) or nm:find("exit", 1, true)
                        local topRight = c.X > rp.X + rs.X - 100 and c.Y < rp.Y + 100 and d.AbsoluteSize.X < 120
                        if nameHit or txt == "X" or topRight then
                            local score = (rp.X + rs.X - c.X) + (c.Y - rp.Y)
                            if nameHit then score = score - 10000 end
                            if score < bestScore then best, bestScore = d, score end
                        end
                    end
                end
                if best then
                    SetStatus("Closing the Blessings window (X)")
                    ClickObj(best, attempt)
                end
                task.wait(0.6)
                if not PanelRoot() then break end
            end
        end
        local function OpenPanel()
            if PanelRoot() then return true end
            local npc = RollNpc()
            local pos = npc and NpcPos(npc)
            if not pos then SetStatus("Roll NPC not found (not in wave mode?)") return false end
            for attempt = 1, 3 do
                if not MyRoot() then return false end
                SetStatus(("Going to Roll (%d/3)"):format(attempt))
                MoveTo(CFrame.new(pos + Vector3.new(4, 2, 4), pos))
                task.wait(0.4)
                SetStatus("Pressing E on the machine")
                local prompt = npc:FindFirstChildWhichIsA("ProximityPrompt", true)
                if prompt and type(fireproximityprompt) == "function" and attempt ~= 2 then
                    pcall(fireproximityprompt, prompt)
                else
                    TapKey(Enum.KeyCode.E, (prompt and prompt.HoldDuration or 0) + 0.2)
                end
                local t0 = os.clock()
                local clicked = false
                while os.clock() - t0 < 4 do
                    task.wait(0.25)
                    if PanelRoot() then return true end
                    local lbl = FindText(function(t) return t:match("^%[?e%]?%s*roll") ~= nil or t:match("^%[?e%]?%s*blessing") ~= nil end)
                    if lbl and not clicked then
                        SetStatus("Clicking the dialogue button")
                        ClickObj(ButtonFor(lbl), attempt)
                        clicked = true
                        t0 = os.clock() - 2
                    end
                end
            end
            SetStatus("Could not open the Blessings window")
            return false
        end

        local rewardLbl = nil
        local function RewardState()
            if rewardLbl and rewardLbl.Parent then
                local t = Clean(rewardLbl)
                if t:lower():match("^no reward") then return "none" end
                if t ~= "" and Shown(rewardLbl) then return "reward", t end
                return nil
            end
            rewardLbl = nil
            local l = FindText(function(t) return t:match("^no reward") ~= nil end)
            if l then rewardLbl = l return "none" end
            return nil
        end
        local function RollLoop()
            local rolls, fails = 0, 0
            rewardLbl = nil
            for _ = 1, MAX_ROLLS do
                if not (Alive() and Cfg.AutoRollBlessing) then return rolls, "off" end
                local root = PanelRoot()
                if not root then return rolls, "closed" end
                local gold = ReadGold(root)
                if gold == nil then return rolls, "nogold" end
                local need = math.max(RollPrice() or 0, ROLL_MIN_GOLD)
                if gold < need then return rolls, "poor" end
                local lbl = RollButton()
                if not lbl then
                    local waited = 0
                    while waited < 10 and Alive() and Cfg.AutoRollBlessing and PanelRoot() and not RollButton() do
                        task.wait(0.5)
                        waited += 0.5
                    end
                    lbl = RollButton()
                    if not lbl then return rolls, (RollingLabel() and "stuck" or "nobutton") end
                    gold = ReadGold(PanelRoot()) or gold
                    if gold < need then return rolls, "poor" end
                end
                if Cfg.RollStopOnMatch then
                    local st, txt = RewardState()
                    if rolls > 0 and st == "reward" then
                        task.wait(0.8)
                        local st2, txt2 = RewardState()
                        if st2 == "reward" then
                            print("[AotrUpdate5][Roll] 3 cards matched, reward text: " .. tostring(txt2))
                            return rolls, "match"
                        end
                    end
                end
                SetStatus(("Rolling... #%d (gold %d)"):format(rolls + 1, gold))
                ClickObj(ButtonFor(lbl), fails + 1)
                local t0, spent = os.clock(), false
                while os.clock() - t0 < 4 do
                    task.wait(0.25)
                    local g = ReadGold(PanelRoot())
                    if g and g < gold then spent = true break end
                end
                if spent then
                    rolls += 1
                    fails = 0
                    task.wait(SETTLE)
                else
                    fails += 1
                    if fails >= 3 then return rolls, "stuck" end
                    task.wait(1)
                end
            end
            return rolls, "limit"
        end

        local rolling = false
        local function SetFlag(key, value)
            Cfg[key] = value
            local ctl = Farm.Toggles and Farm.Toggles[key]
            if ctl then pcall(function() ctl.Value = value end) end
        end
        local function RunRoll()
            if rolling then return false end
            Farm.NpcAcquire("Blessing")
            rolling = true
            local wasFarm, wasThunder = Cfg.AutoFarm, Cfg.AutoFarmThunder
            SetFlag("AutoFarm", false)
            SetFlag("AutoFarmThunder", false)
            local root0 = MyRoot()
            local back = root0 and root0.CFrame
            local rolls, why = 0, nil
            local ok, err = pcall(function()
                if not OpenPanel() then error("open failed", 0) end
                task.wait(0.6)
                rolls, why = RollLoop()
                if why == "match" then
                    SetStatus(("Done: 3 cards matched after %d roll(s). Auto Roll stopped."):format(rolls))
                    SetFlag("AutoRollBlessing", false)
                    Save()
                    pcall(UiSync.Refresh)
                elseif why == "poor" then SetStatus(("Done: rolled %d time(s), gold is below 2,000"):format(rolls))
                elseif why == "stuck" then SetStatus(("Stopped: ROLL did not respond (rolled %d)"):format(rolls))
                elseif why == "nogold" then SetStatus("Stopped: can't read your gold (see F9)")
                elseif why == "nobutton" then SetStatus("Stopped: ROLL button not found")
                else SetStatus(("Done: rolled %d time(s)"):format(rolls)) end
            end)
            if not ok and err ~= "open failed" then
                SetStatus("Error: " .. tostring(err))
                warn("[Aotr:Update[5]] Auto Roll error: " .. tostring(err))
            end
            pcall(ClosePanel)
            local root = MyRoot()
            if root and back then MoveTo(back) end
            if wasFarm then SetFlag("AutoFarm", true) end
            if wasThunder then SetFlag("AutoFarmThunder", true) end
            rolling = false
            Farm.NpcRelease()
            return ok, rolls, why
        end

        task.spawn(function()
            local fails, nextTry, lastDump = 0, 0, 0
            while Alive() do
                task.wait(1)
                if not Cfg.AutoRollBlessing then
                    if not rolling then SetStatus("Off") end
                    fails = 0
                elseif not Farm.CanUseHere() or not RollNpc() then
                    SetStatus("Waiting for wave mode")
                elseif Farm.FailSafeActive then
                    SetStatus("Paused (Fail Safe is losing on purpose)")
                elseif not rolling and not Farm.Refilling and os.clock() >= nextTry and not Farm.RevisitBlock("Blessing") then
                    local gold = ReadGold(nil)
                    if gold == nil then
                        SetStatus("Can't read your gold (see F9)")
                        if os.clock() - lastDump > 30 then
                            lastDump = os.clock()
                            DumpNumbers()
                        end
                    elseif gold < math.max(ROLL_MIN_GOLD, Cfg.WaveMinGold or 0) then
                        SetStatus(("Waiting for gold (%d / %d)"):format(gold, math.max(ROLL_MIN_GOLD, Cfg.WaveMinGold or 0)))
                    else
                        local ok, rolls, why = RunRoll()
                        if ok and ((rolls or 0) > 0 or why == "poor") then
                            fails = 0
                            nextTry = os.clock() + 3
                        else
                            fails += 1
                            nextTry = os.clock() + 8
                            if fails >= 3 then
                                fails = 0
                                nextTry = os.clock() + 60
                            end
                        end
                    end
                end
            end
        end)
    end)
    task.delay(2, function() initializing = false end)
end
do
    local SCAN_INTERVAL = 2.0
    local CHECK_INTERVAL = 0.5
    local PRESS_GAP = 3
    local MAX_PRESSES = 3
    local function CleanText(o)
        local t = (o.Text or ""):gsub("<[^>]->", "")
        t = t:gsub("^%s+", ""):gsub("%s+$", "")
        return t
    end
    local function IsShownGui(obj)
        local cur = obj
        while cur and cur ~= PlayerGui do
            if cur:IsA("GuiObject") and not cur.Visible then return false end
            if cur:IsA("ScreenGui") and not cur.Enabled then return false end
            cur = cur.Parent
        end
        return obj:IsA("GuiObject") and obj.AbsoluteSize.X > 0 and obj.AbsoluteSize.Y > 0
    end
    local function FindReadyLabel(title)
        local cur = title.Parent
        for _ = 1, 6 do
            if not cur or cur == PlayerGui then break end
            for _, d in ipairs(cur:GetDescendants()) do
                if (d:IsA("TextLabel") or d:IsA("TextButton")) and CleanText(d):upper() == "READY" and IsShownGui(d) then
                    return d
                end
            end
            cur = cur.Parent
        end
        return nil
    end
    local function FindCountLabel(title, ready)
        local box = title.Parent
        while box and box ~= PlayerGui and not ready:IsDescendantOf(box) do box = box.Parent end
        if not box or box == PlayerGui then return nil end
        for _, d in ipairs(box:GetDescendants()) do
            if d:IsA("TextLabel") and CleanText(d):match("^%d+%s*/%s*%d+$") and IsShownGui(d) then
                return d
            end
        end
        return nil
    end
    local function ClickableFor(label)
        if label:IsA("GuiButton") then return label end
        local cur = label.Parent
        for _ = 1, 3 do
            if not cur or cur == PlayerGui then break end
            if cur:IsA("GuiButton") then return cur end
            cur = cur.Parent
        end
        local c = label.AbsolutePosition + label.AbsoluteSize / 2
        local best, bestArea = nil, math.huge
        for _, d in ipairs(PlayerGui:GetDescendants()) do
            if d:IsA("GuiButton") and IsShownGui(d) then
                local pos, size = d.AbsolutePosition, d.AbsoluteSize
                if c.X >= pos.X and c.X <= pos.X + size.X and c.Y >= pos.Y and c.Y <= pos.Y + size.Y then
                    local area = size.X * size.Y
                    if area < bestArea then best, bestArea = d, area end
                end
            end
        end
        return best
    end
    local function Press(btn, attempt)
        local method = (attempt - 1) % 3 + 1
        if method == 1 and type(firesignal) ~= "function" then method = 2 end
        if method == 1 then
            pcall(firesignal, btn.Activated)
            pcall(firesignal, btn.MouseButton1Click)
        elseif method == 2 then
            local gui = btn:FindFirstAncestorOfClass("ScreenGui")
            local inset = (gui and gui.IgnoreGuiInset) and Vector2.zero or GuiService:GetGuiInset()
            local pos = btn.AbsolutePosition + btn.AbsoluteSize / 2 + inset
            pcall(function()
                VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, true, game, 0)
                task.wait(0.05)
                VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, false, game, 0)
            end)
        else
            pcall(function() GuiService.SelectedObject = btn end)
            task.wait(0.1)
            pcall(function()
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                task.wait(0.05)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
            end)
            task.wait(0.1)
            pcall(function() GuiService.SelectedObject = nil end)
        end
        SH.dbg("[AotrUpdate5] Auto Ready pressed, method", method)
    end
    local function StartVoter(titleText, cfgKey)
        local titleLabel, scanAt = nil, 0
        local function FindTitle()
            if titleLabel and titleLabel.Parent then
                return IsShownGui(titleLabel) and titleLabel or nil
            end
            titleLabel = nil
            if os.clock() - scanAt < SCAN_INTERVAL then return nil end
            scanAt = os.clock()
            local n = 0
            for _, d in ipairs(PlayerGui:GetDescendants()) do
                n += 1
                if n % 800 == 0 then task.wait() end
                if (d:IsA("TextLabel") or d:IsA("TextButton")) and CleanText(d):upper() == titleText then
                    titleLabel = d
                    return IsShownGui(d) and d or nil
                end
            end
            return nil
        end
        task.spawn(function()
            local presses, lastPress, countBefore, voted = 0, 0, nil, false
            local function Reset() presses, lastPress, countBefore, voted = 0, 0, nil, false end
            while Alive() do
                task.wait(CHECK_INTERVAL)
                if not (Cfg[cfgKey] and SH.PlayOn()) or not Farm.CanUseHere() then
                    Reset()
                else
                    local title = FindTitle()
                    if not title then
                        Reset()
                    else
                        local label = FindReadyLabel(title)
                        if label and not voted then
                            local countLabel = FindCountLabel(title, label)
                            local countText = countLabel and CleanText(countLabel) or nil
                            local a, b
                            if countText then a, b = countText:match("^(%d+)%s*/%s*(%d+)$") end
                            if a and b and tonumber(a) >= tonumber(b) then
                                voted = true
                            elseif presses > 0 and countText and countBefore and countText ~= countBefore then
                                voted = true
                            elseif os.clock() - lastPress >= PRESS_GAP and presses < (countText and MAX_PRESSES or 1) then
                                local btn = ClickableFor(label)
                                if btn then
                                    presses += 1
                                    lastPress = os.clock()
                                    countBefore = countText
                                    Press(btn, presses)
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
    StartVoter("VOTE START", "AutoReady")
    StartVoter("VOTE SKIP", "AutoVoteSkip")
    local waveLabel, waveScanAt = nil, 0
    local function WavesCleared()
        if not (waveLabel and waveLabel.Parent) then
            waveLabel = nil
            if os.clock() - waveScanAt < SCAN_INTERVAL then return nil end
            waveScanAt = os.clock()
            local n = 0
            for _, d in ipairs(PlayerGui:GetDescendants()) do
                n += 1
                if n % 800 == 0 then task.wait() end
                if (d:IsA("TextLabel") or d:IsA("TextButton")) and CleanText(d):lower():match("^waves cleared%s*%[%d+%s*/%s*%d+%]") then
                    waveLabel = d
                    break
                end
            end
        end
        if not waveLabel or not IsShownGui(waveLabel) then return nil end
        local a = CleanText(waveLabel):match("%[(%d+)%s*/")
        return a and tonumber(a) or nil
    end
    local postRemote = nil
    local function LeaveMatch()
        if not postRemote or not postRemote.Parent then
            local ok, r = pcall(function()
                return game:GetService("ReplicatedStorage").Assets.Remotes:WaitForChild("POST", 5)
            end)
            postRemote = ok and r or nil
        end
        if not postRemote then return false end
        return (pcall(function() postRemote:FireServer("Functions", "Teleport") end))
    end
    task.spawn(function()
        local firedAt = nil
        while Alive() do
            task.wait(1)
            if not Cfg.AutoLeaveAtWave or not Farm.CanUseHere() then
                firedAt = nil
            else
                local cleared = WavesCleared()
                if not cleared then
                    firedAt = nil
                elseif cleared >= (Cfg.LeaveAtWave or 10) and (not firedAt or os.clock() - firedAt > 15) then
                    firedAt = os.clock()
                    SH.dbg("[AotrUpdate5] Leave At Wave: waves cleared", cleared)
                    LeaveMatch()
                end
            end
        end
    end)
end
local MiscCategory = Cascade.Components.Section(Window, {
    Title = "Misc",
    Disclosure = false
})
local WebhookTab = MiscCategory:Tab({
    Title = "Webhook",
    Icon = Icon("paperplaneFill", "paperplane", "bellFill"),
})
-- ============================================================
--
--        WebhookTab:PageSection({
--            Title = "🔔 Webhook",
--            Subtitle = "Core features and settings"
--        })
--
-- ============================================================
SH.Guard("webhook", function()
    local HttpService = game:GetService("HttpService")
    local TAB = WebhookTab

    local FILE = "Webhook"
    local SEND_DELAY = 1.2
    local SESSION_GAP = 600

    local W = {
        Enabled = false,
        Url = "",
        SendResultTexts = true,
        Start = 0, LastSeen = 0, Matches = 0, Gold = 0, Gems = 0, Exp = 0,
        CurGold = 0, CurGems = 0,
    }
    SettingsStore.Restore(W, SettingsStore.Load(FILE))

    local function NewSession()
        W.Start, W.LastSeen, W.Matches, W.Gold, W.Gems, W.Exp = os.time(), os.time(), 0, 0, 0, 0
    end
    if W.Start == 0 or os.time() - W.LastSeen > SESSION_GAP then NewSession() end
    local function SaveW()
        W.LastSeen = os.time()
        SettingsStore.Write(FILE, W)
    end

    local PREFIXES = {
        "^https://discord%.com/api/webhooks/",
        "^https://discordapp%.com/api/webhooks/",
        "^https://canary%.discord%.com/api/webhooks/",
        "^https://ptb%.discord%.com/api/webhooks/",
    }
    local function ValidUrl(url)
        url = tostring(url or "")
        for _, p in ipairs(PREFIXES) do
            if url:match(p) then return true end
        end
        return false
    end
    local function GetRequest()
        return (syn and syn.request) or http_request or request or (fluxus and fluxus.request)
    end

    local Status = function() end

    local function ParseNum(s)
        if s == nil then return nil end
        s = tostring(s):gsub(",", ""):gsub("%s", "")
        local n, suf = s:match("^([%d%.]+)([KkMmBb]?)$")
        if not n then return nil end
        n = tonumber(n)
        if not n then return nil end
        local mult = { k = 1e3, m = 1e6, b = 1e9 }
        return n * (mult[(suf or ""):lower()] or 1)
    end
    local function FieldText(key)
        for _, f in ipairs(FIELDS) do
            if f.key == key then return f.last end
        end
        return nil
    end
    local GOLD_PATHS = { "Interface.Topbar.Main.Currencies.Gold.Amount", "Interface.HUD.Main.Top.2.Gold.Title" }
    local GEM_PATHS = { "Interface.Topbar.Main.Currencies.Gems.Amount" }
    local function ReadLive(paths)
        for _, p in ipairs(paths) do
            local ok, t = pcall(ReadGui, p)
            local v = ok and ParseNum(t)
            if v and v > 0 then return v end
        end
        return nil
    end
    local function Snapshot()
        local gold, gems = ReadLive(GOLD_PATHS), ReadLive(GEM_PATHS)
        if gold then W.CurGold = gold
        elseif W.CurGold <= 0 then W.CurGold = ParseNum(FieldText("Gold")) or 0 end
        if gems then W.CurGems = gems
        elseif W.CurGems <= 0 then W.CurGems = ParseNum(FieldText("Gems")) or 0 end
        return { gold = gold, gems = gems }
    end
    local function Clock(sec)
        sec = math.max(0, math.floor(sec))
        return ("%02d:%02d:%02d"):format(math.floor(sec / 3600), math.floor(sec % 3600 / 60), sec % 60)
    end
    local function CleanText(o)
        local t = tostring(o.Text or ""):gsub("<[^>]->", "")
        return (t:gsub("^%s+", ""):gsub("%s+$", ""))
    end

    local STAT_DEFS = {
        { "TIME TAKEN", "Time Taken" },
        { "DAMAGE DEALT", "Damage Dealt" },
        { "TITANS KILLED", "Titans Killed" },
        { "CRITICAL HITS", "Critical Hits" },
    }
    local function IsValueText(t)
        return t:match("^[%d,%.]+$") or t:match("^%d+:%d+$") or t:match("^[%d,%.]+[KkMmBb]$")
    end
    local GENERIC = { amount = true, quantity = true, count = true, title = true, label = true, frame = true,
        textlabel = true, text = true, value = true, stack = true, main = true, content = true, holder = true, item = true }
    -- [aotr] Raid support: the Raid result screen says "RAID COMPLETED" instead of "MISSION COMPLETED"
    local RESULT_TITLES = { ["MISSION COMPLETED"] = true, ["RAID COMPLETED"] = true }
    local rTitle, rScanAt = nil, 0
    local function ResultShown()
        if Farm.CompleteScreenShown and Farm.CompleteScreenShown() then return true end
        if rTitle and rTitle.Parent then return IsShown(rTitle) and true or false end
        rTitle = nil
        if os.clock() - rScanAt < 1 then return false end
        rScanAt = os.clock()
        local n = 0
        for _, d in ipairs(PlayerGui:GetDescendants()) do
            n += 1
            if n % 800 == 0 then task.wait() end
            if (d:IsA("TextLabel") or d:IsA("TextButton")) and RESULT_TITLES[CleanText(d):upper()] then
                rTitle = d
                return IsShown(d) and true or false
            end
        end
        return false
    end
    -- [aotr] Reward names: look at attributes, name values, sibling texts, frame / icon names (not just the frame name)
    local NAME_SKIP = { icon = true, image = true, img = true, slot = true, template = true, reward = true, rewards = true,
        obtained = true, itemframe = true, bg = true, background = true, border = true, glow = true, shadow = true,
        scrolling = true, scroll = true, list = true, grid = true, container = true, layout = true, rarity = true, star = true, stars = true }
    local function Pretty(n)
        n = tostring(n):gsub("_", " "):gsub("(%l)(%u)", "%1 %2"):gsub("%s+", " ")
        return (n:gsub("^%s+", ""):gsub("%s+$", ""))
    end
    local function GoodName(n)
        local l = tostring(n):lower():gsub("%d+$", "")
        if l == "" or GENERIC[l] or NAME_SKIP[l] then return false end
        if l:find("^ui") or l:find("layout") or l:find("padding") or l:find("corner") or l:find("stroke") or l:find("gradient") then return false end
        return true
    end
    local function ItemName(lbl, root)
        local a = lbl
        for _ = 1, 4 do
            if not a or a == root then break end
            for _, key in ipairs({ "ItemName", "DisplayName", "Name", "Title", "Item", "ItemId", "Id" }) do
                local v
                pcall(function() v = a:GetAttribute(key) end)
                if type(v) == "string" and v ~= "" then return Pretty(v) end
            end
            for _, c in ipairs(a:GetChildren()) do
                if c:IsA("StringValue") and c.Value ~= "" then
                    local cn = c.Name:lower()
                    if cn:find("name") or cn:find("item") or cn:find("title") then return Pretty(c.Value) end
                end
                if c:IsA("TextLabel") and c ~= lbl then
                    local t = CleanText(c)
                    if t ~= "" and #t <= 40 and not IsValueText(t) and not t:match("^[IVX]+$") then return t end
                end
            end
            if a ~= lbl and GoodName(a.Name) then return Pretty(a.Name) end
            if a ~= lbl then
                for _, c in ipairs(a:GetChildren()) do
                    if (c:IsA("ImageLabel") or c:IsA("ImageButton")) and GoodName(c.Name) then return Pretty(c.Name) end
                end
            end
            a = a.Parent
        end
        return nil
    end
    local function ReadResult()
        local title, n = nil, 0
        for _, d in ipairs(PlayerGui:GetDescendants()) do
            n += 1
            if n % 800 == 0 then task.wait() end
            if (d:IsA("TextLabel") or d:IsA("TextButton")) and RESULT_TITLES[CleanText(d):upper()] and IsShown(d) then
                title = d
                break
            end
        end
        if not title then return nil end
        local root = title
        for _ = 1, 4 do
            if root.Parent and root.Parent ~= PlayerGui then root = root.Parent end
        end

        local labels = {}
        for _, d in ipairs(root:GetDescendants()) do
            if d:IsA("TextLabel") and IsShown(d) then
                labels[#labels + 1] = { obj = d, text = CleanText(d) }
            end
        end

        local stats, used = {}, {}
        for _, def in ipairs(STAT_DEFS) do
            for _, e in ipairs(labels) do
                if e.text:upper() == def[1] then
                    local a = e.obj.Parent
                    for _ = 1, 3 do
                        if not a or a == root.Parent then break end
                        local found
                        for _, o in ipairs(a:GetDescendants()) do
                            if o ~= e.obj and o:IsA("TextLabel") and IsShown(o) and not used[o] and IsValueText(CleanText(o)) then
                                found = o
                                break
                            end
                        end
                        if found then
                            used[found] = true
                            stats[#stats + 1] = { name = def[2], text = CleanText(found) }
                            break
                        end
                        a = a.Parent
                    end
                    break
                end
            end
        end

        local cands = {}
        for _, e in ipairs(labels) do
            if not used[e.obj] and (IsValueText(e.text) or e.text:match("^[IVX]+$")) then
                local names, best = {}, nil
                local a = e.obj
                for _ = 1, 4 do
                    if not a or a == root then break end
                    names[#names + 1] = a.Name:lower()
                    if not best and a ~= e.obj and not GENERIC[a.Name:lower()] then best = a.Name end
                    if a ~= e.obj then
                        for _, c in ipairs(a:GetChildren()) do
                            if c:IsA("ImageLabel") or c:IsA("ImageButton") then names[#names + 1] = c.Name:lower() end
                        end
                    end
                    a = a.Parent
                end
                local p = e.obj.AbsolutePosition
                local nm = ItemName(e.obj, root)
                if not nm and not (e.text:match("^[IVX]+$")) then
                    -- [aotr] could not find a name: print the path to F9 so it can be added
                    local path, q = {}, e.obj
                    for _ = 1, 5 do
                        if not q or q == root then break end
                        path[#path + 1] = q.ClassName .. ":" .. q.Name
                        q = q.Parent
                    end
                    print("[Aotr:Update[5]] Reward name not found for '" .. e.text .. "': " .. table.concat(path, " < "))
                end
                cands[#cands + 1] = { text = e.text, names = table.concat(names, " "), best = best, name = nm, x = p.X, y = p.Y }
            end
        end
        table.sort(cands, function(a, b)
            if math.abs(a.y - b.y) > 20 then return a.y < b.y end
            return a.x < b.x
        end)

        local items, got = {}, {}
        for _, c in ipairs(cands) do
            local kind = "other"
            if c.names:find("gold") or c.names:find("coin") then kind = "gold"
            elseif c.names:find("exp") then kind = "exp"
            elseif c.names:find("gem") then kind = "gems" end
            if kind ~= "other" then got[kind] = true end
            items[#items + 1] = { kind = kind, name = c.name or (c.best and Pretty(c.best)) or "Item", text = c.text, num = ParseNum(c.text) }
        end
        if not got.exp and not got.gold and #items >= 2 and items[1].num and items[2].num then
            items[1].kind, items[2].kind = "exp", "gold"
        end
        local raw, seenRaw = {}, {}
        for _, e in ipairs(labels) do
            local up = e.text:upper()
            if #e.text >= 1 and #e.text <= 40 and not seenRaw[e.text] and up ~= "MISSION COMPLETED" and up ~= "RAID COMPLETED" and up ~= "LEAVE"
                and up ~= "MODIFIERS" and up ~= "STATS" and up ~= "OBTAINED" and not up:match("^STARTING") then
                seenRaw[e.text] = true
                raw[#raw + 1] = e.text
            end
        end
        return { stats = stats, items = items, raw = raw }
    end

    local function BuildEmbed(now, gain, res, isTest)
        gain = gain or {}
        local rewards = {}
        local function Add(g, name, total)
            if g and g > 0 then
                rewards[#rewards + 1] = ("+ %s %s (match #%d)"):format(Fmt(g), name, W.Matches)
                if total then rewards[#rewards + 1] = ("+ %s %s (total)"):format(Fmt(total), name) end
            end
        end
        Add(gain.gold, "Golds", W.Gold)
        Add(gain.gems, "Gems", W.Gems)
        Add(gain.exp, "EXP", W.Exp)
        if res then
            for _, it in ipairs(res.items) do
                if it.kind == "other" then
                    rewards[#rewards + 1] = ("+ %s %s (match #%d)"):format(it.name, it.text, W.Matches)
                end
            end
        end
        if #rewards == 0 then
            rewards[1] = isTest and "(test message)" or "No rewards found on the results screen"
            rewards[2] = ("(match #%d)"):format(W.Matches)
        end

        local goldText = W.CurGold > 0 and Fmt(W.CurGold) or "N/A"
        local gemsText = W.CurGems > 0 and Fmt(W.CurGems) or "N/A"
        local desc = table.concat({
            "💰 `Golds  : " .. goldText .. "`",
            "💎 `Gems   : " .. gemsText .. "`",
            "⚡ `Level  : " .. (FieldText("Level") or "N/A") .. "`",
            "⏱️ `Online : " .. Clock(os.time() - W.Start) .. "`",
        }, "\n")

        local fields = {
            { name = "⭐ Rewards", value = "```diff\n" .. table.concat(rewards, "\n") .. "\n```", inline = false },
        }
        if W.SendResultTexts and res and #res.stats > 0 then
            local lines = {}
            for _, st in ipairs(res.stats) do
                lines[#lines + 1] = ("%-14s : %s"):format(st.name, st.text)
            end
            fields[#fields + 1] = { name = "📊 Stats", value = "```\n" .. table.concat(lines, "\n") .. "\n```", inline = false }
        end

        if W.SendResultTexts and res and #res.stats == 0 and #res.items == 0 and res.raw and #res.raw > 0 then
            fields[#fields + 1] = { name = "🧾 Result screen", value = "```\n" .. table.concat(res.raw, "\n"):sub(1, 900) .. "\n```", inline = false }
        end

        return {
            username = "Aotr:Update[5]",
            embeds = { {
                title = "Username: " .. LocalPlayer.Name,
                description = desc,
                color = isTest and 0x5865F2 or 0x57F287,
                fields = fields,
                thumbnail = { url = ("https://www.roblox.com/headshot-thumbnail/image?userId=%d&width=150&height=150&format=png"):format(LocalPlayer.UserId) },
                footer = { text = "Aotr:Update[5] | AOTR" .. (isTest and " | TEST" or "") },
                timestamp = DateTime.now():ToIsoDate(),
            } },
        }
    end

        local function PostJson(payload)
        local req = GetRequest()
        if not req then return false, "executor has no http request" end
        if not ValidUrl(W.Url) then return false, "invalid webhook link" end
        local ok, res = pcall(req, {
            Url = W.Url,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = HttpService:JSONEncode(payload),
        })
        if not ok then return false, tostring(res) end
        local code = type(res) == "table" and (res.StatusCode or res.Status) or nil
        if code and code >= 200 and code < 300 then return true, "HTTP " .. tostring(code) end
        return false, "HTTP " .. tostring(code)
    end

    local baseline = {}
    local sending = false
    local function SendMatch()
        if sending then return end
        sending = true
        local res
        local function Count(r) return r and (#r.stats + #r.items) or -1 end
        pcall(function() res = ReadResult() end)
        task.wait(SEND_DELAY)
        local now = Snapshot()
        pcall(function()
            local r2 = ReadResult()
            if Count(r2) >= Count(res) and r2 then res = r2 end
        end)
        local gain = {}
        if res then
            for _, it in ipairs(res.items) do
                if it.num and (it.kind == "gold" or it.kind == "gems" or it.kind == "exp") then
                    gain[it.kind] = (gain[it.kind] or 0) + it.num
                end
            end
        end
        if not gain.gold and baseline.gold and now.gold then gain.gold = now.gold - baseline.gold end
        if not gain.gems and baseline.gems and now.gems then gain.gems = now.gems - baseline.gems end
        W.Matches += 1
        if gain.gold and gain.gold > 0 then W.Gold += gain.gold end
        if gain.gems and gain.gems > 0 then W.Gems += gain.gems end
        if gain.exp and gain.exp > 0 then W.Exp += gain.exp end
        if not now.gold and gain.gold and gain.gold > 0 and W.CurGold > 0 then W.CurGold += gain.gold end
        if not now.gems and gain.gems and gain.gems > 0 and W.CurGems > 0 then W.CurGems += gain.gems end
        SaveW()

        local ok, msg = PostJson(BuildEmbed(now, gain, res, false))
        Status(ok and ("Sent (match " .. W.Matches .. ")") or ("Send failed: " .. tostring(msg)))
        baseline = { gold = now.gold, gems = now.gems }
        sending = false
    end

        task.spawn(function()
        local shownSince, goneSince, sent, lastSave = nil, nil, false, 0
        while Alive() do
            task.wait(0.3)
            if not W.Enabled or not Farm.CanUseHere() then
                shownSince, goneSince, sent = nil, nil, false
                baseline = {}
            else
                if os.clock() - lastSave >= 30 then lastSave = os.clock() SaveW() end
                local shown = ResultShown()
                if shown then
                    goneSince = nil
                    shownSince = shownSince or os.clock()
                    if not sent and os.clock() - shownSince >= 0.5 then
                        sent = true
                        task.spawn(SendMatch)
                    end
                else
                    shownSince = nil
                    goneSince = goneSince or os.clock()
                    if os.clock() - goneSince >= 3 then sent = false end
                    local snap = Snapshot()
                    if baseline.gold == nil then baseline.gold = snap.gold end
                    if baseline.gems == nil then baseline.gems = snap.gems end
                end
            end
        end
    end)

    -- ---------- UI ----------
    if not TAB then
        local cat = Cascade.Components.Section(Window, { Title = "Misc", Disclosure = false })
        TAB = cat:Tab({ Title = "Webhook", Icon = Icon("paperplaneFill", "bellFill", "boltFill") })
    end

    local Form = TAB:PageSection({
        Title = "🔔 Webhook",
        Subtitle = "Sends a reward summary to Discord every time a match ends (MISSION COMPLETED screen).",
    }):Form()

    local function SetStatus(text) if Status then Status(text) end end

    local onRow = Form:Row()
    onRow:Left():TitleStack({ Title = "Enable Webhook", Subtitle = "Post to Discord when a match ends. Needs a valid Webhook URL." })
    UiSync.Link(onRow:Right():Toggle({
        Value = W.Enabled,
        ValueChanged = function(self, value)
            W.Enabled = value and true or false
            SaveW()
            if W.Enabled and not ValidUrl(W.Url) then SetStatus("Set a valid Webhook URL first") end
        end
    }), W, "Enabled")

    local statusRow = Form:Row()
    statusRow:Left():TitleStack({ Title = "Webhook Status", Subtitle = "Result of the last send." })
    local statusLabel = statusRow:Right():Label({ Text = "Idle" })
    Status = function(text) pcall(function() statusLabel.Text = tostring(text) end) end

    local function SetUrl(text, save)
        W.Url = (tostring(text or ""):gsub("%s", ""))
        if save then SaveW() end
    end

    local urlRow = Form:Row()
    urlRow:Left():TitleStack({ Title = "Webhook URL", Subtitle = "Discord: Server Settings > Integrations > Webhooks > Copy URL. Keep it private." })
    local okField, field = pcall(function()
        return urlRow:Right():TextField({
            Placeholder = "https://discord.com/api/webhooks/...",
            Value = W.Url,
            TextChanged = function(self, text) SetUrl(text, false) end,
            ValueChanged = function(self, value) SetUrl(value, true) end,
        })
    end)
    if okField and field then
        pcall(function() UiSync.Link(field, W, "Url") end)
    end

    local testRow = Form:Row()
    testRow:Left():TitleStack({ Title = "Send Test", Subtitle = "Send one test message now." })
    local testBtn = testRow:Right():Button({ Label = "Test", Callback = function() end })
    BindButton(testBtn, function()
        pcall(function()
            if okField and field and type(field.Value) == "string" and ValidUrl(field.Value:gsub("%s", "")) then
                SetUrl(field.Value, false)
            end
        end)
        SaveW()
        Status("Sending...")
        local ok, msg = PostJson(BuildEmbed(Snapshot(), {}, nil, true))
        Status(ok and "Test sent" or ("Test failed: " .. tostring(msg)))
    end)
end)

do
local HOP_PLACE_ID = game.PlaceId
local TeleportService = game:GetService("TeleportService")
local UserInputService = game:GetService("UserInputService")
local HubConfig = {
    InfiniteJump = false,
    AntiAFK = true,
    AutoRejoin = true,
    AntiAdmin = true,
    AutoExecute = false,
    CharacterRGB = false,
    EnableFPSLock = false,
    FPSLimit = 144,
    AutoDeleteMap = false,
    AutoHideMenu = false,
}
for key, value in pairs(HubConfig) do UiSync.Defaults.Hub[key] = value end
ConfigStore.BuildDefault(UiSync.Defaults.Hub)
SettingsStore.Restore(HubConfig, SavedData.Hub)
ConfigStore.ApplyHub(HubConfig, ConfigStore.AutoloadSnapshot())
if SH.LegacyHub then ConfigStore.ApplyHub(HubConfig, { Hub = SH.LegacyHub }) end
SH.say("Settings loaded.")
local AUTOEXEC_URL = (type(getgenv) == "function" and getgenv().AOTR_UPDATE5_URL) or ""
UiSync.ReloadUrl = AUTOEXEC_URL
local queueTeleport = queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport)
local AUTOEXEC_LOCK = "AotrUpdate5/AutoExec.lock"
local AUTOEXEC_LOG = "AotrUpdate5/AutoExec.log"
local function AutoExecLog(text)
    if not SH.DEV then return end
    pcall(function()
        if type(makefolder) == "function" and type(isfolder) == "function" and not isfolder("AotrUpdate5") then
            makefolder("AotrUpdate5")
        end
        local line = tostring(os.time()) .. " place=" .. tostring(game.PlaceId) .. " " .. text .. "\n"
        if type(appendfile) == "function" then
            appendfile(AUTOEXEC_LOG, line)
        elseif type(writefile) == "function" then
            writefile(AUTOEXEC_LOG, line)
        end
    end)
end
local function QueueAutoExecute()
    if type(queueTeleport) ~= "function" then
        AutoExecLog("queue_on_teleport not supported by this executor")
        return false
    end
    if AUTOEXEC_URL == "" then
        AutoExecLog("no reload URL set (getgenv().AOTR_UPDATE5_URL)")
        return false
    end
    local AUTOEXEC_KEY_NOW = "AotrUpdate5-1293F5A9B3D92637A16077A0"
    pcall(function()
        local cur = (getgenv and getgenv().script_key) or script_key
        if type(cur) == "string" and cur ~= "" then AUTOEXEC_KEY_NOW = cur end
    end)
    local payload = string.format([[
        local LOG = %q
        local LOCK = %q
        local function log(text)
            if true then return end
            pcall(function()
                if type(makefolder) == "function" and type(isfolder) == "function" and not isfolder("AotrUpdate5") then makefolder("AotrUpdate5") end
                local line = tostring(os.time()) .. " place=" .. tostring(game.PlaceId) .. " [queued] " .. text .. "\n"
                if type(appendfile) == "function" then appendfile(LOG, line)
                elseif type(writefile) == "function" then writefile(LOG, line) end
            end)
        end
        log("started")
        if not game:IsLoaded() then game.Loaded:Wait() end
        local Players = game:GetService("Players")
        while not Players.LocalPlayer do task.wait() end
        local run = true
        pcall(function()
            if type(isfile) == "function" and isfile(%q) then
                local data = game:GetService("HttpService"):JSONDecode(readfile(%q))
                if type(data) == "table" and type(data.Hub) == "table" and data.Hub.AutoExecute == false then run = false end
            end
        end)
        if not run then log("skipped (Auto Execute is off)") return end
        local jobId = tostring(game.JobId)
        pcall(function()
            if jobId ~= "" and type(isfile) == "function" and isfile(LOCK) then
                local id, t = tostring(readfile(LOCK)):match("^(.-)|(%%d+)$")
                if id == jobId and t and os.time() - tonumber(t) < 20 then run = false end
            end
        end)
        if not run then log("skipped (already started in this server)") return end
        pcall(function() writefile(LOCK, jobId .. "|" .. tostring(os.time())) end)
        local KEY = %q
        pcall(function() if getgenv then getgenv().script_key = KEY end end)
        script_key = KEY
        local src, err
        for i = 1, 5 do
            local ok, res = pcall(function() return game:HttpGet(%q) end)
            if ok and type(res) == "string" and #res > 0 then src = res break end
            err = res
            task.wait(1)
        end
        if not src then log("download failed: " .. tostring(err)) return end
        local fn, cerr = loadstring(src)
        if not fn then log("compile failed: " .. tostring(cerr)) return end
        local ok, rerr = pcall(fn)
        log(ok and "script started" or ("script error: " .. tostring(rerr)))
    ]], AUTOEXEC_LOG, AUTOEXEC_LOCK, SettingsStore.Path("AOTR"), SettingsStore.Path("AOTR"), AUTOEXEC_KEY_NOW, AUTOEXEC_URL)
    local ok, err = pcall(queueTeleport, payload)
    AutoExecLog(ok and "queued" or ("queue failed: " .. tostring(err)))
    return ok
end
local function ApplyAutoExecute(on)
    if on then
        SettingsStore.Flush("AOTR")
        QueueAutoExecute()
    elseif type(clear_teleport_queue) == "function" then
        pcall(clear_teleport_queue)
    end
end
if HubConfig.AutoExecute then QueueAutoExecute() end
if type(queueTeleport) == "function" then
    local lastQueuedAt = 0
    pcall(function()
        LocalPlayer.OnTeleport:Connect(function(state)
            if not Alive() or not HubConfig.AutoExecute then return end
            if os.clock() - lastQueuedAt < 5 then return end
            lastQueuedAt = os.clock()
            AutoExecLog("teleport started (" .. tostring(state) .. ") - re-queue")
            if type(clear_teleport_queue) == "function" then pcall(clear_teleport_queue) end
            QueueAutoExecute()
        end)
    end)
end
local function HopServer()
    pcall(function()
        local servers = {}
        local req = game:HttpGet("https://games.roblox.com/v1/games/" .. HOP_PLACE_ID .. "/servers/Public?sortOrder=Asc&limit=100")
        local body = HttpService:JSONDecode(req)
        if body and body.data then
            for _, sv in ipairs(body.data) do
                if type(sv) == "table" and sv.id ~= game.JobId and sv.playing < sv.maxPlayers then
                    table.insert(servers, sv.id)
                end
            end
        end
        if #servers > 0 then
            TeleportService:TeleportToPlaceInstance(HOP_PLACE_ID, servers[math.random(1, #servers)], LocalPlayer)
        else
            TeleportService:Teleport(HOP_PLACE_ID, LocalPlayer)
        end
    end)
end
local SettingsCategory = Cascade.Components.Section(Window, {
    Title = "Settings\u{200B}",
    Disclosure = false
})
local AdvancedTab, ServerTab, SettingsTab, ConfigTab
do
AdvancedTab = SettingsCategory:Tab({
    Title = "Advanced",
    Icon = Icon("gearshapeFill", "gearshape")
})
local AdvSection = AdvancedTab:PageSection({
    Title = "⚙️ Advanced Settings",
    Subtitle = "Configure advanced player modifications and tools.",
})
local AdvForm = AdvSection:Form()
local function AddToggle(form, title, subtitle, key, onChange)
    local row = form:Row()
    row:Left():TitleStack({ Title = title, Subtitle = subtitle })
    UiSync.Link(row:Right():Toggle({
        Value = HubConfig[key],
        ValueChanged = function(self, value)
            HubConfig[key] = value and true or false
            if onChange then onChange(value) end
        end
    }), HubConfig, key)
end
AddToggle(AdvForm, "Infinite Jump", "Allow your character to jump infinitely in the air.", "InfiniteJump")
AddToggle(AdvForm, "Anti-AFK", "Prevent being kicked out of the game due to inactivity.", "AntiAFK")
AddToggle(AdvForm, "Auto Rejoin", "Automatically rejoin the game if disconnected or kicked.", "AutoRejoin")
AddToggle(AdvForm, "Anti Admin", "Automatically server hop if an admin joins the game.", "AntiAdmin")
AddToggle(AdvForm,
    "Auto Execute",
    type(queueTeleport) == "function" and "Run the script again after teleporting or rejoining a server. Needs getgenv().AOTR_UPDATE5_URL set to the raw link of this script."
        or "Not supported by your executor.",
    "AutoExecute",
    ApplyAutoExecute)
AddToggle(AdvForm, "Auto Hide Menu", "Hide the menu automatically when the script runs. Tap the logo button or press the hotkey to open it.", "AutoHideMenu")
local CharRGB = {}
do
    local RunService = game:GetService("RunService")
    local hl, conn = nil, nil
    local function Remove()
        if hl then pcall(function() hl:Destroy() end) hl = nil end
    end
    function CharRGB.Apply(on)
        if not on then Remove() end
    end
    conn = RunService.Heartbeat:Connect(function()
        if not Alive() then
            Remove()
            if conn then conn:Disconnect() conn = nil end
            return
        end
        local char = LocalPlayer.Character
        if not (HubConfig.CharacterRGB and char) then
            if hl then Remove() end
            return
        end
        if not (hl and hl.Parent and hl.Adornee == char) then
            Remove()
            local ok, obj = pcall(function()
                local h = Instance.new("Highlight")
                h.Name = "AotrUpdate5CharacterRGB"
                h.Adornee = char
                h.FillTransparency = 1
                h.OutlineTransparency = 0
                h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                h.Parent = char
                return h
            end)
            if ok then hl = obj end
        end
        if hl then hl.OutlineColor = Color3.fromHSV((os.clock() * 0.4) % 1, 1, 1) end
    end)
end
AddToggle(AdvForm, "Character [ RGB ]", "Rainbow outline around your character.", "CharacterRGB", CharRGB.Apply)
-- [aotr] runs immediately (no 1.5s wait) and never overrides a menu the user already opened/closed
if Alive() and not SH.MenuTouched then
    if HubConfig.AutoHideMenu then
        if not SH.MenuEarlyHidden then pcall(function() Window.Minimized = true end) end
    elseif SH.MenuEarlyHidden then
        pcall(function() Window.Minimized = false end) -- autoload config turned Auto Hide off
    end
end
local Fps = {}
Farm.Fps = Fps
do
    local RunService = game:GetService("RunService")
    local SOFT_MAX = 240
    local candidates = {
        setfpscap, set_fps_cap, setfps,
        syn and syn.set_fps_cap, fluxus and fluxus.set_fps_cap,
    }
    local names = { "setfpscap", "set_fps_cap", "setfps", "syn.set_fps_cap", "fluxus.set_fps_cap" }
    local native, nativeName = nil, nil
    for i = 1, 5 do
        if type(candidates[i]) == "function" then native, nativeName = candidates[i], names[i] break end
    end
    Fps.Native = nativeName
    local function DesiredOn() return HubConfig.EnableFPSLock and true or false end
    local function DesiredLimit() return math.clamp(math.floor(tonumber(HubConfig.FPSLimit) or 144), 1, 9999) end
    Fps.Mode = "off"
    Fps.Measured = 0
    local applied = { on = DesiredOn(), limit = DesiredLimit() }
    local softConn = nil
    local function StopSoft()
        if softConn then softConn:Disconnect() softConn = nil end
    end
    local function StartSoft(limit)
        StopSoft()
        local frameTime = 1 / limit
        local last = os.clock()
        local conn
        conn = RunService.RenderStepped:Connect(function()
            if not Alive() then conn:Disconnect() return end
            local target = last + frameTime
            while os.clock() < target do end
            last = os.clock()
        end)
        softConn = conn
    end
    function Fps.Apply()
        local on, limit = DesiredOn(), DesiredLimit()
        StopSoft()
        if on then
            if native then
                pcall(native, limit)
                Fps.Mode = "native"
            elseif limit >= 9999 then
                Fps.Mode = "off"
            elseif limit <= SOFT_MAX then
                StartSoft(limit)
                Fps.Mode = "software"
            else
                Fps.Mode = "unsupported"
            end
        else
            if native then pcall(native, 9999) end
            Fps.Mode = "off"
        end
        applied.on, applied.limit = on, limit
    end
    function Fps.Reassert()
        local on, limit = DesiredOn(), DesiredLimit()
        if on ~= applied.on or limit ~= applied.limit then
            Fps.Apply()
        elseif on and Fps.Mode == "native" then
            pcall(native, limit)
        end
    end
    local frames, lastT = 0, os.clock()
    local counter
    counter = RunService.RenderStepped:Connect(function()
        if not Alive() then counter:Disconnect() return end
        frames += 1
    end)
    task.spawn(function()
        while Alive() do
            task.wait(0.5)
            local now = os.clock()
            local dt = now - lastT
            if dt > 0 then Fps.Measured = frames / dt end
            frames, lastT = 0, now
            if Fps.OnUpdate then pcall(Fps.OnUpdate, Fps.Measured, Fps.Mode, Fps.Native) end
        end
    end)
    if DesiredOn() then Fps.Apply() end
end
local FpsSection = AdvancedTab:PageSection({
    Title = "🖥️ FPS",
    Subtitle = "Limit the frame rate of the game."
})
local FpsForm = FpsSection:Form()
AddToggle(FpsForm, "Enable FPS Lock", "Toggle frame rate limiting on or off.", "EnableFPSLock", function(value)
    Fps.Apply()
end)
local FpsMenuRow = FpsForm:Row()
FpsMenuRow:Left():TitleStack({
    Title = "FPS Limit Preset",
    Subtitle = "Choose target frame rate limit."
})
local fpsOptions = { "15 FPS", "30 FPS", "60 FPS", "120 FPS", "144 FPS", "240 FPS", "500 FPS", "1000 FPS", "9999 (Unlimited)" }
local fpsValues = { 15, 30, 60, 120, 144, 240, 500, 1000, 9999 }
local fpsDefaultIndex = table.find(fpsValues, HubConfig.FPSLimit) or 5
local FpsBtn = FpsMenuRow:Right():PullDownButton({
    Label = fpsOptions[fpsDefaultIndex],
    Options = fpsOptions,
    Value = fpsDefaultIndex,
    ValueChanged = function(self, index)
        local target = fpsValues[index]
        HubConfig.FPSLimit = target
        self.Label = fpsOptions[index]
        if HubConfig.EnableFPSLock then Fps.Apply() end
    end
})
StyleDropdown(FpsBtn)
UiSync.Add(function()
    local i = table.find(fpsValues, HubConfig.FPSLimit) or 5
    FpsBtn.Value = i
    FpsBtn.Label = fpsOptions[i]
end)
local FpsStatusRow = FpsForm:Row()
local FpsStatusStack = FpsStatusRow:Left():TitleStack({
    Title = "Current FPS ( -- )",
    Subtitle = "Measured live so you can see whether the lock is working."
})
Fps.OnUpdate = function(fps, mode, nativeName)
    local text
    if mode == "native" then
        text = "Locked at " .. tostring(HubConfig.FPSLimit) .. " FPS using " .. tostring(nativeName) .. "."
    elseif mode == "software" then
        text = "Locked at " .. tostring(HubConfig.FPSLimit) .. " FPS by the built-in limiter (your executor has no FPS cap function)."
    elseif mode == "unsupported" then
        text = "Can't lock above 240 FPS: your executor has no FPS cap function."
    else
        text = "Lock is off." .. (nativeName and (" Executor supports " .. nativeName .. ".") or " Executor has no FPS cap function (built-in limiter will be used up to 240 FPS).")
    end
    pcall(function()
        FpsStatusStack.Title = "Current FPS ( " .. tostring(math.floor(fps + 0.5)) .. " )"
        FpsStatusStack.Subtitle = text
    end)
end
local MapCleaner = {}
Farm.MapCleaner = MapCleaner
do
    local KEEP_ABOVE = 6
    local busy = false
    local function GroundY()
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        local titans = workspace:FindFirstChild("Titans")
        local params = RaycastParams.new()
        params.FilterType = Enum.RaycastFilterType.Exclude
        local ignore = {}
        if char then ignore[#ignore + 1] = char end
        if titans then ignore[#ignore + 1] = titans end
        params.FilterDescendantsInstances = ignore
        local best = nil
        local function sample(pos)
            local hit = workspace:Raycast(pos, Vector3.new(0, -3000, 0), params)
            if hit and (not best or hit.Position.Y < best) then best = hit.Position.Y end
        end
        if root then sample(root.Position) end
        if titans then
            local n = 0
            for _, t in ipairs(titans:GetChildren()) do
                local r = t:FindFirstChild("HumanoidRootPart")
                if r then
                    sample(r.Position)
                    n += 1
                    if n >= 6 then break end
                end
            end
        end
        return best
    end
    function MapCleaner.Run()
        if busy then return false, "Already running..." end
        busy = true
        local okCall, ok, text = pcall(function()
            local groundY = GroundY()
            if not groundY then return false, "Can't find the ground - stand on the map first" end
            local limit = groundY + KEEP_ABOVE
            local roots = {}
            roots[workspace.Terrain] = true
            if workspace.CurrentCamera then roots[workspace.CurrentCamera] = true end
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr.Character then roots[plr.Character] = true end
            end
            for _, name in ipairs({ "Titans", "Debris" }) do
                local f = workspace:FindFirstChild(name)
                if f then roots[f] = true end
            end
            local function Protected(node)
                if roots[node] then return true end
                local n = node.Name
                if n == "Refill" or n == "Spears" then return true end
                if node:IsA("SpawnLocation") or node:IsA("ProximityPrompt") or node:IsA("ClickDetector") or node:IsA("Humanoid") then return true end
                if node:IsA("Model") and node:FindFirstChildOfClass("Humanoid") then return true end
                return false
            end
            local visited, toDestroy = 0, {}
            local function Plan(node)
                visited += 1
                if visited % 1500 == 0 then task.wait() end
                if Protected(node) then return true end
                local keepSelf = false
                if node:IsA("BasePart") then
                    keepSelf = (node.Position.Y + node.Size.Y / 2) <= limit
                end
                local children = node:GetChildren()
                local flags, anyKept = {}, false
                for i, c in ipairs(children) do
                    local f = Plan(c)
                    flags[i] = f
                    if f then anyKept = true end
                end
                if not (keepSelf or anyKept) then return false end
                for i, c in ipairs(children) do
                    if not flags[i] then toDestroy[#toDestroy + 1] = c end
                end
                return true
            end
            for _, child in ipairs(workspace:GetChildren()) do
                if not Plan(child) then toDestroy[#toDestroy + 1] = child end
            end
            for i, inst in ipairs(toDestroy) do
                pcall(function() inst:Destroy() end)
                if i % 50 == 0 then task.wait() end
            end
            pcall(function()
                local lighting = game:GetService("Lighting")
                lighting.GlobalShadows = false
                for _, e in ipairs(lighting:GetChildren()) do
                    if e:IsA("PostEffect") then e.Enabled = false end
                end
            end)
            return true, ("Deleted %d map objects (scanned %d). Rejoin to get the map back."):format(#toDestroy, visited)
        end)
        busy = false
        if not okCall then return false, "Error: " .. tostring(ok) end
        return ok, text
    end
end
function Farm.DeleteMap()
    task.spawn(function()
        if MapCleaner.OnResult then MapCleaner.OnResult("Deleting the map...") end
        local _, text = MapCleaner.Run()
        if MapCleaner.OnResult then MapCleaner.OnResult(text or "") end
    end)
end
task.spawn(function()
    local since, lastDone = nil, 0
    while Alive() do
        task.wait(1)
        if HubConfig.AutoDeleteMap and Farm.CanUseHere and Farm.CanUseHere() then
            since = since or os.clock()
            if os.clock() - since >= 10 and os.clock() - lastDone >= 30 then
                lastDone = os.clock()
                Farm.DeleteMap()
            end
        else
            since = nil
        end
    end
end)
local DelMapRow = FpsForm:Row()
local DelMapStack = DelMapRow:Left():TitleStack({
    Title = "Delete Map",
    Subtitle = "Removes buildings, trees and walls on YOUR screen only, to cut lag. Rejoin to get the map back."
})
local DelMapRun
local DelMapBtn = DelMapRow:Right():Button({
    Label = "Delete",
    Callback = function() if DelMapRun then DelMapRun() end end
})
DelMapRun = BindButton(DelMapBtn, function() Farm.DeleteMap() end)
MapCleaner.OnResult = function(text)
    pcall(function() DelMapStack.Subtitle = text end)
end
AddToggle(FpsForm, "Auto Delete Map", "Deletes the map by itself every time you are in a mission.", "AutoDeleteMap")
end
do
ServerTab = SettingsCategory:Tab({
    Title = "Server",
    Icon = Icon("globe", "network")
})
local ServerInfoSection = ServerTab:PageSection({
    Title = "🌐 Server Information",
    Subtitle = "Display current server details and identifiers."
})
local ServerInfoForm = ServerInfoSection:Form()
local GameIdRow = ServerInfoForm:Row()
GameIdRow:Left():TitleStack({ Title = "GameId", Subtitle = "The unique ID of this game universe." })
GameIdRow:Right():Label({ Text = tostring(game.GameId) })
local PlaceIdRow = ServerInfoForm:Row()
PlaceIdRow:Left():TitleStack({ Title = "PlaceId", Subtitle = "The specific place ID of this server instance." })
PlaceIdRow:Right():Label({ Text = tostring(game.PlaceId) })
local ServerActionSection = ServerTab:PageSection({
    Title = "💾 Server Actions",
    Subtitle = "Quick tools to copy identifiers or switch servers."
})
local ServerActionForm = ServerActionSection:Form()
local function AddAction(form, title, subtitle, fn)
    local row = form:Row()
    row:Left():TitleStack({ Title = title, Subtitle = subtitle })
    local run
    local btn = row:Right():Button({
        Label = "Execute",
        Callback = function() if run then run() end end
    })
    run = BindButton(btn, fn)
end
AddAction(ServerActionForm, "Copy JobId", "Copy current JobId to clipboard for friends to join.", function()
    CopyText(tostring(game.JobId))
end)
AddAction(ServerActionForm, "Rejoin Server", "Go back to the main world (this map can't be rejoined directly).", function()
    pcall(function()
        if #Players:GetPlayers() <= 1 then
            LocalPlayer:Kick("\nRejoining...")
            task.wait()
        end
        TeleportService:Teleport(HOP_PLACE_ID, LocalPlayer)
    end)
end)
AddAction(ServerActionForm, "Server Hop", "Teleport to a different server to find a new one.", HopServer)
end
SettingsTab = SettingsCategory:Tab({
    Title = "Windows",
    Icon = Icon("macwindow", "sliderHorizontal3")
})
local FOLLOW_THEME = "Theme Default"
local CurrentThemeName, CurrentAccentName = "Dark", FOLLOW_THEME
local colorOptions, accentOptions = { "Dark" }, { FOLLOW_THEME }
local ThemeColorBtn, AccentColorBtn = {}, {}
local function ApplyAppearance() end
UiSync.Blur = { Value = false }
UiSync.Shadow = { Value = false }
AccentOrder = { "Dark" }
local InputSection = SettingsTab:PageSection({
    Title = "⌨️ Input",
    Subtitle = "The shortcut that hides and shows the window."
})
local InputForm = InputSection:Form()
local HotkeyRow = InputForm:Row()
HotkeyRow:Left():TitleStack({
    Title = "Minimize Hotkey",
    Subtitle = "Press to hide or show the window."
})
local currentKeybind = Enum.KeyCode.LeftAlt
pcall(function() currentKeybind = Enum.KeyCode[ConfigStore.DEFAULT_LOOK.Keybind] or Enum.KeyCode.LeftAlt end)
if type(SavedUi.Keybind) == "string" then
    pcall(function()
        local savedKey = Enum.KeyCode[SavedUi.Keybind]
        if savedKey then currentKeybind = savedKey end
    end)
end
UiSync.Hotkey = HotkeyRow:Right():KeybindField({
    Value = currentKeybind,
    ValueChanged = function(self, newKey) currentKeybind = newKey end,
    BindPressed = function(self, key, inputComplete, gameProcessedEvent)
        if not inputComplete then return end
        local typing = false
        pcall(function() typing = game:GetService("UserInputService"):GetFocusedTextBox() ~= nil end)
        if gameProcessedEvent and typing then return end
        SH.MenuTouched = true
        Window.Minimized = not Window.Minimized
    end
})
task.spawn(function()
    local LOGO_URL = ""
    local LOGO_ASSET_ID = ""
    local LOGO_ON_PC = true
    local UIS = game:GetService("UserInputService")
    if not UIS.TouchEnabled and not LOGO_ON_PC then return end
    local B64_TOGGLE = ""
    local function B64DecodeT(data)
        if data == "" then return "" end
        local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
        local lookup = {}
        for i = 1, 64 do lookup[chars:sub(i, i)] = i - 1 end
        data = data:gsub("[^%w%+/=]", "")
        local out, n = {}, 0
        for i = 1, #data, 4 do
            local a, b, c, d = data:sub(i, i), data:sub(i + 1, i + 1), data:sub(i + 2, i + 2), data:sub(i + 3, i + 3)
            local v = (lookup[a] or 0) * 262144 + (lookup[b] or 0) * 4096 + (lookup[c] or 0) * 64 + (lookup[d] or 0)
            n = n + 1
            out[n] = string.char(math.floor(v / 65536) % 256)
            if c ~= "=" and c ~= "" then n = n + 1 out[n] = string.char(math.floor(v / 256) % 256) end
            if d ~= "=" and d ~= "" then n = n + 1 out[n] = string.char(v % 256) end
        end
        return table.concat(out)
    end
    local logoImage = ""
    do
        local id = tostring(LOGO_ASSET_ID or ""):gsub("%s", "")
        if id ~= "" then
            logoImage = id:match("^%d+$") and ("rbxassetid://" .. id) or id
        elseif B64_TOGGLE ~= "" and type(writefile) == "function"
            and (type(getcustomasset) == "function" or type(getsynasset) == "function") then
            local okB, assetB = pcall(function()
                if type(makefolder) == "function" and type(isfolder) == "function" and not isfolder("AotrUpdate5") then
                    makefolder("AotrUpdate5")
                end
                local path = "AotrUpdate5/toggle_logo_v2.png"
                writefile(path, B64DecodeT(B64_TOGGLE))
                return (getcustomasset or getsynasset)(path)
            end)
            if okB and type(assetB) == "string" and assetB ~= "" then logoImage = assetB end
        end
        if logoImage == "" and tostring(LOGO_URL or "") ~= "" and type(writefile) == "function"
            and (type(getcustomasset) == "function" or type(getsynasset) == "function") then
            local file = "AotrUpdate5_logo.png"
            pcall(function()
                local data = game:HttpGet(LOGO_URL)
                if type(data) == "string" and #data > 100 then writefile(file, data) end
            end)
            local okAsset, asset = pcall(function() return (getcustomasset or getsynasset)(file) end)
            if okAsset and type(asset) == "string" and asset ~= "" then logoImage = asset end
        end
    end
    local parent = (type(gethui) == "function" and gethui()) or game:GetService("CoreGui")
    pcall(function()
        local old = parent:FindFirstChild("AotrUpdate5Toggle")
        if old then old:Destroy() end
    end)
    local gui = Instance.new("ScreenGui")
    gui.Name = "AotrUpdate5Toggle"
    gui.ResetOnSpawn = false
    gui.DisplayOrder = 999998
    local okParent = pcall(function() gui.Parent = parent end)
    if not okParent or not gui.Parent then gui.Parent = PlayerGui end
    local btn = Instance.new("ImageButton")
    btn.Name = "Toggle"
    btn.Size = UDim2.fromOffset(52, 52)
    btn.Position = UDim2.new(0, 14, 0.5, -26)
    btn.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
    btn.BackgroundTransparency = 0
    btn.AutoButtonColor = false
    btn.Image = logoImage
    btn.ScaleType = Enum.ScaleType.Crop
    btn.Parent = gui
    if logoImage == "" then
        local letter = Instance.new("TextLabel")
        letter.Size = UDim2.fromScale(1, 1)
        letter.BackgroundTransparency = 1
        letter.Text = "A"
        letter.TextColor3 = Color3.fromRGB(255, 255, 255)
        letter.Font = Enum.Font.GothamBold
        letter.TextSize = 24
        letter.Parent = btn
    end
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = btn
    do
        local RunService = game:GetService("RunService")
        local TweenService = game:GetService("TweenService")
        local RED = Color3.fromRGB(255, 60, 70)
        local WHITE = Color3.fromRGB(255, 255, 255)

        local scaleObj = Instance.new("UIScale")
        scaleObj.Scale = 0
        scaleObj.Parent = btn

        local function newSpring(x, k, d) return { x = x, v = 0, t = x, k = k, d = d } end
        local function stepSpring(s, dt)
            local f = -s.k * (s.x - s.t) - s.d * s.v
            s.v = s.v + f * dt
            s.x = s.x + s.v * dt
            return s.x
        end
        local sc = newSpring(0, 170, 15)
        local rot = newSpring(0, 120, 13)
        local gl = newSpring(0, 160, 25)

        local hover, pressed, lifted = false, false, false
        local mouseRel = 0
        local pressPos = nil
        local t0 = os.clock()
        local last = t0

        local conn
        conn = RunService.RenderStepped:Connect(function()
            if not Alive() or not gui.Parent then
                if conn then conn:Disconnect() end
                return
            end
            local now = os.clock()
            local dt = math.min(now - last, 1 / 30)
            last = now
            local t = now - t0

            sc.t = pressed and (lifted and 1.14 or 0.9) or (hover and 1.12 or 1)
            rot.t = (hover and not pressed) and (mouseRel * 10) or 0
            gl.t = (hover or pressed) and 1 or 0

            local s = stepSpring(sc, dt)
            local r = stepSpring(rot, dt)
            local g = math.clamp(stepSpring(gl, dt), 0, 1)

            local breathe = (1 - g) * 0.025 * math.sin(t * 1.8)
            scaleObj.Scale = math.max(0, s + breathe)
            btn.Rotation = r
        end)
        sc.t = 1

        local function ripple()
            local ring = Instance.new("Frame")
            ring.AnchorPoint = Vector2.new(0.5, 0.5)
            ring.Position = UDim2.fromScale(0.5, 0.5)
            ring.Size = UDim2.fromScale(1, 1)
            ring.BackgroundTransparency = 1
            ring.BorderSizePixel = 0
            ring.Parent = btn
            local rc = Instance.new("UICorner")
            rc.CornerRadius = UDim.new(1, 0)
            rc.Parent = ring
            local rs = Instance.new("UIStroke")
            rs.Thickness = 1.5
            rs.Color = WHITE
            rs.Transparency = 0.55
            rs.Parent = ring
            local info = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            TweenService:Create(ring, info, { Size = UDim2.fromScale(1.9, 1.9) }):Play()
            TweenService:Create(rs, info, { Transparency = 1 }):Play()
            task.delay(0.65, function() pcall(function() ring:Destroy() end) end)
        end

        local function isPressInput(input)
            return input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1
        end
        btn.MouseEnter:Connect(function() hover = true end)
        btn.MouseLeave:Connect(function() hover = false end)
        btn.InputBegan:Connect(function(input)
            if isPressInput(input) then
                pressed, lifted = true, false
                pressPos = input.Position
            end
        end)
        btn.InputEnded:Connect(function(input)
            if isPressInput(input) and pressed then
                local wasLifted = lifted
                pressed, lifted = false, false
                if input.UserInputType == Enum.UserInputType.Touch then hover = false end
                if not wasLifted then ripple() end
            end
        end)
        UIS.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                if pressed and pressPos and (input.Position - pressPos).Magnitude > 8 then lifted = true end
                if hover and input.UserInputType == Enum.UserInputType.MouseMovement then
                    local half = math.max(btn.AbsoluteSize.X / 2, 1)
                    local cx = btn.AbsolutePosition.X + btn.AbsoluteSize.X / 2
                    mouseRel = math.clamp((input.Position.X - cx) / half, -1, 1)
                end
            end
        end)
    end
    local dragging, moved, dragStart, startPos = false, false, nil, nil
    local function isPress(input)
        return input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1
    end
    btn.InputBegan:Connect(function(input)
        if isPress(input) then
            dragging, moved = true, false
            dragStart, startPos = input.Position, btn.Position
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
            local d = input.Position - dragStart
            if d.Magnitude > 8 then moved = true end
            if moved then
                btn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
            end
        end
    end)
    btn.InputEnded:Connect(function(input)
        if isPress(input) and dragging then
            dragging = false
            if not moved then SH.MenuTouched = true; Window.Minimized = not Window.Minimized end
        end
    end)
    while Alive() and gui.Parent do task.wait(1) end
    pcall(function() gui:Destroy() end)
end)
-- ============================================================
--  🖱️ Aotr:Update[5] | Cursor
-- ============================================================
SH.CursorTab = SettingsCategory:Tab({
    Title = "Cursor",
    Icon = Icon("cursorarrow", "cursorarrowRays", "cursorarrowClick", "boltFill"),
})
SH.Guard("mouse-cursor", function()
    local UIS = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local TAB = SH.CursorTab

    local FILE = "MouseCursor"
    local CURSOR_DIR = "AotrUpdate5/Cursors"
    local DEFAULT_IMAGE = "rbxasset://textures/Cursors/KeyboardMouse/ArrowFarCursor.png"
    local MAX_BYTES = 4 * 1024 * 1024

    local C = {
        Enabled = false,
        MenuOnly = true,
        Unlock = true,
        Center = false,
        Size = 32,
        Source = "",
    }
    SettingsStore.Restore(C, SettingsStore.Load(FILE))
    C.Size = math.clamp(tonumber(C.Size) or 32, 12, 128)
    local function SaveC() SettingsStore.Write(FILE, C) end

    local Status = function() end
    local imageAsset = DEFAULT_IMAGE

    local function GetRequest()
        return (syn and syn.request) or http_request or request or (fluxus and fluxus.request)
    end
    local function ImageExt(body)
        if type(body) ~= "string" then return nil end
        if body:sub(1, 8) == "\137PNG\r\n\26\n" then return "png" end
        if body:sub(1, 3) == "\255\216\255" then return "jpg" end
        return nil
    end
    local function Hash(s)
        local h = 5381
        for i = 1, #s do h = (h * 33 + s:byte(i)) % 4294967296 end
        return string.format("%08x", h)
    end
    local function EnsureDir()
        pcall(function()
            if type(makefolder) == "function" and type(isfolder) == "function" then
                if not isfolder("AotrUpdate5") then makefolder("AotrUpdate5") end
                if not isfolder(CURSOR_DIR) then makefolder(CURSOR_DIR) end
            end
        end)
    end
    local function Resolve(text)
        text = tostring(text or ""):match("^%s*(.-)%s*$")
        if text == "" then return DEFAULT_IMAGE end
        if text:match("^%d+$") then return "rbxassetid://" .. text end
        if text:match("^rbxassetid://") or text:match("^rbxasset://") then return text end

        local toAsset = getcustomasset or getsynasset
        if type(toAsset) ~= "function" or type(writefile) ~= "function" or type(isfile) ~= "function" then
            return nil, "Executor doesn't support custom files (getcustomasset)"
        end

        if text:match("^https?://") then
            EnsureDir()
            local ok, body = pcall(function() return game:HttpGet(text) end)
            if not ok or type(body) ~= "string" or #body == 0 then
                body = nil
                local req = GetRequest()
                if req then
                    local ok2, res = pcall(req, { Url = text, Method = "GET" })
                    if ok2 and type(res) == "table" and type(res.Body) == "string" then body = res.Body end
                end
            end
            if type(body) ~= "string" or #body == 0 then return nil, "Download failed (check the link)" end
            if #body > MAX_BYTES then return nil, "Image too large (max 4 MB)" end
            local ext = ImageExt(body)
            if not ext then return nil, "Not a PNG/JPG image (.cur / .gif / .webp are not supported)" end
            local path = CURSOR_DIR .. "/url_" .. Hash(text) .. "." .. ext
            if not pcall(writefile, path, body) then return nil, "Could not save image to workspace" end
            local okA, asset = pcall(toAsset, path)
            if okA and asset then return asset end
            return nil, "getcustomasset failed"
        end

        for _, path in ipairs({ CURSOR_DIR .. "/" .. text, text }) do
            local okF, exists = pcall(isfile, path)
            if okF and exists then
                local okR, body = pcall(readfile, path)
                if not okR or not ImageExt(body) then return nil, "File is not a PNG/JPG image" end
                local okA, asset = pcall(toAsset, path)
                if okA and asset then return asset end
                return nil, "getcustomasset failed"
            end
        end
        return nil, "File not found: " .. CURSOR_DIR .. "/" .. text
    end

    local gui, cursorImg, modalBtn
    local function BuildGui()
        gui = Instance.new("ScreenGui")
        gui.Name = "AotrUpdate5Cursor"
        gui.ResetOnSpawn = false
        gui.DisplayOrder = 2147483647
        gui.IgnoreGuiInset = true
        gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        gui.Enabled = false
        local parented = false
        for _, getParent in ipairs({
            function() return type(gethui) == "function" and gethui() or nil end,
            function() return game:GetService("CoreGui") end,
            function() return PlayerGui end,
        }) do
            local okP, parent = pcall(getParent)
            if okP and parent and pcall(function() gui.Parent = parent end) and gui.Parent then
                parented = true
                break
            end
        end
        if not parented then gui:Destroy() gui = nil return end

        modalBtn = Instance.new("TextButton")
        modalBtn.Name = "Unlock"
        modalBtn.Text = ""
        modalBtn.BackgroundTransparency = 1
        modalBtn.Size = UDim2.fromOffset(0, 0)
        modalBtn.Modal = false
        modalBtn.Parent = gui

        cursorImg = Instance.new("ImageLabel")
        cursorImg.Name = "Cursor"
        cursorImg.BackgroundTransparency = 1
        cursorImg.BorderSizePixel = 0
        cursorImg.Active = false
        cursorImg.ZIndex = 1000
        cursorImg.Image = imageAsset
        cursorImg.Size = UDim2.fromOffset(C.Size, C.Size)
        pcall(function() cursorImg.Interactable = false end)
        cursorImg.Parent = gui
    end
    BuildGui()

    local origIcon = nil
    local function RestoreIcon()
        if origIcon ~= nil then
            pcall(function() UIS.MouseIconEnabled = origIcon end)
            origIcon = nil
        end
    end
    local function MenuOpen()
        local ok, minimized = pcall(function() return Window.Minimized end)
        return ok and not minimized
    end

    local conn, lastShow = nil, nil
    local function Teardown()
        if conn then conn:Disconnect() conn = nil end
        RestoreIcon()
        pcall(function() if gui then gui:Destroy() end end)
        gui, cursorImg, modalBtn = nil, nil, nil
    end
    local prevCleanup = _G.AotrUpdate5Cleanup
    _G.AotrUpdate5Cleanup = function()
        pcall(Teardown)
        if type(prevCleanup) == "function" then pcall(prevCleanup) end
    end

    local touchOnly = UIS.TouchEnabled and not UIS.MouseEnabled
    if gui and not touchOnly then
        conn = RunService.RenderStepped:Connect(function()
            if not Alive() then Teardown() return end
            local open = MenuOpen()
            local show = (C.Enabled and (open or not C.MenuOnly)) and true or false
            local wantModal = (C.Unlock and open) and true or false
            local active = show or wantModal
            if active ~= lastShow then
                lastShow = active
                gui.Enabled = active
                if active then
                    if origIcon == nil then origIcon = UIS.MouseIconEnabled end
                else
                    modalBtn.Modal = false
                    RestoreIcon()
                end
            end
            if cursorImg.Visible ~= show then cursorImg.Visible = show end
            if not active then return end
            if modalBtn.Modal ~= wantModal then modalBtn.Modal = wantModal end
            if wantModal and UIS.MouseBehavior ~= Enum.MouseBehavior.Default then
                UIS.MouseBehavior = Enum.MouseBehavior.Default
            end
            if show then
                if UIS.MouseIconEnabled then UIS.MouseIconEnabled = false end
                local p = UIS:GetMouseLocation()
                local s = C.Size
                cursorImg.Size = UDim2.fromOffset(s, s)
                if C.Center then
                    cursorImg.Position = UDim2.fromOffset(p.X - s / 2, p.Y - s / 2)
                else
                    cursorImg.Position = UDim2.fromOffset(p.X, p.Y)
                end
            elseif not UIS.MouseIconEnabled then
                UIS.MouseIconEnabled = true
            end
        end)
    end

    local busy = false
    local function Apply(text)
        if busy then return end
        busy = true
        Status("Loading...")
        local okR, asset, err = pcall(Resolve, text)
        if not okR then err, asset = asset, nil end
        busy = false
        if asset then
            imageAsset = asset
            if cursorImg then cursorImg.Image = asset end
            C.Source = tostring(text or "")
            SaveC()
            Status(C.Source == "" and "Using default cursor" or "Cursor applied")
            return true
        end
        Status("Failed: " .. tostring(err))
        return false
    end

    -- ---------- UI ----------
    local MainForm = TAB:PageSection({
        Title = "🖱️ Mouse cursor",
        Subtitle = "Virtual cursor you can see and click with, even when the game locks your mouse.",
    }):Form()

    local onRow = MainForm:Row()
    onRow:Left():TitleStack({ Title = "Custom Cursor", Subtitle = "Draw a virtual cursor on top of everything." })
    UiSync.Link(onRow:Right():Toggle({
        Value = C.Enabled,
        ValueChanged = function(self, value) C.Enabled = value and true or false SaveC() end
    }), C, "Enabled")

    local menuRow = MainForm:Row()
    menuRow:Left():TitleStack({ Title = "Only While Menu Is Open", Subtitle = "Hide the virtual cursor when the menu is closed." })
    UiSync.Link(menuRow:Right():Toggle({
        Value = C.MenuOnly,
        ValueChanged = function(self, value) C.MenuOnly = value and true or false SaveC() end
    }), C, "MenuOnly")

    local unlockRow = MainForm:Row()
    unlockRow:Left():TitleStack({ Title = "Unlock Mouse In Menu", Subtitle = "Free the mouse while the menu is open so you can click options." })
    UiSync.Link(unlockRow:Right():Toggle({
        Value = C.Unlock,
        ValueChanged = function(self, value) C.Unlock = value and true or false SaveC() end
    }), C, "Unlock")

    local centerRow = MainForm:Row()
    centerRow:Left():TitleStack({ Title = "Center Hotspot", Subtitle = "Click at the image center instead of its top-left corner." })
    UiSync.Link(centerRow:Right():Toggle({
        Value = C.Center,
        ValueChanged = function(self, value) C.Center = value and true or false SaveC() end
    }), C, "Center")

    local sizeRow = MainForm:Row()
    sizeRow:Left():TitleStack({ Title = "Cursor Size", Subtitle = "Size in pixels (12 - 128)." })
    local sizeRight = sizeRow:Right()
    local sizeLabel = sizeRight:Label({ Text = C.Size .. "px" })
    UiSync.Link(sizeRight:Slider({
        Minimum = 12,
        Maximum = 128,
        Value = C.Size,
        ValueChanged = function(self, value)
            C.Size = math.clamp(math.floor((tonumber(value) or 32) + 0.5), 12, 128)
            pcall(function() sizeLabel.Text = C.Size .. "px" end)
            SaveC()
        end
    }), C, "Size", function(_, want)
        pcall(function() sizeLabel.Text = want .. "px" end)
    end)

    local ImgForm = TAB:PageSection({
        Title = "🖼️ Cursor image",
        Subtitle = "Paste an image link, a file name, or a Roblox asset id. PNG / JPG only.",
    }):Form()

    local statusRow = ImgForm:Row()
    statusRow:Left():TitleStack({ Title = "Status", Subtitle = "Result of the last apply." })
    local statusLabel = statusRow:Right():Label({ Text = "Idle" })
    Status = function(text) pcall(function() statusLabel.Text = tostring(text) end) end

    local pending = C.Source
    local srcRow = ImgForm:Row()
    srcRow:Left():TitleStack({
        Title = "Image Source",
        Subtitle = "Link (https://...png), file in workspace/" .. CURSOR_DIR .. "/ (e.g. mycursor.png), or rbxassetid.",
    })
    local okField, field = pcall(function()
        return srcRow:Right():TextField({
            Placeholder = "https://.../cursor.png  |  mycursor.png  |  123456789",
            Value = C.Source,
            TextChanged = function(self, text) pending = tostring(text or "") end,
            ValueChanged = function(self, value) pending = tostring(value or "") end,
        })
    end)

    local applyRow = ImgForm:Row()
    applyRow:Left():TitleStack({ Title = "Apply Image", Subtitle = "Download / load the image and use it as the cursor." })
    local applyBtn = applyRow:Right():Button({ Label = "Apply", Callback = function() end })
    BindButton(applyBtn, function()
        if okField and field and type(field.Value) == "string" and field.Value ~= "" then pending = field.Value end
        Apply(pending)
    end)

    local resetRow = ImgForm:Row()
    resetRow:Left():TitleStack({ Title = "Reset Image", Subtitle = "Go back to the default Roblox arrow." })
    local resetBtn = resetRow:Right():Button({ Label = "Reset", Callback = function() end })
    BindButton(resetBtn, function()
        pending = ""
        if okField and field then pcall(function() field.Value = "" end) end
        Apply("")
    end)

    local folderRow = ImgForm:Row()
    folderRow:Left():TitleStack({ Title = "Image Folder", Subtitle = "Put your own PNG/JPG here, then type its file name above." })
    folderRow:Right():Label({ Text = "workspace/" .. CURSOR_DIR })

    if touchOnly then
        Status("Mobile/touch device: virtual cursor is PC only")
    elseif C.Source ~= "" then
        task.spawn(function() Apply(C.Source) end)
    end
end)


ConfigTab = SettingsCategory:Tab({
    Title = "Config",
    Icon = Icon("folderBadgeGearshape", "folderFill", "folder")
})
do
    local ConfigSection = ConfigTab:PageSection({
        Title = "📁 Configuration",
        Subtitle = "Save your settings under a name (e.g. FarmBoss)."
    })
    local ConfigForm = ConfigSection:Form()
    local typedName = ""
    local selectedName = nil
    local currentOptions = { "---" }
    local ListBtn
    local RefreshList
    local function AddRow(title, subtitle)
        local row = ConfigForm:Row()
        row:Left():TitleStack({ Title = title, Subtitle = subtitle })
        return row:Right()
    end
    local function AddButtonRow(title, subtitle, label, fn, state)
        local right = AddRow(title, subtitle)
        local props = { Label = label, Callback = function() end }
        if state then props.State = state end
        local ok, btn = pcall(function() return right:Button(props) end)
        if not ok then
            props.State = nil
            btn = right:Button(props)
        end
        BindButton(btn, fn)
        return btn
    end
    local StatusLabel = AddRow("Status", "Result of the last action."):Label({
        Text = canSave and "Ready" or "Can't save files"
    })
    local function SetCfgStatus(text)
        pcall(function() StatusLabel.Text = tostring(text) end)
    end
    local ActiveLabel, AutoloadLabel
    local function UpdateActiveLabel()
        pcall(function()
            local name = ConfigStore.Active()
            if not name then ActiveLabel.Text = "none" return end
            local dirty = ConfigStore.IsDirty(HubConfig)
            if ConfigStore.IsDefault(name) then
                ActiveLabel.Text = dirty and (name .. "  (modified)") or name
            else
                ActiveLabel.Text = dirty and (name .. "  (unsaved)") or name
            end
        end)
    end
    local function UpdateAutoloadLabel()
        pcall(function() AutoloadLabel.Text = ConfigStore.Autoload() or "none" end)
    end
    local function CleanName(text)
        local t = tostring(text or "")
        t = t:gsub('[%c/\\:*?"<>|]', "")
        t = t:gsub("^%s+", "")
        t = t:gsub("%s+$", "")
        if #t == 0 or not utf8.len(t) then return nil end
        if utf8.len(t) > 40 then t = t:sub(1, utf8.offset(t, 41) - 1) end
        return t
    end
    local function ApplyLook(ui)
        if type(ui) ~= "table" then return end
        local lookChanged = false
        if table.find(AccentOrder, ui.Theme) and ui.Theme ~= CurrentThemeName then
            CurrentThemeName = ui.Theme
            lookChanged = true
        end
        if (ui.Accent == FOLLOW_THEME or table.find(AccentOrder, ui.Accent)) and ui.Accent ~= CurrentAccentName then
            CurrentAccentName = ui.Accent
            lookChanged = true
        end
        pcall(function()
            local ti = table.find(colorOptions, CurrentThemeName) or 1
            ThemeColorBtn.Value = ti
            ThemeColorBtn.Label = colorOptions[ti]
        end)
        pcall(function()
            local ai = table.find(accentOptions, CurrentAccentName) or 1
            AccentColorBtn.Value = ai
            AccentColorBtn.Label = accentOptions[ai]
        end)
        if lookChanged then pcall(ApplyAppearance) end
        if type(ui.UIBlur) == "boolean" then
            pcall(function()
                Window.UIBlur = ui.UIBlur
                UiSync.Blur.Value = ui.UIBlur
            end)
        end
        if type(ui.Dropshadow) == "boolean" then
            pcall(function()
                Window.Dropshadow = ui.Dropshadow
                UiSync.Shadow.Value = ui.Dropshadow
            end)
        end
        if type(ui.Keybind) == "string" then
            pcall(function()
                local key = Enum.KeyCode[ui.Keybind]
                if key then
                    currentKeybind = key
                    UiSync.Hotkey.Value = key
                end
            end)
        end
    end
    ConfigStore.UIApplier = ApplyLook
    ConfigStore.GetUI = function()
        return {
            Theme = CurrentThemeName,
            Accent = CurrentAccentName,
            UIBlur = Window.UIBlur and true or false,
            Dropshadow = Window.Dropshadow and true or false,
            Keybind = currentKeybind and currentKeybind.Name or "LeftAlt",
        }
    end
    ActiveLabel = AddRow("Config in use", "The config you picked or created. Your changes belong to this config."):Label({ Text = "none" })
    local AutoSyncToggle = AddRow("Auto-save into config", "ON: every change is saved into the config in use by itself. OFF: only when you press Enter Save Config."):Toggle({
        Value = ConfigStore.AutoSync(),
        ValueChanged = function(self, value)
            value = value and true or false
            if value == ConfigStore.AutoSync() then return end
            ConfigStore.SetAutoSync(value)
            if value then ConfigStore.SyncActive(HubConfig) end
            UpdateActiveLabel()
            SetCfgStatus(value and "Auto-save is ON" or "Auto-save is OFF - use Enter Save Config")
        end
    })
    AddButtonRow("Enter Save Config", "Save the current switches into the config in use.", "Save", function()
        local name = ConfigStore.Active()
        if not name then SetCfgStatus("No config in use - Create or Load one first") return end
        if ConfigStore.IsDefault(name) then SetCfgStatus("Default config is read-only - Create your own config") return end
        if not canSave then SetCfgStatus("Executor can't save files") return end
        local ok = ConfigStore.SaveActive(HubConfig)
        UpdateActiveLabel()
        SetCfgStatus(ok and ("Saved to: " .. name) or "Save failed")
    end)
    AddRow("Config name", "Type a name, then press Create."):TextField({
        Placeholder = "Config name",
        Value = "",
        TextChanged = function(self, text) typedName = text end,
        ValueChanged = function(self, value) typedName = value end,
    })
    AddButtonRow("Create config", "Save the current switches under the name above and start using it.", "Create", function()
        local name = CleanName(typedName)
        if not name then SetCfgStatus("Type a config name first") return end
        if ConfigStore.Exists(name) then SetCfgStatus("That name already exists - pick another name") return end
        if not canSave then SetCfgStatus("Executor can't save files") return end
        ConfigStore.SyncActive(HubConfig)
        local ok = ConfigStore.Put(name, ConfigStore.Snapshot(HubConfig))
        if ok then ConfigStore.SetActive(name) end
        RefreshList(name)
        UpdateActiveLabel()
        SetCfgStatus(ok and ("Created: " .. name) or "Save failed")
    end)
    local ListRow = ConfigForm:Row()
    ListRow:Left():TitleStack({ Title = "Config list", Subtitle = "Choose a saved config." })
    ListBtn = ListRow:Right():PullDownButton({
        Label = "---",
        Options = currentOptions,
        Value = 1,
        ValueChanged = function(self, index)
            local name = currentOptions[index]
            selectedName = (index and index > 1) and name or nil
            self.Label = name or "---"
        end
    })
    StyleDropdown(ListBtn)
    RefreshList = function(keepName)
        local opts = { "---" }
        for _, n in ipairs(ConfigStore.Names()) do opts[#opts + 1] = n end
        currentOptions = opts
        local idx = (keepName and table.find(opts, keepName)) or 1
        selectedName = idx > 1 and opts[idx] or nil
        pcall(function()
            ListBtn.Options = opts
            ListBtn.Value = idx
            ListBtn.Label = opts[idx]
        end)
    end
    AddButtonRow("Load config", "Switch to the selected config and apply its switches.", "Load", function()
        if not selectedName then SetCfgStatus("Select a config first") return end
        local snap = ConfigStore.Get(selectedName)
        if not snap then SetCfgStatus("Config not found - press Refresh list") return end
        local dropped = ConfigStore.Active() ~= nil and not ConfigStore.AutoSync() and ConfigStore.IsDirty(HubConfig)
        ConfigStore.SyncActive(HubConfig)
        ConfigStore.SetActive(selectedName)
        ConfigStore.ApplyCfg(snap)
        ConfigStore.ApplyHub(HubConfig, snap)
        Save()
        UiSync.Refresh()
        ConfigStore.ApplyUI(snap)
        UpdateActiveLabel()
        SetCfgStatus("Loaded: " .. selectedName .. (dropped and "  (unsaved changes dropped)" or ""))
    end)
    AddButtonRow("Delete config", "Delete the selected config.", "Delete", function()
        if not selectedName then SetCfgStatus("Select a config first") return end
        local name = selectedName
        if ConfigStore.IsDefault(name) then SetCfgStatus("The default config can't be deleted") return end
        ConfigStore.Delete(name)
        RefreshList(nil)
        UpdateActiveLabel()
        UpdateAutoloadLabel()
        SetCfgStatus("Deleted: " .. name)
    end)
    AddButtonRow("Refresh list", "Reload the saved configs from file.", "Refresh", function()
        ConfigStore.Reload()
        RefreshList(selectedName)
        UpdateActiveLabel()
        UpdateAutoloadLabel()
        pcall(function() AutoSyncToggle.Value = ConfigStore.AutoSync() end)
        SetCfgStatus("List refreshed")
    end)
    AddButtonRow("Set as autoload", "Load the selected config automatically every time the script starts.", "Set", function()
        if not selectedName then SetCfgStatus("Select a config first") return end
        local ok = ConfigStore.SetAutoload(selectedName)
        UpdateAutoloadLabel()
        SetCfgStatus(ok and ("Autoload: " .. selectedName) or "Save failed")
    end)
    AddButtonRow("Reset autoload", "Stop loading a config automatically.", "Reset", function()
        ConfigStore.SetAutoload(nil)
        UpdateAutoloadLabel()
        SetCfgStatus("Autoload reset")
    end)
    AutoloadLabel = AddRow("Current autoload config", "Loaded when the script starts."):Label({ Text = "none" })
    -- ============================================================
    -- ============================================================
    SH.Guard("config-share", function()
        local PREFIX = "SHCFG1:"
        local SHARE_DIR = "AotrUpdate5/Share"
        local MAX_CODE = 300000
        local B64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
        local B64REV = {}
        for i = 1, #B64 do B64REV[B64:byte(i)] = i - 1 end

        local function b64enc(data)
            local out = {}
            for i = 1, #data, 3 do
                local a, b, c = data:byte(i, i + 2)
                local v = a * 65536 + (b or 0) * 256 + (c or 0)
                local c1 = bit32.rshift(v, 18) % 64
                local c2 = bit32.rshift(v, 12) % 64
                local c3 = bit32.rshift(v, 6) % 64
                local c4 = v % 64
                out[#out + 1] = B64:sub(c1 + 1, c1 + 1) .. B64:sub(c2 + 1, c2 + 1)
                    .. (b and B64:sub(c3 + 1, c3 + 1) or "=") .. (c and B64:sub(c4 + 1, c4 + 1) or "=")
            end
            return table.concat(out)
        end
        local function b64dec(s)
            s = (s:gsub("[^%w%+/=]", ""))
            local out = {}
            for i = 1, #s, 4 do
                local a, b, c, d = s:byte(i, i + 3)
                local va, vb = B64REV[a], B64REV[b or 0]
                if not va or not vb then return nil end
                local vc = (c and c ~= 61) and B64REV[c] or nil
                local vd = (d and d ~= 61) and B64REV[d] or nil
                local v = va * 262144 + vb * 4096 + (vc or 0) * 64 + (vd or 0)
                out[#out + 1] = string.char(bit32.rshift(v, 16) % 256)
                if vc then out[#out + 1] = string.char(bit32.rshift(v, 8) % 256) end
                if vd then out[#out + 1] = string.char(v % 256) end
            end
            return table.concat(out)
        end

        local function SameVal(x, y)
            if type(x) ~= type(y) then return false end
            if type(x) == "table" then
                if #x ~= #y then return false end
                for i = 1, #x do if x[i] ~= y[i] then return false end end
                return true
            end
            return x == y
        end
        local function Delta(cur, base)
            local out = {}
            base = base or {}
            for k, v in pairs(cur or {}) do
                if not SameVal(v, base[k]) then out[k] = v end
            end
            return out
        end
        local function CopyVal(v)
            if type(v) ~= "table" then return v end
            local o = {}
            for i, x in ipairs(v) do o[i] = x end
            return o
        end
        local function DefaultSnap()
            return ConfigStore.Get(ConfigStore.DEFAULT_NAME) or { Cfg = {}, Hub = {}, UI = {} }
        end
        local function CleanMap(src)
            local out = {}
            if type(src) ~= "table" then return out end
            for k, v in pairs(src) do
                if type(k) == "string" and #k <= 60 then
                    local t = type(v)
                    if t == "boolean" or (t == "number" and v == v and v > -1e12 and v < 1e12) or (t == "string" and #v <= 500) then
                        out[k] = v
                    elseif t == "table" and #v <= 50 then
                        local arr = {}
                        for _, item in ipairs(v) do
                            if type(item) == "string" and #item <= 100 then arr[#arr + 1] = item end
                        end
                        out[k] = arr
                    end
                end
            end
            return out
        end

        local function BuildCode(name)
            local snap = name and ConfigStore.Get(name)
            if not snap then
                snap = ConfigStore.Snapshot(HubConfig)
                name = ConfigStore.Active() or "Shared"
            end
            local def = DefaultSnap()
            local payload = {
                n = name,
                c = Delta(snap.Cfg, def.Cfg),
                h = Delta(snap.Hub, def.Hub),
                u = Delta(snap.UI, def.UI),
            }
            local ok, json = pcall(function() return HttpService:JSONEncode(payload) end)
            if not ok then return nil end
            return PREFIX .. b64enc(json), name
        end

        local function ReadSource(text)
            text = tostring(text or ""):match("^%s*(.-)%s*$")
            if text == "" then return nil, "Paste a share code, link or file name first" end
            if text:match("^https?://") then
                local ok, body = pcall(function() return game:HttpGet(text) end)
                if not ok or type(body) ~= "string" or body == "" then return nil, "Download failed (check the link)" end
                return body
            end
            if text:find(PREFIX, 1, true) then return text end
            if text:find("{", 1, true) and text:find("=", 1, true) then return text end
            if type(isfile) == "function" and type(readfile) == "function" then
                for _, p in ipairs({ SHARE_DIR .. "/" .. text, SHARE_DIR .. "/" .. text .. ".txt", text }) do
                    local okF, ex = pcall(isfile, p)
                    if okF and ex then
                        local okR, body = pcall(readfile, p)
                        if okR and type(body) == "string" then return body end
                    end
                end
            end
            return nil, "Not a valid share code, link or file"
        end

        local function Decode(raw)
            raw = (tostring(raw):gsub("%s", ""))
            local i = raw:find(PREFIX, 1, true)
            if not i then return nil, "Not a Aotr:Update[5] share code" end
            raw = raw:sub(i + #PREFIX)
            if #raw > MAX_CODE then return nil, "Code is too large" end
            local json = b64dec(raw)
            if not json or json == "" then return nil, "Code is damaged" end
            local ok, data = pcall(function() return HttpService:JSONDecode(json) end)
            if not ok or type(data) ~= "table" then return nil, "Code is damaged" end
            return data
        end

        local function Fit(delta, base, into)
            for k, v in pairs(CleanMap(delta)) do
                local b = base and base[k]
                if b ~= nil and type(b) == type(v) then into[k] = CopyVal(v) end
            end
        end

        local function ImportText(text)
            local raw, err = ReadSource(text)
            if not raw then return nil, err end
            local def = DefaultSnap()
            local snap = { Cfg = {}, Hub = {}, UI = {} }
            for k, v in pairs(def.Cfg or {}) do snap.Cfg[k] = CopyVal(v) end
            for k, v in pairs(def.Hub or {}) do snap.Hub[k] = v end
            for k, v in pairs(def.UI or {}) do snap.UI[k] = v end
            local base, summary
            if raw:find(PREFIX, 1, true) then
                local data, err2 = Decode(raw)
                if not data then return nil, err2 end
                Fit(data.c, def.Cfg, snap.Cfg)
                Fit(data.h, def.Hub, snap.Hub)
                Fit(data.u, def.UI, snap.UI)
                base = CleanName(type(data.n) == "string" and data.n or "") or "Shared"
            else
                local tbl, perr = SH.Legacy.Parse(raw)
                if not tbl then return nil, perr end
                local res = SH.Legacy.Translate(tbl)
                if #res.applied == 0 then return nil, "No supported settings found in that config" end
                Fit(res.cfg, def.Cfg, snap.Cfg)
                Fit(res.hub, def.Hub, snap.Hub)
                base = "Imported Config"
                summary = SH.Legacy.Summary(res)
                if #res.skipped > 0 then SH.say("Not supported (skipped): " .. table.concat(res.skipped, ", ")) end
            end
            local name, n = base, 1
            while ConfigStore.Exists(name) do
                n = n + 1
                name = base .. " (" .. n .. ")"
            end
            local ok = ConfigStore.Put(name, snap)
            return name, nil, ok, summary
        end

        local hasClip = type(setclipboard) == "function" or type(toclipboard) == "function"
            or (syn and syn.write_clipboard ~= nil) or (Clipboard and Clipboard.set ~= nil)

        local ShareForm = ConfigTab:PageSection({
            Title = "📤 Share config",
            Subtitle = "Send your config to friends with a short code, or import one. Codes hold only your switches (no Webhook URL).",
        }):Form()
        local function Row2(title, subtitle)
            local row = ShareForm:Row()
            row:Left():TitleStack({ Title = title, Subtitle = subtitle })
            return row:Right()
        end
        local shareStatus = Row2("Share status", "Result of the last share / import."):Label({ Text = "Ready" })
        local function Say(text)
            SetCfgStatus(text)
            pcall(function() shareStatus.Text = tostring(text) end)
        end
        local function Btn2(title, subtitle, label, fn)
            local btn = Row2(title, subtitle):Button({ Label = label, Callback = function() end })
            BindButton(btn, fn)
            return btn
        end

        Btn2("Copy share code", "Copies the selected config (or your current switches if none is selected). Paste it in Discord.", "Copy", function()
            local code, name = BuildCode(selectedName)
            if not code then Say("Could not build the code") return end
            local savedFile = false
            if canSave and type(writefile) == "function" then
                pcall(function()
                    if type(makefolder) == "function" and type(isfolder) == "function" then
                        if not isfolder("AotrUpdate5") then makefolder("AotrUpdate5") end
                        if not isfolder(SHARE_DIR) then makefolder(SHARE_DIR) end
                    end
                    local fname = tostring(name):gsub("[^%w_%- ]", "_")
                    writefile(SHARE_DIR .. "/" .. fname .. ".txt", code)
                    savedFile = true
                end)
            end
            if hasClip then
                CopyText(code)
                Say("Copied \"" .. tostring(name) .. "\" (" .. #code .. " chars)" .. (#code > 1900 and " - too long for a normal Discord message, send as a .txt file" or ""))
            elseif savedFile then
                Say("No clipboard - saved to workspace/" .. SHARE_DIR .. "/")
            else
                Say("No clipboard and can't save files")
            end
        end)

        local pending = ""
        Row2("Import code / link / file", "Paste a share code, a getgenv().Configs text, a link to a .txt, or a file name from workspace/" .. SHARE_DIR .. "/"):TextField({
            Placeholder = "SHCFG1:...  |  getgenv().Configs = {...}  |  https://...  |  file.txt",
            Value = "",
            TextChanged = function(self, text) pending = tostring(text or "") end,
            ValueChanged = function(self, value) pending = tostring(value or "") end,
        })
        Btn2("Import config", "Adds it to your Config list. Pick it in Config list and press Load to use it.", "Import", function()
            Say("Importing...")
            local okR, name, err, saved, summary = pcall(ImportText, pending)
            if not okR then Say("Import failed") return end
            if not name then Say("Failed: " .. tostring(err)) return end
            RefreshList(name)
            UpdateActiveLabel()
            Say("Imported: " .. name .. (summary and (" (" .. summary .. ")") or "") .. (saved == false and " (not saved to file)" or "") .. " - press Load")
        end)
    end)

    UpdateAutoloadLabel()
    UpdateActiveLabel()
    RefreshList(ConfigStore.Active())
    task.spawn(function()
        while Alive() do
            if not ConfigStore.AutoSync() then UpdateActiveLabel() end
            task.wait(1)
        end
    end)
    function UiSync.ResetAll()
        ConfigStore.SyncActive(HubConfig)
        ConfigStore.SetActive(nil)
        UpdateActiveLabel()
        for key, value in pairs(UiSync.Defaults.Cfg) do
            if type(value) == "table" then
                local copy = {}
                for i, item in ipairs(value) do copy[i] = item end
                Cfg[key] = copy
            else
                Cfg[key] = value
            end
        end
        for key, value in pairs(UiSync.Defaults.Hub) do HubConfig[key] = value end
        Save()
        UiSync.Refresh()
        pcall(Farm.Fps.Apply)
        ApplyLook(ConfigStore.DEFAULT_LOOK)
    end
    local resetArmedAt = 0
    AddButtonRow("Reset to defaults", "Set every switch, slider and the window look back to the default values (same as \"Aotr:Update[5] | Default\"). Saved configs are NOT deleted.", "Reset", function()
        if os.clock() - resetArmedAt > 5 then
            resetArmedAt = os.clock()
            SetCfgStatus("Press Reset again within 5s to confirm")
            return
        end
        resetArmedAt = 0
        UiSync.ResetAll()
        SetCfgStatus("Everything is back to the default values")
    end, "Destructive")
    SettingsStore.OnSaved = function()
        ConfigStore.SyncActive(HubConfig)
    end
end
SettingsStore.StartAutoSave("AOTR", function()
    return {
        Cfg = Cfg,
        Hub = HubConfig,
        UI = {
            Theme = CurrentThemeName,
            Accent = CurrentAccentName,
            UIBlur = Window.UIBlur,
            Dropshadow = Window.Dropshadow,
            Keybind = currentKeybind and currentKeybind.Name or "LeftAlt",
        },
    }
end)
saveHook = function()
    SettingsStore.Flush("AOTR")
    ConfigStore.SyncActive(HubConfig)
end
UserInputService.JumpRequest:Connect(function()
    if Alive() and HubConfig.InfiniteJump then
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)
LocalPlayer.Idled:Connect(function()
    if Alive() and HubConfig.AntiAFK then
        pcall(function()
            local VirtualUser = game:GetService("VirtualUser")
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new(0, 0))
        end)
    end
end)
pcall(function()
    local errorPrompt = game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui", true)
    if errorPrompt then
        errorPrompt.ChildAdded:Connect(function(child)
            if child.Name == "promptOverlay" then
                task.wait(1)
                if Alive() and HubConfig.AutoRejoin then
                    TeleportService:Teleport(HOP_PLACE_ID, LocalPlayer)
                end
            end
        end)
    end
end)
local function CheckAdmin(player)
    if player == LocalPlayer or not HubConfig.AntiAdmin then return end
    pcall(function()
        if player:GetRankInGroup(game.CreatorId) >= 250 or player.UserId == game.CreatorId then
            HopServer()
        end
    end)
end
Players.PlayerAdded:Connect(function(player) if Alive() then CheckAdmin(player) end end)
task.spawn(function()
    while Alive() do
        task.wait(3)
        if HubConfig.AntiAdmin then
            for _, player in ipairs(Players:GetPlayers()) do
                CheckAdmin(player)
            end
        end
    end
end)
task.spawn(function()
    while Alive() do
        pcall(Farm.Fps.Reassert)
        task.wait(1)
    end
end)
end
Cascade.FlushAll()
if SH.DEV then
    _G.AotrUpdate5Farm = SH.Farm
    _G.AotrUpdate5Spin = SH.Spin
end
SH.say("Loaded successfully (" .. (IN_MENU and "Lobby" or "In-game") .. ").")