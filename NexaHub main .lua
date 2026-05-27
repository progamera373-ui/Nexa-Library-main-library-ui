local NexaLib = {}

function NexaLib:CrearMenu(tituloJuego)
    -- Crear el ScreenGui principal (Protegido para que no se borre fácilmente)
    local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
    sg.Name = "NexaLibrary_UI"
    sg.ResetOnSpawn = false
    
    -- Contenedor principal (El menú flotante compacto)
    local mainframe = Instance.new("Frame", sg)
    mainframe.Size = UDim2.new(0, 230, 0, 320)
    mainframe.Position = UDim2.new(0.4, 0, 0.3, 0)
    mainframe.BackgroundColor3 = Color3.fromRGB(12, 22, 42) -- Fondo azul medianoche oscuro
    mainframe.BorderSizePixel = 0
    mainframe.Active = true
    mainframe.Draggable = true -- Permite arrastrarlo libremente en la pantalla
    
    -- Esquinas redondeadas sutiles estilo Tora IsMe
    local corner = Instance.new("UICorner", mainframe)
    corner.CornerRadius = UDim.new(0, 6)
    
    -- Barra de Título superior (NEXA LIBRARY)
    local titleLabel = Instance.new("TextLabel", mainframe)
    titleLabel.Size = UDim2.new(1, 0, 0, 32)
    titleLabel.Text = "  " .. tituloJuego:upper()
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundColor3 = Color3.fromRGB(8, 14, 28) -- Azul más profundo para el encabezado
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextSize = 14
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local titleCorner = Instance.new("UICorner", titleLabel)
    titleCorner.CornerRadius = UDim.new(0, 6)

    -- Lista interna con Scroll para añadir infinitas opciones
    local list = Instance.new("ScrollingFrame", mainframe)
    list.Size = UDim2.new(1, -12, 1, -65)
    list.Position = UDim2.new(0, 6, 0, 38)
    list.BackgroundTransparency = 1
    list.CanvasSize = UDim2.new(0, 0, 0, 0)
    list.ScrollBarThickness = 3
    list.ScrollBarImageColor3 = Color3.fromRGB(25, 45, 85)
    list.AutomaticCanvasSize = Enum.AutomaticCanvasSize.Y
    
    local layout = Instance.new("UIListLayout", list)
    layout.Padding = UDim.new(0, 6)
    
    -- Marca de agua inferior fija en el menú (Créditos)
    local footer = Instance.new("TextLabel", mainframe)
    footer.Size = UDim2.new(1, 0, 0, 20)
    footer.Position = UDim2.new(0, 0, 1, -20)
    footer.Text = "Powered by NEXA LIBRARY"
    footer.TextColor3 = Color3.fromRGB(70, 100, 150) -- Azul tenue para que no distraiga
    footer.BackgroundTransparency = 1
    footer.Font = Enum.Font.SourceSansBold
    footer.TextSize = 11

    -- Funciones de la librería
    local items = {}
    
    -- Función para agregar Checkboxes idénticos a los de la foto
    function items:AddCheckbox(textoOpcion, callback)
        local boxFrame = Instance.new("Frame", list)
        boxFrame.Size = UDim2.new(1, 0, 0, 30)
        boxFrame.BackgroundTransparency = 1
        
        -- Texto de la función (ej. "Perfect Kick & Claim")
        local label = Instance.new("TextLabel", boxFrame)
        label.Size = UDim2.new(1, -35, 1, 0)
        label.Position = UDim2.new(0, 4, 0, 0)
        label.Text = textoOpcion
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.Font = Enum.Font.SourceSansBold
        label.TextSize = 14
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.BackgroundTransparency = 1
        
        -- El cuadro del botón Checkbox
        local checkButton = Instance.new("TextButton", boxFrame)
        checkButton.Size = UDim2.new(0, 18, 0, 18)
        checkButton.Position = UDim2.new(1, -24, 0, 6)
        checkButton.BackgroundColor3 = Color3.fromRGB(22, 35, 62) -- Azul base del recuadro
        checkButton.BorderColor3 = Color3.fromRGB(40, 65, 110)
        checkButton.Text = "" 
        checkButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- COLOR DE LA PALOMITA BLANCA
        checkButton.Font = Enum.Font.SourceSansBold
        checkButton.TextSize = 16
        
        local checkCorner = Instance.new("UICorner", checkButton)
        checkCorner.CornerRadius = UDim.new(0, 3)
        
        local activado = false
        checkButton.MouseButton1Click:Connect(function()
            activado = not activado
            if activado then
                checkButton.Text = "✓" -- Marca blanca activa
                checkButton.BackgroundColor3 = Color3.fromRGB(35, 60, 105) -- Azul de activación
            else
                checkButton.Text = "" -- Vacío
                checkButton.BackgroundColor3 = Color3.fromRGB(22, 35, 62)
            end
            callback(activado)
        end)
    end
    
    return items
end

return NexaLib
