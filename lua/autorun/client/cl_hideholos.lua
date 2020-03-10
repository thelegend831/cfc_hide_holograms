
net.Receive( "CFC_UpdateHoloPreference", function( len )
    local holoEnabled = net.ReadBool()

    cookie.Set( "CFC_HologramPreference", holoEnabled )
end )

net.Receive( "CFC_GetHoloPreference", function( len )
    local chip = cookie.GetNumber( "CFC_HologramPreference", 0 ) ~= 0

    net.Start( "CFC_GetHoloPreference" )
        net.WriteBool( chip )
    net.SendToServer()
end)