
net.Receive( "CFC_UpdateHoloPreference", function( len )
    cookie.Set( "cfc_hologram_visibility_preference", net.ReadBool() )
end )

net.Receive( "CFC_GetHoloPreference", function( len )
    local chip = cookie.GetNumber( "cfc_hologram_visibility_preference", 0 ) ~= 0

    net.Start( "CFC_GetHoloPreference" )
        net.WriteBool( chip )
    net.SendToServer()
end)