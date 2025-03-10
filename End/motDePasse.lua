
local caracteres = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()"

function generateur(longueur)
    local test = ""  
    for i = 1, longueur do
        local aleatoire = math.random(1, #caracteres) 
        test = test .. caracteres:sub(aleatoire, aleatoire)     
    end
    return test
end
print(generateur(12))




