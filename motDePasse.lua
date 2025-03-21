local caracteres = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
local caracteresSpeciaux = "!@#$%^&*()"
local caracteresASCII = "☺☻♥♦♣♠•◘○"


local function initialiserSeed()
    local time = os.time()  -- Seconds since epoch
    local clock = os.clock() * 1000000  -- Time in microseconds
    local seed = time + clock
    math.randomseed(seed)
end

-- genere un mot de passe aléatoire
function Generateur(longueur, speciaux, ascii)
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

initialiserSeed()
-- fonction qui verifie les critère demander 
function VerifMotDePasse(MotDePasse)
    local contientMajuscule = MotDePasse:match("%u") ~= nil  
    local contientMinuscule = MotDePasse:match("%l") ~= nil  
    local contientSpeciaux = MotDePasse:match("[!@#$%^&*()]") ~= nil  
    local contientAscii = MotDePasse:match("[☺☻♥♦♣♠•◘○]") ~= nil  
    local contientChiffre = MotDePasse:match("%d") ~= nil  
    local pasDeSuite = not MotDePasse:match("123") and not MotDePasse:match("abc")

    return contientMajuscule and contientMinuscule and contientSpeciaux and contientChiffre and pasDeSuite and contientAscii
end

-- calcul a revoir mais affiche un score aux mot de passe 
function ScoreMotDePasse(MotDePasse)
    local score = 0 
   if MotDePasse:match("%u") then score = score +1 end
   if MotDePasse:match("%l") then score = score +1 end
   if MotDePasse:match("[!@#$%^&*()]") then score = score +1 end
   if MotDePasse:match("%d") then score = score + 1 end
   if MotDePasse:match("☺☻♥♦♣♠•◘○") then score = score +1 end
   if #MotDePasse >= 12 then score = score +2 end
   if not MotDePasse:match("123") and not MotDePasse:match("abc") then score = score + 1 end -- si le mot de passe ne contient pas ses suite alors score +1
   
    return score 
end
 
 function GeneratorMdpValide(longueur, ascii, speciaux)
    local MotDePasse = Generateur(longueur, speciaux,ascii)
    while not VerifMotDePasse(MotDePasse) do
        print(MotDePasse .. " Mot de passe invalide relance du generateur")
        MotDePasse = Generateur(longueur, speciaux,ascii)
    end
    return MotDePasse
end

local mdpValide = GeneratorMdpValide(16, true, true)
local score = ScoreMotDePasse(mdpValide)
print(" le socre du mdp est : " .. score ..  " le mot de passe est : ".. mdpValide .. " Mot de passe Valide" )



