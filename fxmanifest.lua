-- Resource Metadata
fx_version 'adamant'
games {'rdr3'}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
-- dependencies { 'rdrp_core' } -- All resource dependencies


-- Author Metadata
author 'NEO'
description 'RDRP | RDRP Admin script for all of your admin needs'
version 'v0.0'

-- CLient Scripts
shared_scripts {
    'config/client.lua',
    'scripts/client/*.lua'
}

-- Shared Scripts
shared_scripts {
    'config/shared.lua',
    'scripts/shared/*.lua'
}

-- Server Scripts
server_scripts {
    'config/server.lua',
    'scripts/server/*.lua'
}


-- Add all files used in the resource (excluding client / server scripts)
files {

}
