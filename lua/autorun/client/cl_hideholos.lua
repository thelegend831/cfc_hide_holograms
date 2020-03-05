
net.Receive( "update_hologram_visibility_preference", function( len )
    cookie.Set( "cfc_hologram_visibility_preference", net.ReadBool() )
end )

net.Receive( "get_user_hologram_visibility_preference", function( len )
    local chip = cookie.GetNumber( "cfc_hologram_visibility_preference", 0 )

    net.Start( "get_user_hologram_visibility_preference" )
        net.WriteBool( chip )
    net.SendToServer()
end)