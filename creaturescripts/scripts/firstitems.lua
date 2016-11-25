local config = {
        [1] = {
                -- Guardian: equipment dwarven shield, spike sword, brass armor, steel helmet, plate legs, leather boots, scarf
                items = {{2525, 1}, {2383, 1}, {2465, 1}, {2457, 1}, {2478, 1}, {2643, 1}, {2661, 1}},
                --container rope, shovel
                container = {{2120, 1}, {2554, 1}}
        },
        [2] = {
                -- Berserker: equipment battle axe, brass armor, steel helmet, brass legs, leather boots, scarf
                items = {{2378, 1}, {2465, 1}, {2457, 1}, {2478, 1}, {2643, 1}, {2661, 1}},
                --container rope, shovel
                container = {{2120, 1}, {2554, 1}}
        },
        [3] = {
                -- Archer: equipment steel shield, crossbow, brass armor, soldier helmet, brass legs, leather boots, scarf
                items = {{2509, 1}, {2455, 1}, {2465, 1}, {2481, 1}, {2478, 1}, {2643, 1}, {2661, 1}, {2543, 1}},
                --container rope, shovel, bolt
                container = {{2120, 1}, {2554, 1}}
        },
        [4] = {
                -- Arcanist: equipment studded shield, throwing star, studded armor, studded helmet, studded legs, leather boots, scarf
                items = {{2526, 1}, {2185, 1}, {2484, 1}, {2482, 1}, {2468, 1}, {2643, 1}, {2661, 1}},
                --container rope, shovel
                container = {{2120, 1}, {2554, 1}}
        },
		[5] = {
                -- Priest: equipment brass shield, gemmed book, brass armor, brass helmet, brass legs, leather boots, scarf
                items = {{2511, 1}, {1976, 1}, {2465, 1}, {2460, 1}, {2478, 1}, {2643, 1}, {2661, 1}},
                --container rope, shovel
                container = {{2120, 1}, {2554, 1}}
        },
		[6] = {
                -- Mage: equipment spellbook, snakebite rod, magician's robe, mage hat, leather legs, leather boots, scarf
                items = {{2175, 1}, {2182, 1}, {8819, 1}, {8820, 1}, {2649, 1}, {2643, 1}, {2661, 1}},
                --container rope, shovel
                container = {{2120, 1}, {2554, 1}}
        }
}

function onLogin(cid)
    local player = Player(cid)
    local targetVocation = config[player:getVocation():getId()]
    if not targetVocation then
        return true
    end

    if player:getLastLoginSaved() ~= 0 then
        return true
    end

    for i = 1, #targetVocation.items do
        player:addItem(targetVocation.items[i][1], targetVocation.items[i][2])
    end

    local backpack = player:addItem(1988)
    if not backpack then
        return true
    end

    for i = 1, #targetVocation.container do
        backpack:addItem(targetVocation.container[i][1], targetVocation.container[i][2])
    end
    return true
end