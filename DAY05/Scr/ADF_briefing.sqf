/****************************************************************
ARMA Mission Development Framework
ADF version: 1.43 / JANUARY 2016

Script: Mission Briefing
Author: Whiztler
Script version: 1.41

Game type: COOP
File: ADF_Briefing.sqf
****************************************************************
Instructions:

Note the reverse order of topics. Start from the bottom.
Change the "Text goes here..." line with your info. Use a <br/> to
start a new line.
****************************************************************/

diag_log "ADF RPT: Init - executing briefing.sqf"; // Reporting. Do NOT edit/remove
if (!hasInterface) exitWith {};

///// CREDITS
player createDiaryRecord ["Diary",["Credits","<br/>
<img width='380' height='380' image='Img\NRF_credit.paa'/>
<br/><br/><font size='18'>CREDITS</font><br/><br/>
<font color='#9DA698'>
Concept and development: whiztler
</font><br/><br/>

<font size='14' color='#d7dbd5'>2SIERRA.COM</font><font color='#9DA698'><br/>
<font color='#9DA698'>
More information and latest version of the Two Sierra campaign can be found at the official website: www.2sierra.com
</font><br/><br/>

<font size='14' color='#d7dbd5'>SPECIAL THANKS TO</font><font color='#9DA698'><br/>
- Bohemia Interactive for creating the ultimate MilSim<br/>
  platform.<br/>
- Nopryl, CSOR, 2CAV and PFD for testing/feedback.<br/>
- CBA Team for creating and maintaining their CBA framework.<br/>
- Kju/CUP team for keeping the ARMA2 maps alive.<br/>
- ACE team for spicing up the ARMA3 MilSim experience.
</font><br/><br/>

<font size='14' color='#d7dbd5'>TOOLING AND SCRIPTS</font><font color='#9DA698'><br/>
The Two Sierra campaign uses the following tooling/scripts (with thanks to the authors):<br/>
- F3 Spectator from the F3 Framework.<br/>
- TAW View Distance by Tonic.<br/>
- ZBE_caching by Zorrobyte.<br/>
- MAD Ambient Life by MAD T.<br/>
- Repetitive Cleanup by Aeroson.<br/><br/>
The Two Sierra campaign is powered by ADF.
</font><br/><br/>

<font size='14' color='#d7dbd5'>OTHER MISSIONS/CAMPAIGNS</font><font color='#9DA698'><br/>

- Wolfpack Volume 1 (http://whiztler.github.io/Wolfpack).<br/>
- Wolfpack Volume 2 (http://whiztler.github.io/Wolfpack).
</font><br/><br/>"]];

///// OPORD
player createDiarySubject ["2SOPORD","Two Sierra OPORD"];

// Indicatifs
player createDiaryRecord ["2SOPORD",["Call Signs","<br/><br/>
<font size='18'>CALL SINGS</font><br/><br/>

<font color='#9DA698'>
ACO	- FAIRCHILD<br/>
CAS	- RAVEN<br/>
SatNav AJR - ACE<br/>
VJTF 5 BAT TOC - MOTHER<br/>
NRF 2 SPT GRP - UNCLE<br/>
Chernarussian Armed Forces - DONALD<br/><br/>

BALOTA AB - FARGO<br/>
Hospital croix rouge- MARY<br/>
Camion Medical 1 - EVEREST1<br/>
Camion Medical 2 - EVEREST2<br/><br/>

Soborian Separatists - JOSEPH<br/>
CSAT Russian Forces - BORIS

</font><br/><br/><font size='14' color='#d7dbd5'>NOTAF</font><br/>

<font color='#9DA698'>
VEGAS - MSR principale<br/>
YORK - MSR secondaire<br/>
OLAV - MSR tertiaire

<br/><br/></font><font size='14' color='#d7dbd5'>CHALLENGES</font><br/>

<font color='#9DA698'>
Challenge: KENNY<br/>
Password: CARTMAN
</font><br/><br/>
"]];

// notes
player createDiaryRecord ["2SOPORD",["Notes","<br/><br/>
<font size='18'>NOTES</font><br/><br/>
<font color='#9DA698'>
Les séparatistes soboriens ont multiplié leurs efforts pour gagner plus de territoire à l'est de Chernarus. Des efforts récents ont causé de nombreuses victimes civiles. Après des mois de négociations, la Croix-Rouge a finalement obtenu la permission de créer un hôpital de terrain mobile (MARY) dans la zone de conflit. L'hôpital traite plus de 100 victimes civiles par jour et nécessite donc de matériel médical.<br />
Les deux derniers transports médicaux effectués par la Croix-Rouge ont été capturés par des séparatistes soboriens. Les fournitures ont été vendues sur le marché noir. La Croix-Rouge a demandé à l'OTAN de mener à bien les convois jusqu'à ce que les choses se soient calmées.
</font><br/><br/>
"]];

// COMMANDEMENT ET TRANSMISSION
player createDiaryRecord ["2SOPORD",["Command & Signal","<br/><br/>
<font size='18'>COMMANDEMENT ET TRANSMISSION</font><br/><br/>

<font size='14' color='#d7dbd5'>COMMAND</font><br/>

<font color='#9DA698'>
Place du chef: conforme<br/>
Chaine de commandement: 2 PC, 2 SQL, 2 WTL, 2 FTL
<br/><br/></font>

<font size='14' color='#d7dbd5'>SIGNAL</font><br/>

<font color='#9DA698'>
Fréquences et indicatifs: Annexe B<br/>
Pyrotechnie et signaux: conforme<br/>
Challenges et passwords: Annex B<br/>
Code: conforme
</font><br/><br/>
"]];

// EQUIPEMENTS ET APPUIS
player createDiaryRecord ["2SOPORD",["Service & Support","<br/><br/>
<font size='18'>EQUIPEMENTS ET APPUIS</font><br/><br/>

<font size='14' color='#d7dbd5'>SUPPLY</font><br/>

<font color='#9DA698'>
Procédure standard en vigueur pour les opérations de maintien en puissance. Les zones d'évacuations doivent être établis sur place. MEDEVAC disponible à FARGO.<br/><br/>
Equipements: approvisionnement en munitions et matériels dans les véhicules.<br/>
Uniformes: Tenue URR<br/>
Armements et munitions: Arsenal Virtuel

</font><br/><br/><font size='14' color='#d7dbd5'>VEHICULES</font><br/>

<font color='#9DA698'>
PC – 1 x Humvee<br/>
2-1 Squad/2-2 Squad – 4 x Humvees, 2 x Humvees 12.7<br/>
2-3 Squad – 1 x Humvees 12.7 / 1 x Humvees 40<br/>
Matériel capturé: procédure standard.
<br/><br/></font>

<font size='14' color='#d7dbd5'>APPUIS</font><br/>

<font color='#9DA698'>
CAS: RAVEN, AH-99 à FARGO. Indicatif: ECHO
</font><br/><br/>
"]];

// EXECUTION
player createDiaryRecord ["2SOPORD",["Execution","<br/><br/>
<font size='18'>EXECUTION</font><br/><br/>

<font size='14' color='#d7dbd5'>CONCEPT DE L'OPERATION</font><br/>

<font color='#9DA698'>
1. Sortir de FARGO et conduire vers le nord en direction de DONALD checkpoint (CP) (via YORK ou OLAV).<br/>
2. Assurer la sécurité de EVEREST1 et EVEREST2.<br/>
3. Traverser la zone verte et livrer EVEREST1 et EVEREST2 à MARY.<br/>
4. Retourner à FARGO pour un compte rendu.<br/>
5. Les points de regroupement doivent être reconnus avant le départ.<br/>
6. Rendre compte de l'exécution des objectifs de la mission.

<br/><br/></font>

<font size='14' color='#d7dbd5'>INTENTION DU COMMANDEMENT</font><br/>

<font color='#9DA698'>
Déplacement en convoi en procédure standard jusqu'à MARY. Trouver MARY. Livrer EVEREST1 et EVEREST2. Revenir en convoi à FARGO.
<br/><br/></font>

<font size='14' color='#d7dbd5'>MISSION DES UNITEES SUBORDONNEES</font><br/>

<font color='#9DA698'>
Néant.<br/><br/>
</font>

<font size='14' color='#d7dbd5'>COORDINATION</font><br/>

<font color='#9DA698'>
1. Ordre de mouvement, formations: initiative du commandement sur place, procédure standard.<br/>
2. Actions pour les arrêts (court / long): procédure standard.<br/>
3. Routes (primaire / secondaire): MSR VEGAS / MSR OLAV / MSR YORK.<br/>
4. MSR principal: YORK<br/>
5. Actions dans les zones dangereuses: procédure standard.<br/>
6. Actions au contact de l'ennemi: procédure standard.<br/>
7. Réorganisation et consolidation: procédure standard.<br/>
8. Mesures de lutte contre l'incendie: initiative du commandement sur place, procédure standard.<br/>
9. Renseignement de priorité, rendre compte à MÈRE.<br/>
10. Débriefing: initiative du commandement.<br/>
11. Règle d'engagement: initiative du commandement sur place, procédure standard.<br/>
</font><br/><br/>
"]];

// MISSION
player createDiaryRecord ["2SOPORD",["Mission","<br/><br/>
<font size='18'>MISSION</font><br/><br/>
<font color='#9DA698'>
Transporter et livrer EVEREST1 et EVEREST2 à MARY.
</font><br/><br/>
"]];

// SITUATION
player createDiaryRecord ["2SOPORD",["Situation","<br/><br/>
<font size='18'>SITUATION</font><br/><br/>

<font color='#9DA698'>
OpFor: Separatistes Soboriens (JOSEPH) et Forces Armées de la Fédération de Russie (BORIS)<br/>
L'escalade de violence entre CAF (Chernarus Armed Forces: DONALD) et JOSEPH a porté ses conséquences sur la population civile. La Croix-Rouge a mis en place un hôpital de campagne (MARY) au nord de la zone verte. MARY a besoin d'un approvisionnement médical urgent.
<br/><br/>
</font>

<font size='14' color='#d7dbd5'>FORCES ENI</font><br/>

<font color='#9DA698'>
1. JOSEPH a une présence modérée dans la plupart des zones urbaines au nord de la zone verte.<br />
2. BORIS a augmenté sa présence à Lapotino AB avec la 11ème CIE d'infanterie. <br />
3. JOSEPH: armes légères et patrouille au nord de la zone verte. Traversent parfois le territoire de DONALD. <br />
4. JOSEPH: Estimé à 3000-4000 séparatistes dans la province de Sobor.<br />
5. BORIS: 3 CIE d'inf., 1 CIE de cavalerie et 2 avions. Estimé à 2700 pax. <br />
6. Action: Une fois que les BluFor ont été détecté par JOSEPH, des renforts seront appelés. MARY est une zone neutre. <br />
7. Armement: diverses armes légères, principalement russes et iranienne. Capacité anti-char: RPG. <br />
8. Tenues: vêtements principalement décontractés, gilets improvisés. La plupart des JOSEPH portent des sacs à dos avec des IED et des fournitures limitées.

<br/><br/>
</font>

<font size='14' color='#d7dbd5'>FORCES AMI</font><br/>

<font color='#9DA698'>
1. 5ème Compagnie (CIE), 2ème Section: voir ANNEXE A.<br/>
2. 2 Groupe de soutien à FARGO.<br/>
3. CAF: 3ème et 4ème CIE à Disha AB.<br/>
4. CAF: 2ème CIE d'INF à Elektrozavodsko.

<br/><br/>
</font>

<font size='14' color='#d7dbd5'>DIVERS</font><br/>

<font color='#9DA698'>
1. Néant<br/><br/>
</font>

<font size='14' color='#d7dbd5'>CIVILS</font><br/>

<font color='#9DA698'>
1. Les civils sont généralement neutres face aux forces de la coalition.
</font><br/><br/>

<font size='14' color='#d7dbd5'>SOUTIENT ET DÉTACHEMENTS</font><br/>

<font color='#9DA698'>
Soutient: 1 x AH-99, 6 unités de cavalerie, 6ème CIE à FARGO.<br/>
Détachement: néant.
</font><br/><br/>
"]];

// TERRAIN ET METEO
player createDiaryRecord ["2SOPORD",["Terrain & weather","<br/><br/>
<font size='18'>TERRAIN ET METEO</font><br/><br/>

<font size='14' color='#d7dbd5'>TERRAIN</font><br/>

<font color='#9DA698'>
1.	Semi-montagneux. 225 KM² dont plus de 100 KM² de forêts et de côtes rocheuses.<br/>
2.	Altitude moyenne: 600 M<br/>
3.	Quatre MSR: du nord au sud et de l'ouest au nord: VEGAS / YORK / OLAV / DURBAN<br/>
4.	Les MSR sont de bonne qualité.<br/>
5.	Les zones forestières offrent une bonne couverture. <br/>
6.	Les plus grandes villes sont concentrées dans le Sud et le Sud-Est de l'île. Diverses installations industrielles sont situées à proximité des grandes villes.<br/>
7.	Les plus petits villages sont situés dans des vallées profondes, caché dans les crêtes boisées ou sur des plateaux élevés avec des prés luxuriants.<br/>
8.	ENI: utilisation des forêts pour la couverture et les bases d'opérations.<br/>
9.	AMI: les collines et les forêts fournissent une couverture même en ce déplacent sur le MSR.<br/>
<br/><br/>
</font>

<font size='14' color='#d7dbd5'>METEO</font><br/>

<font color='#9DA698'>
1.	Temp. max.: 17C°<br/>
2.	Temp. mini.: 11C°<br/>
3.	Vent: Modéré, 13 à 22.
</font><br/><br/>
"]];

///// CAMPAIGN
player createDiarySubject ["2SCPGN","Two Sierra Campaign"];

player createDiaryRecord ["2SCPGN",["Game Master/Commander Info","<br/><br/>
<font size='18'>GAME MASTER/COMMANDER INFORMATION</font><br/><br/>
<font color='#9DA698'>
Game Masters/Commandants, merci de noter les points suivants:<br/><br/>
01. Toutes les missions 2 Sierra ont des objectifs pré définis.<br/>
02. Toutes les coms sont loguées dans le 'Two Sierra log'<br/>
    que l'on peut consulter dans le menu carte.<br/>
03. Faites attention aux ordres de mission<br/>
    Vérifiez souvent le log book.<br/>
04. All missions have been play tested. If you discover a bug,<br/>
    please report the bug on the BIS forum or on GitHub. Contact<br/>
    information can be found on www.2sierra.com.<br/>
05. Usage of 1 or more headless clients is recommended for smooth<br/>
    game play. AI's are automatically distributed across multiple<br/>
    headless clients for optimal performance.<br/>
    Note that AI's are spawned on the server. The load balancer kicks<br/>
    in after 120 seconds after mission start.<br/>
05. Toutes les missions sont sensibles au temps. Le commandant est informé<br/>
    si le temps est dépassé (2-3 heures, en fonction<br/>
   de la mission).<br/>
06. Tous les slots sont pre equipe avec un equipement defini.<br/>
    Du matériel additionnel peut disponible dans les véhicules.<br/>
07. La plupart des missions offrent un support aerien. CAS peut etre appele par<br/>
    le commandant via le menu.<br/>
08. 2 Sierra a des frequences radio pre definies.<br/>
    Les frequences peuvent etre consultées dans le 'Two Sierra Roster'<br/>
  dans le menu carte
<br/><br/>
<font size='14' color='#d7dbd5'>FEEDBACK</font><br/>
I would love to hear feedback about your game night. If you have a YouTube cam recording or screen shots, please let me know. I'll post them on the www.2sierra.com website.<br/><br/>
Contact details and links can be found on www.2sierra.com.<br/><br/>
I hope your community/clan have as much fun playing the missions as I had making them!<br/><br/>
-Whiz
</font><br/><br/>"]];

player createDiarySubject ["2SCPGN","Two Sierra Campaign"];

player createDiaryRecord ["2SCPGN",["Mission Testing","<br/><br/>
<font size='18'>MISSION TESTING</font><br/><br/>

<font color='#9DA698'>
Each mission has its own 'Mission Objectives Test Script' to test mission critical triggers and exfil. The script works in a dedicated server environment and can be evoked by a server admin (or anyone who has server admin access).<br/><br/>
1. Make sure you are logged in as server admin<br/>
2. Hit the escape key to bring up the 'debug console';<br/>
3. In the execute window enter: null = execVM 'mots.sqf';<br/>
4. Click on SERVER EXEC (or LOCAL EXEC if you are testing<br/>
   in the mission editor);<br/>
5. Follow instructions as presented on screen in-game.<br/><br/>
Please note that when testing from within the ARMA III editor, the mission load time is longer as the client (player) and the server are considered the same.
</font><br/><br/>"]];

player createDiaryRecord ["2SCPGN",["Server information","<br/><br/>
<font size='18'>SERVER INFORMATION</font><br/><br/>

<font size='14' color='#d7dbd5'>REQUIRED ADD-ONS</font><br/>
<font color='#9DA698'>
The server requires the following add-ons:<br/><br/>
- Community Based Addons ARMA 3 (CBA_A3)<br/>
- All in ARMA Terrain Pack (AIATP) or CUP Terrains<br/><br/>

Two Sierra missions have been tested (to work with) with the optional AI behaviour add-on ASR AI.
</font><br/><br/>

<font size='14' color='#d7dbd5'>SERVER SETTINGS</font><br/>
<font color='#9DA698'>
Recommend server settings for optimal game play:<br/><br/>
Difficulty: Expert.<br/>
Style: COOP.<br/>
Slots: 37 (30 + 4 players + 3 optional Headless Client).<br/>
Duration: 2-3 hours depending on style of game play.
</font><br/><br/>"]];

player createDiaryRecord ["2SCPGN",["Client Information","<br/><br/>
<font size='18'>CLIENT INFORMATION</font><br/><br/>

<font size='14' color='#d7dbd5'>REQUIRED ADD-ONS</font><br/>
<font color='#9DA698'>
The Two Sierra campaign requires the following Add-Ons:<br/><br/>
- Community Based Addons ARMA 3 (CBA_A3)<br/>
- All in ARMA Terrain Pack (AIATP) or CUP Terrains<br/><br/>
<font size='14' color='#d7dbd5'>RECOMMENDED ADD-ONS</font><br/>
To enhance game play, the following client add-ons are recommended:<br/><br/>
- Advanced Combat Radio Environment (ACRE 2) -or-<br/>
  TaskForce Arrowhead Radio (TFAR)<br/>
- Commanders Tablet (cTAB)<br/>
- Advanced Combat Environment 3 (ACE3). 
<br/><br/></font>
"]];

player createDiaryRecord ["2SCPGN",["NRF VJTF 2 SIERRA","<br/><br/>
<font size='18'>NRF VJTF 2 SIERRA</font><br/><br/>

<font color='#9DA698'>
The NRF is a highly ready and technologically advanced multinational force made up of land, air, maritime and Special Operations Forces (SOF) components that NATO can deploy quickly, wherever needed. NATO Allies decided to enhance the NRF in 2014 by creating a “spearhead force” within it, known as the Very High Readiness Joint Task Force (VJTF).<br/><br/>
Two Sierra, or 2 Sierra is a VJTF platoon, currently based at the temporarily home of NRF 5 BAT in Doha. Highly flexible, motivated and well trained, Two Sierra is seen by many as the pride of NRF.
<br/><br/></font>

<font size='14' color='#d7dbd5'>ORBAT</font><br/>
<img width='380' height='380' image='Img\ORBAT_NRF_5-1-2PLT.paa'/>
<font color='#9DA698'>
Two Sierra SOP: one command element, two rifle squads and one weapons squad. Total 30 pax.
</font><br/><br/>
"]];

player createDiaryRecord ["2SCPGN",["Background","<br/><br/>
<font size='18'>BACKGROUND</font><br/><br/>

<font color='#9DA698'>
Two Sierra Tour 2 | Chernarus, June 2019. Since CSAT Russia annexed the Lopatino district in 2014 a local insurgency faction emerged and declared the Sobor region as independent. Aptly naming it Soborisk. The Soborian Separatists quickly gained ground with the unofficial support of CSAT Russia. Over the years several attempts have been made to solve the crisis, but neither Chernarussian Government nor the Soborian separatists were willing to give in. Now, nearly 4 years later, CSAT Russia has issued an ultimatum to the Chernarussian Government: 'recognize Soborisk as an independent state'. All diplomatic solutions seem to have been exhausted.<br /><br /> 
Two Sierra is relieving Third Platoon who has been training Chernarussian Armed Forces (CAF) and assisting with humanitarian operations. NRF forces are considered neutral. NATO does not have a mandate to get involved in the escalation between Soborian Separatists and CAF. That said, last week a patrol from Third Platoon got engaged by presumably Soborian Separatists. And two weeks ago a HEMTT from 2ND SPT GRP was taken out by an improvised explosive device. On both occasions, vehicles were clearly marked as NRF vehicles. Things are heating up and the world is watching. 
<br/><br/></font>

<font size='14' color='#d7dbd5'>SOBORIAN SEPARATISTS</font><br/>

<font color='#9DA698'>
In April 2014, pro-Russian activists seized control of government buildings in towns and cities across the Sobor region. The events were a repeat of what had happened in the Lopatino region. .<br /><br />
Gunmen there seized government buildings in February 2014 and raised the Russian flag a week after elected President Boris Yanukotov, friendly to Moscow, fled during massive pro-EU street protests in Novigrad. An early attempt by nationalists to remove the status of Russian as a second language alarmed many Russian speakers, and officials in Moscow portrayed the new leaders in Novigrad as NATO-backed Chernarussian nationalists bent on violating minority rights. A flawed referendum on joining Russia was quickly held in Lopatino and within a month the region's annexation was complete. .<br /><br />
There was little bloodshed in Lopatino, but Chernarus' fledgling revolutionary government was in no position to fight back, with only 6,000 troops reportedly ready for combat. However, when pro-Russian separatists made a move on Chernarus' industrial east and Russian forces appeared to be building up on the borders, the authorities in Novigrad ordered an 'anti-terrorist operation'. The start of a conflict that has dragged on for nearly 5 years.
</font><br/><br/>
"]];

player createDiaryRecord ["2SCPGN",["About TWO SIERRA Campaign","<br/><br/>
<font size='18'>ABOUT TWO SIERRA CAMPAIGN</font><br/><br/>

<font size='14' color='#d7dbd5'>DESCRIPTION</font><br/>

<font color='#9DA698'>
Two Sierra is a CO-37 multiplayer (30 + 4 player slots) NRF infantry campaign for MilSim communities. Three tours with each tour consisting of 4 challenging missions and a warm-up mission.
<br/><br/></font>

<font size='14' color='#d7dbd5'>FEATURES</font><br/>

<font color='#9DA698'>
- 30 Player slots + 4 JIP Support Slots + 3 (optional) headless<br/>
  clients.<br/>
- 4 missions per tour, offering challenging and immersive game play<br/>
  in a lively area of operations;<br/>
- Warm-up Missions for warming up, mod-line testing and general<br/>
  training;<br/>
- Detailed OPORD’s (in-game and PDF/TXT for forum briefings);<br/>
- Join in Progress (JIP) supported.;<br/>
- No respawn;<br/>
- Optimized for dedicated server play with up to 3 headless clients<br/>
  with load balancing;<br/>
- Challenging opponents;<br/>
- Automatic detection of ACRE2, TFAR, cTab and ACE3 add-ons.
</font><br/><br/>

<font size='14' color='#d7dbd5'>LICENSE</font><br/>

<font color='#9DA698'>
The Two Sierra campaign is licensed under the Arma Public License (APL).

</font><br/><br/>"]];
