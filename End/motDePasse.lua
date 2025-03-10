local caracteres = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()"
local test = ""

function generateur (longueur)
    for i = 1, longueur do 
        local aleatoire = math.random(1, #caracteres)
         test = test .. caracteres:sub(aleatoire, aleatoire)
    end 
    return test
end
print(generateur(12))


