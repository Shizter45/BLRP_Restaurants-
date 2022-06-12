Config = {}

-- quick way to turn off ALL of the blips
Config.ShowBlips = true

-- This sets the marker
-- Go to (https://docs.fivem.net/docs/game-references/markers/) to change it
Config.MarkerIcon = 27

-- Please change these 
Config.Locations = {
    {
        name = 'Example Location',
        coord = vector3(-3158.42, 1095.42, 20.91),
        BlipSprite = 809,
        BlipColor = 5,
        BlipScale = 1.0,
        availableItems = 
        {
            label = 'Test ($150)',
            item = 'cannabis',
            price = '150'
        },

    },
    {
        name = 'House',
        coord = vector3(-2594.65, 1888.17, 171.49),
        BlipSprite = 809,
        BlipColor = 5,
        BlipScale = 1.0,
        availableItems = 
        {
            label = 'TEST ($150)',
            item = 'cannabis',
            price = '150'
        },
    },
}