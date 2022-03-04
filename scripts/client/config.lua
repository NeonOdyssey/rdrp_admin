Config = {}

-------------------------
-- Delete vehicle config 
-------------------------
Config.Dv = {    
    CloseOnToggle   = false,     -- Choose to close the admin panel when toggling noclip
}


-------------------------
-- Noclip config 
-------------------------
Config.Noclip = {    
    CloseOnToggle   = true,     -- Choose to close the admin panel when toggling noclip
    Ghost           = true     -- Choose to go invisible when toggling noclip
}


-------------------------
-- Ghost config 
-------------------------
Config.Ghost = {
    CloseOnToggle   = false     -- Choose to close the admin panel when toggling visability
}



-------------------------
-- Permissions config 
-------------------------
-- Mod      (Support staff)
-- Admin    (Player management)
-- Senior   (Player management / supervisor)
-- Manager  (Staff management / Community UpKeep)
-- Super    (Founders)
-------------------------
Config.Perms = { 

    -- Chat
    Dm = "mod",             -- Direct message players in chat
    Announce = "mod",       -- Global announcement player will be able to see

    -- Tp
    Tp = "admin",           -- Teleport to a specific player
    Tpm = "admin",          -- Teleport to a marker set on map
    Bring = "admin",        -- Bring a player to said admin
    Noclip = "admin",       -- Noclip

    -- Players
    Ghost = "admin",        -- Invisible
    Heal = "admin",         -- Heal / Revive a player
    Spectate = "admin",     -- Spectate a player

    -- World
    Dv = "admin",           -- Delete vehicle from world
    ClearArea = "senior",   -- Clear a specific area from props, entities, vehicle, peds ect

    -- Punishments
    Warn = "mod",           -- Warn a player with a message that they have to acknowladge
    Chain = "admin",        -- Freeze a player in place (really really slow and add prison cloathing)
    Slap = "admin",         -- Slap a player for a set ammount of hp and knockback (may not add)
    Slay = "admin",         -- Kill player on spot
    Kick = "admin",         -- Kick player from server with message
    Ban = "admin",          -- Ban player from server with message
    
    -- Setting players things
    Job = "admin",          -- Set a players job
    Money = "manager",      -- Add/Remove money from player
    Gold = "manager",       -- Add/Remove gold from player
    StaffPerms = "manager", -- Change staff perms on players
    
}