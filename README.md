# CFC Hide Holograms

## Overview
Holograms can cause an immense amount of client lag, especially when exploited. Simply no-drawing them isn't sufficient; to completely remove the clientside impact of holograms, we must instruct the server to stop sending any data about the holograms to the client.

This addon accomplishes this by allowing clients to issue chat commands to enable or disable holograms. When disabled, the server doesn't even tell the client that the holograms exist. To the client, it's as if they had noclipped out of the world (when nothing on the world is rendered at all), granting them increased performance when holograms are being used.

### Chat Commands
- `!holodisplay` - Toggles from being active and inactive depending on the current state.
- `!displayholos` - Enables the viewing of holograms
- `!hideholos` - Disables the viewing of holograms

## Installation
Clone or download this repository into your `garrysmod/addons` folder and then restart your server or game.
