CreateThread(function()
    print("^3[envy-itemconvert]^0 Starting item insertion...")

    for _, v in pairs(Config.Items) do
        MySQL.execute([[
            INSERT IGNORE INTO items 
            (`item`, `label`, `limit`, `can_remove`, `type`, `usable`, `useExpired`, `groupId`, `metadata`, `desc`, `degradation`, `weight`)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ]], {
            v.item, v.label, v.limit, v.can_remove, v.type, v.usable,
            v.useExpired, v.groupId, v.metadata, v.desc, v.degradation, v.weight
        }, function(rowsChanged)
            if rowsChanged and rowsChanged > 0 then
                print("^2[envy-itemconvert]^0 Inserted: ^6" .. v.item .. "^0")
            else
                print("^4[envy-itemconvert]^0 Already exists: ^6" .. v.item .. "^0")
            end
        end)
    end

    print("^2[envy-itemconvert]^0 Finished!")
end)
