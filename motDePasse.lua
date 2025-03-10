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
    local pasDeSuite = not MotDePasse:match("123") and not MotDePasse:match("abc")

    return contientMajuscule and contientMinuscule and contientSpeciaux and contientChiffre and pasDeSuite
end

if verifMotDePasse(mdp) then
    print("Mot de passe avec spéciaux valide")
else
    print("Mot de passe avec spéciaux invalide")
end

-- calcul a revoir mais affiche un score aux mot de passe 
function scoreMotDePasse(MotDePasse)
    local score = 0 
   if MotDePasse:match("%u") then score = score +1 end
   if MotDePasse:match("%l") then score = score +1 end
   if MotDePasse:match("[!@#$%^&*()]") then score = score +1 end
   if MotDePasse:match("%d") then score = score + 1 end
   if #MotDePasse >= 12 then score = score +2 end
    return score 
end
 local score = scoreMotDePasse(mdp)
 print(score)



