local caracteres = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
local caracteresSpeciaux = "!@#$%^&*()"
local caracteresASCII = "☺☻♥♦♣♠•◘○"

-- permet un mot de passe différent a chaque relance du code 
math.randomseed(os.time()) 

-- genere un mot de passe aléatoire
function generateur(longueur, speciaux, ascii)
    local selectionCaratere = caracteres
    if speciaux and ascii then 
        selectionCaratere = caracteres .. caracteresSpeciaux .. caracteresASCII
    elseif speciaux and not ascii then 
        selectionCaratere = caracteres .. caracteresSpeciaux
    elseif not speciaux and ascii then
        selectionCaratere = caracteres .. caracteresASCII
    end
   
    local MotDePasse = ""  
    for i = 1, longueur do
        local aleatoire = math.random(1, #selectionCaratere) 
        MotDePasse = MotDePasse .. selectionCaratere:sub(aleatoire, aleatoire)     
    end
    return MotDePasse
end
-- paramètre du mot de passe
local mdp = generateur(12, true, true)  
local mdp2 = generateur(50, true, true)
local mdp3 = generateur(100, true , true)
print(mdp3)

-- fonction qui verifie les critère demander 
function verifMotDePasse(MotDePasse)
    local contientMajuscule = MotDePasse:match("%u") ~= nil  
    local contientMinuscule = MotDePasse:match("%l") ~= nil  
    local contientSpeciaux = MotDePasse:match("[!@#$%^&*()]") ~= nil  
    local contientAscii = MotDePasse:match("[☺☻♥♦♣♠•◘○]") ~= nil  
    local contientChiffre = MotDePasse:match("%d") ~= nil  
    local pasDeSuite = not MotDePasse:match("123") and not MotDePasse:match("abc")

    return contientMajuscule and contientMinuscule and contientSpeciaux and contientChiffre and pasDeSuite and contientAscii
end

if verifMotDePasse(mdp) then
    print("Mot de passe valide")
else
    print("Mot de passe invalide")
end

-- calcul a revoir mais affiche un score aux mot de passe 
function scoreMotDePasse(MotDePasse)
    local score = 0 
   if MotDePasse:match("%u") then score = score +1 end
   if MotDePasse:match("%l") then score = score +1 end
   if MotDePasse:match("[!@#$%^&*()]") then score = score +1 end
   if MotDePasse:match("%d") then score = score + 1 end
   if MotDePasse:match("☺☻♥♦♣♠•◘○") then score = score +1 end
   if #MotDePasse >= 12 then score = score +2 end
    return score 
end
 local score = scoreMotDePasse(mdp3)
 

 function generatorMdpValide(longueur, ascii, speciaux)
    local MotDePasse = generateur(longueur, speciaux,ascii)
    while not verifMotDePasse(MotDePasse) do
        print(MotDePasse)
        print("Mot de passe invalide relance du generateur")
        MotDePasse = generateur(longueur, speciaux,ascii)
    end
    return MotDePasse
end

print(generatorMdpValide(12,true,true))



