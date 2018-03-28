{ALGORITHME : Morpion
//BUT : reproduire le morpion en utilisants un tableau et en verifiant les alignements,
//le nombre de coups joués pour déterminer si la partie est finie ou non.
//ENTREE : Le symbole de chaque joueur et la position.
//SORTIE : La grille, gagnant, le tableau.

const 
	MAX = 3

procedure init_tab(var tab : tableau de chaine)
var
	i, j, box : ENTIER

DEBUT
	box <- 1
	POUR i DE 1 A MAX FAIRE
		POUR j DE 1 A MAX FAIRE
			tab[i,j] <- box
			box <- box + 1
			//On considère que les entiers sont convertis en chaines
		FINPOUR
	FINPOUR
FINPROCEDURE
//Cette procedure initialise le plateau du morpion et le rempli de chiffres qui permettront
//aux joueurs de choisir l'emplacement de son symbole

fonction verif_case (var tab : tableau de chaine ; i, j : ENTIER): booleen
var
	verif : booleen
DEBUT
	SI (tab[i,j]="O") OU (tab[i,j]="X") ALORS
		verif <- FAUX
	SINON
		verif <- VRAI
	FINSI
	verif_case <- verif
FINFONCTION
//Cette fonction permet de vérifier qu'une case n'est pas déjà remplie

fonction verif_align (var tab : tableau de chaine ; nbCoup : ENTIER) : BOOLEEN
var 
	verif : booleen
	i, j, cptX, cptO : ENTIER

DEBUT
	SI (nbCoup coup >= 5) ALORS
	j <- 1
	cptX <- 0
	cptO <- 0
		POUR i DE 1 A MAX FAIRE
			SI (tab[i,j] = "X") ALORS
				cptX <- cptX + 1
			FINSI
			SI (tab[i,j] = "O") ALORS
				cptO <- cptO + 1
			FINSI
		FINPOUR
		SI (cptO < 3) ET (cptX < 3) ALORS
			cptO <- 0
			cptX <- 0
			POUR j DE 1 A MAX FAIRE
				SI (tab[i,j] = "X") ALORS
					cptX <- cptX + 1
				FINSI
				SI (tab[i,j] = "O") ALORS
					cptO <- cptO + 1
				FINSI
			FINPOUR
			SI (cptO < 3) ET (cptX < 3) ALORS
				cptO <- 0
				cptX <- 0
				POUR i DE 1 A MAX FAIRE
					POUR j DE 1 A MAX FAIRE
						SI (i = j) ALORS
							SI (tab[i,j] = "X") ALORS
								cptX <- cptX + 1
							FINSI
							SI (tab[i,j] = "O") ALORS
								cptO <- cptO + 1
							FINSI
						FINSI
						SI (i + j = MAX + 1) ET (i <> j) ALORS
							SI (tab[i,j] = "X") ALORS
								cptX <- cptX + 1
							FINSI
							SI (tab[i,j] = "O") ALORS
								cptO <- cptO + 1
							FINSI
						FINSI
					FINPOUR
				FINPOUR
				SI (cptO < 3) ET (cptX < 3) ALORS
					cptO <- 0
					cptX <- 0
					i <- 2
					POUR j DE 1 A MAX ALORS
						SI (tab[i,j] = "X") ALORS
							cptX <- cptX + 1
						FINSI
						SI (tab[i,j] = "O") ALORS
							cptO <- cptO + 1
						FINSI
					FINPOUR
					SI (cptO < 3) ET (cptX < 3) ALORS
						cptO <- 0
						cptX <- 0
						i <- 3
						POUR j DE 1 A MAX ALORS
							SI (tab[i,j] = "X") ALORS
								cptX <- cptX + 1
							FINSI
							SI (tab[i,j] = "O") ALORS
								cptO <- cptO + 1
							FINSI
						FINPOUR
						SI (cptO < 3) ET (cptX < 3) ALORS
							cptO <- 0
							cptX <- 0
							j <- 2
							POUR i DE 1 A MAX ALORS
								SI (tab[i,j] = "X") ALORS
									cptX <- cptX + 1
								FINSI
								SI (tab[i,j] = "O") ALORS
									cptO <- cptO + 1
								FINSI
							FINPOUR
							SI (cptO < 3) ET (cptX < 3) ALORS
								cptO <- 0
								cptX <- 0
								j <- 3
								POUR i DE 1 A MAX ALORS
									SI (tab[i,j] = "X") ALORS
										cptX <- cptX + 1
									FINSI
									SI (tab[i,j] = "O") ALORS
										cptO <- cptO + 1
									FINSI
								FINPOUR
							FINSI
						FINSI
					FINSI
				FINSI
			FINSI
		FINSI
	FINSI
	SI (cptO = 3) OU (cptX = 3) ALORS
		verif <- VRAI
	SINON
		verif <- FAUX
	FINSI
	verif_align <- verif
FINFONCTION
//Dans cette fonction assez longue, on vérifie chaque ligne, colonne ou diagonale
//pour tester la condition de victoire.

procedure affich_tab(var tab : tableau de chaine)
	var
		i, j : ENTIER
DEBUT
	POUR i DE 1 A MAX FAIRE
		POUR j DE 1 A MAX FAIRE
			ECRIRE tab[i,j]
		FINPOUR
	FINPOUR
FINPROCEDURE

procedure tour (joueur, symbole : CHAINE; tab : tableau de CHAINE)
	var
		pos : ENTIER
DEBUT
	ECRIRE joueur, " entrez la position dans laquelle vous souhaitez mettre votre ", symbole
	REPETER
		ECRIRE "Entrez une position valide s'il vous plait."
		CAS pos PARMI
			1 : i <- 1
				j <- 1
			2 : i <- 1
				j <- 2
			3 : i <- 1
				j <- 3
			4 : i <- 2
				j <- 1
			5 : i <- 2
				j <- 2
			6 : i <- 2
				j <- 3
			7 : i <- 3
				j <- 1
			8 : i <- 3
				j <- 2
			9 : i <- 3
				j <- 3
		FINCASPARMI
	JUSQUA ((pos >= 1) ET (pos <= 9) ET (verif_case(tab,i,j) = VRAI))
	tab[i,j] <- symbole
FINPROCEDURE
//Cette procedure place les symboles de chaque joueur comme il le veut

var
	joueur1, joueur2, symbole1, symbole2, joueur : CHAINE
	plateau : tableau [1..MAX,1..MAX] DE CHAINE
	nbCoup : ENTIER
//programme principale
DEBUT
	ECRIRE "Joueur 1 entrez un nom."
	LIRE joueur1
	ECRIRE "Joueur 2 entrez un nom."
	LIRE joueur2
	REPETER
		ECRIRE "Joueur 1 entrez le symbole choisi entre X et O."
		LIRE symbole1
		SI (symbole1 = "X") OU (symbole1 = "x") ALORS
			symbole1 <- "X"
			symbole2 <- "O"
		SINON SI (symbole1 = "O") OU (symbole1 = "o") OU (symbole1 = "0") ALORS
			symbole1 <- "O"
			symbole2 <- "X"
		SINON
			symbole1 <- "ERREUR"
		FINSI
	JUSQUA (symbole1 <> "ERREUR")
	//On veut vraiment avoir X ou O, parce que sinon, certaines fonctions ne marcheraient plus
	nbCoup <- 0
	init_tab(plateau)
	REPETER
		joueur <- joueur1
		affich_tab(plateau)
		tour(joueur1, symbole1, plateau)
		nbCoup <- nbCoup + 1
		SI (verif_align(plateau, nbCoup) = FAUX) ALORS
			joueur <- joueur2
			affich_tab(plateau)
			tour(joueur2, symbole2, plateau)
			nbCoup <- nbCoup + 1
		FINSI
	JUSQUA ((verif_align(plateau,nbCoup) = VRAI) OU (nbCoup = 9)
	SI (verif_align(plateau,nbCoup) = VRAI) ALORS
		ECRIRE joueur, " a gagné, bravo!"
	SINON
		ECRIRE "Match nul!"
	FINSI
FIN}

program morpions;

uses crt, SysUtils;

const
	MAX = 3;

type jeu = record
	position : integer;
	symbole : string;
end;

type plateau = record
	caseM : array[1..MAX,1..MAX] of jeu;
end;


procedure init_tab(var tab : plateau);
var
	i, j, box : integer;

begin
	box := 1;
	for i := 1 to MAX do
	begin
		for j := 1 to MAX do
		begin
			tab.caseM[i,j].position := box;
			box := box + 1;
			tab.caseM[i,j].symbole := '_';
		end;
	end;
end;
//Cette procedure initialise le plateau du morpion et le rempli de chiffres qui permettront
//aux joueurs de choisir l'emplacement de son symbole

function verif_case (var tab : plateau ; i, j, pos : integer): boolean;
var
	verif : boolean;
begin
	if ((tab.caseM[i,j].symbole = 'O') or (tab.caseM[i,j].symbole = 'X')) and (tab.caseM[i,j].position = pos) then
		verif := true
	else if ((tab.caseM[i,j].symbole <> 'O') and (tab.caseM[i,j].symbole <> 'X')) and (tab.caseM[i,j].position = pos) then
	begin
		verif := false;
	end;
	verif_case := verif;
end;
//Cette fonction permet de vérifier qu'une case n'est pas déjà remplie

function verif_align (var tab : plateau ; nbCoup : integer): boolean;
var 
	verif : boolean;
	i, j, cptX, cptO : integer;

begin
	if (nbCoup >= 5) then
	begin
		j := 1;
		i := 1;
		cptX := 0;
		cptO := 0;
		for j := 1 to MAX do
		begin
			if (tab.caseM[i,j].symbole = 'X') then
			begin
				cptX := cptX + 1;
			end;
			if (tab.caseM[i,j].symbole = 'O') then
			begin
				cptO := cptO + 1;
			end;
		end;
		//verification de la ligne 1
		if (cptO < MAX) and (cptX < MAX) then
		begin
			j := 1;
			i := 1;
			cptO := 0;
			cptX := 0;
			for i := 1 to MAX do
			begin
				if (tab.caseM[i,j].symbole = 'X') then
				begin
					cptX := cptX + 1;
				end;
				if (tab.caseM[i,j].symbole = 'O') then
				begin
					cptO := cptO + 1;
				end;
			end;
			//verification colonne 1
			if (cptO < MAX) and (cptX < MAX) then
			begin
				cptO := 0;
				cptX := 0;
				for i := 1 to MAX do
				begin
					for j := 1 to MAX do
					begin
						if (i = j) then
						begin
							if (tab.caseM[i,j].symbole = 'X') then
							begin
								cptX := cptX + 1;
							end;
							if (tab.caseM[i,j].symbole = 'O') then
							begin
								cptO := cptO + 1;
							end;
						end;
					end;
				end;
						//verification diagonale droite
				for i := 1 to MAX do
				begin
					for j := 1 to MAX do
					begin
						if (i + j = MAX + 1) then
						begin
							if (tab.caseM[i,j].symbole = 'X') then
							begin
								cptX := cptX + 1;
							end;
							if (tab.caseM[i,j].symbole = 'O') then
							begin
								cptO := cptO + 1;
							end;
						end;
						//verification diagonale gauche
					end;
				end;
				if (cptO < MAX) and (cptX < MAX) then
				begin
					cptO := 0;
					cptX := 0;
					i := 2;
					for j := 1 to MAX do
					begin
						if (tab.caseM[i,j].symbole = 'X') then
						begin
							cptX := cptX + 1;
						end;
						if (tab.caseM[i,j].symbole = 'O') then
						begin
							cptO := cptO + 1;
						end;
					end;
					//vérification ligne 2
					if (cptO < MAX) and (cptX < MAX) then
					begin
						cptO := 0;
						cptX := 0;
						i := 3;
						for j := 1 to MAX do
						begin
							if (tab.caseM[i,j].symbole = 'X') then
							begin
								cptX := cptX + 1;
							end;
							if (tab.caseM[i,j].symbole = 'O') then
							begin
								cptO := cptO + 1;
							end;
						end;
						//vérification ligne 3
						if (cptO < MAX) and (cptX < MAX) then
						begin
							cptO := 0;
							cptX := 0;
							j := 2;
							for i := 1 to MAX do
							begin
								if (tab.caseM[i,j].symbole = 'X') then
								begin
									cptX := cptX + 1;
								end;
								if (tab.caseM[i,j].symbole = 'O') then
								begin
									cptO := cptO + 1;
								end;
							end;
							//verification colonne 2
							if (cptO < MAX) and (cptX < MAX) then
							begin
								cptO := 0;
								cptX := 0;
								j := 3;
								for i := 1 to MAX do
								begin
									 if (tab.caseM[i,j].symbole = 'X') then
									begin
										cptX := cptX + 1;
									end;
									if (tab.caseM[i,j].symbole = 'O') then
									begin
										cptO := cptO + 1;
									end;
									//verification colonne 3
								end;
							end;
						end;
					end;
				end;
			end;
		end;
	end;
	if (cptO = MAX) or (cptX = MAX) then
		verif := true
	else
	begin
		verif := false;
	end;
	verif_align := verif;
end;
//Dans cette fonction assez longue, on vérifie chaque ligne, colonne ou diagonale
//pour tester la condition de victoire.


//procedure tour (var joueur, symb : string; tab : plateau);
	
//Cette procedure place les symboles de chaque joueur comme il le veut

procedure tour(var tab : plateau ; joueur, symb : string);
	var
		pos, i, j : integer;
		verif : boolean;
begin
	clrscr;
	for i := 1 to MAX do
	begin
		for j := 1 to MAX do
		begin
			if (tab.caseM[i,j].symbole = '_') then
				write(tab.caseM[i,j].position)
			else
			begin
				write(tab.caseM[i,j].symbole);
			end;
		end;
		writeln;
	end;
	// affichage du tableau
	writeln(joueur, ' entrez la position dans laquelle vous souhaitez mettre votre ', symb);
	repeat
		writeln('Entrez une position valide s''il vous plait.');
		readln(pos);
		for i := 1 to MAX do
		begin
			for j := 1 to MAX do
			begin
				verif := verif_case(tab,i,j, pos);
				if (tab.caseM[i,j].position = pos) and (verif = false) then
				begin
					tab.caseM[i,j].symbole := symb;
				end;
			end;
		end;
	until ((pos >= 1) and (pos <= 9) and (verif = false));
	//entree de la position à laquelle le joueur place le symbole
end;

var
	joueur1, joueur2, symbole1, symbole2, joueur : string;
	morp : plateau;
	nbCoup : integer;
//programme principale
begin
	clrscr;
	writeln('Joueur 1 entrez un nom.');
	readln(joueur1);
	writeln('Joueur 2 entrez un nom.');
	readln(joueur2);
	repeat
		writeln('Joueur 1 entrez le symbole choisi entre X et O.');
		readln(symbole1);
		if (symbole1 = 'X') or (symbole1 = 'x') then
		begin
			symbole1 := 'X';
			symbole2 := 'O';
		end
		else if (symbole1 = 'O') or (symbole1 = 'o') or (symbole1 = '0') then
		begin
			symbole1 := 'O';
			symbole2 := 'X';
		end
		else
		begin
			symbole1 := 'ERREUR';
		end;
	until (symbole1 <> 'ERREUR');
	//On veut vraiment avoir X ou O, parce que sinon, certaines fonctions ne marcheraient plus
	nbCoup := 0;
	init_tab(morp);
	repeat
		joueur := joueur1;
		tour(morp, joueur, symbole1);
		nbCoup := nbCoup + 1;
		if (verif_align(morp, nbCoup) = false) then
		begin
			joueur := joueur2;
			tour(morp, joueur, symbole2);
			nbCoup := nbCoup + 1;
		end;
	until ((verif_align(morp,nbCoup) = true) or (nbCoup >= 9));
	if (verif_align(morp,nbCoup) = true) then
		writeln(joueur, ' a gagné, bravo!')
	else
	begin
		writeln('Match nul!');
	end;
	readln;
end.