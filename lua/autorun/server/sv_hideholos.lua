util.AddNetworkString( "update_hologram_visibility_preference" )
util.AddNetworkString( "get_user_hologram_visibility_preference" )

-- Updates the visibility of all holos for a specific player
local function updateHoloVisibility( ply )
    for _, holo in pairs( ents.FindByClass( "gmod_wire_hologram" ) ) do
        holo:SetPreventTransmit( ply, ply.cfc_holosDisabled )
    end

    net.Start( "update_hologram_visibility_preference" )
        net.WriteBool( ply.cfc_holosDisabled )
    net.Send( ply )
end

net.Receive( "get_user_hologram_visibility_preference", function( len, ply )
    ply.cfc_holosDisabled = net.ReadBool()

    updateHoloVisibility( ply )
end )

-- Initialize the player's cfc_holosDisabled variable and hide all existing holos
local function initializePlayer( ply )
    timer.Create( 5, function()
        net.Start( "get_user_hologram_visibility_preference" )
        net.Send( ply )
    end )
end

hook.Add( "PlayerInitialSpawn", "CFC_HideHolos_initalizePlayer", initializePlayer )

-- Update a player's holo visibility using chat commands
local function getCommands( ply, text )
    if text == "!holodisplay" then
        ply.cfc_holosDisabled = not cfc_holosDisabled

        updateHoloVisibility( ply )
    elseif text == "!displayholos" then
        ply.cfc_holosDisabled = false

        updateHoloVisibility( ply )
    elseif text == "!hideholos" then
        ply.cfc_holosDisabled = true

        updateHoloVisibility( ply )
    end
end

hook.Add( "PlayerSay", "CFC_HideHolos_getCommands", getCommands )

-- When a new hologram is spawned, apply its visibility setting for all players
local function initializeNewHolos( ent )
    local isValidHolo = IsValid( ent ) and ent:GetClass() == "gmod_wire_hologram"

    if isValidHolo then
        for _, ply in pairs( player.GetHumans() ) do
            ent:SetPreventTransmit( ply, ply.cfc_holosDisabled )
        end
    end
end

hook.Add( "OnEntityCreated", "CFC_HideHolos_initializeNewHolos", initializeNewHolos )
