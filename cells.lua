function ParseCells(cells)
    local Cells = {}
    for i,v in pairs(cells) do
        success, error = pcall(function()
            Color3.fromHex(v)
        end)
        if not success then
            table.insert(Cells, "ffffff")
            warn(v, success, 'hex failure | replacing with ffffff')
        else
            table.insert(Cells, v)
        end
    end
    return Cells
end

function SaveArt(name, cells)
    local data = {}
    data.Cells = ParseCells(cells)
    data.FrameColor = "ffffff"
    data.Name = name
    game:GetService("ReplicatedStorage").Remotes.CreateArt:InvokeServer(data)
end
