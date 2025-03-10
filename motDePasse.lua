local caracteres = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
local caracteresSpeciaux = "!@#$%^&*()"

-- genere un mot de passe aléatoire
function generateur(longueur, speciaux)
    local selectionCaratere = caracteres
    if speciaux then 
        selectionCaratere = caracteres .. caracteresSpeciaux
    end

    local MotDePasse = ""  
    for i = 1, longueur do
        local aleatoire = math.random(1, #selectionCaratere) 
        MotDePasse = MotDePasse .. selectionCaratere:sub(aleatoire, aleatoire)     
    end
    return MotDePasse
end
-- genere le mot de passe
local mdp = generateur(12, true)  

-- fonction qui verifie les critère demander 
function verifMotDePasse(MotDePasse)
    local contientMajuscule = MotDePasse:match("%u") ~= nil  
    local contientMinuscule = MotDePasse:match("%l") ~= nil  
    local contientSpeciaux = MotDePasse:match("[!@#$%^&*()]") ~= nil  
    local contientChiffre = MotDePasse:match("%d") ~= nil  

    print("Contient une majuscule ? " .. tostring(contientMajuscule))
    print("Contient une minuscule ? " .. tostring(contientMinuscule))
    print("Contient un caractère spécial ? " .. tostring(contientSpeciaux))
    print("Contient un chiffre ? " .. tostring(contientChiffre))

    return contientMajuscule and contientMinuscule and contientSpeciaux and contientChiffre
end

if verifMotDePasse(mdp) then
    print("Mot de passe avec spéciaux valide")
else
    print("Mot de passe avec spéciaux invalide")
end


