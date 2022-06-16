% SWI-PROLOG
% Base de conocimiento
% entrenador(Quien)
entrenador(ash).
entrenador(misty).
entrenador(diana).
entrenador(brock).
% Principio de universo cerrado: si no está en la base, es falso.

% predicado tieneA relaciona 2 cosas: un entrenador y un pokemon.
% Este predicado tiene 5 cláusulas, todas son hechos.
tieneA(ash, pikachu).
tieneA(ash, pidgeot).
tieneA(ash, charizard).
tieneA(brock, gyarados).
tieneA(misty, charizard).
tieneA(cami, pidgeot).

% quiénes tienen pokemons?


entrenadorPoderoso(diana).
entrenadorPoderoso(Entrenador) :-
    tieneA(Entrenador,charizard).

% es protagonista alguien cuando tiene un pikachu y un pidgeot

esProtagonista(Protagonista) :-
    tieneA(Protagonista,pikachu),
    tieneA(Protagonista,pidgeot).

% puede ser protagonista alguien cuando tiene un pikachu o un pidgeot

puedeSerProtagonista(Alguien):-
    tieneA(Alguien,pikachu).
puedeSerProtagonista(Alguien):-
    tieneA(Alguien,pidgeot).

%%%%%%%%%%%%%%%%%%%%
/*
Modelar la siguiente información: 
En sui generis tocaron charly y nito, y la banda vivió entre 1969 y 1975. En seru girán tocaron charly, lebon, aznar y moro, y la banda vivió entre 1977 y 1982. Charly nito y lebon siempre cantaban en sus bandas.
*/

%% no va, porque las bandas son COSAS, datos, (individuo).
% suiGeneris(charly).
% suiGeneris(nito).

% seruGiran(charly).
% seruGiran(lebon).
% seruGiran(aznar).
% seruGiran(moro).

%%%%%%%%%%%%%%%%%%%

tocoEn(suiGeneris,charly).
tocoEn(suiGeneris,nito).
tocoEn(seruGiran,charly).
tocoEn(seruGiran,aznar).
tocoEn(seruGiran,lebon).
tocoEn(seruGiran,moro).
tocoEn(riff,pappo).
tocoEn(riff,vitico).
%%%%%%%%%%%%%%%%
esCantante(charly).
esCantante(nito).
esCantante(lebon).
esCantante(pappo).
%%%%%%%%%%%%%%%
vivioEntre(suiGeneris,1969,1975).
vivioEntre(seruGiran,1977,1982).
vivioEntre(riff,1980,1990).

%%%%%%

% Si dos músicos fueron colegas (porque compartieron banda).

sonColegas(Artista1, Artista2):-
    tocoEn(Banda,Artista1),
    tocoEn(Banda,Artista2).

%%%%%%
%Si hay coros en una banda (cuando tiene más de un cantante).

hayCoros(Banda) :-
    tocoEn(Banda, Artista2),
    esCantante(Artista),
    tocoEn(Banda, Artista),
    esCantante(Artista2),
    Artista \= Artista2. % \=(Artista,Artista2)


% El predicado "\=" NO ES INVERSIBLE.
% porque NO PUEDO HACER una consulta existencial (con variable).
% El predicado ">" TAMPOCO ES INVERSIBLE.
    
% Si la banda estaba viva en un año determinado.

estabaVivaEn(Banda, Anio):-
    vivioEntre(Banda, Comienzo,Fin),
    between(Comienzo,Fin,Anio).



/*
Si dos bandas son contemporáneas (porque se cruzaron en el tiempo, aunque haya sido sólo 1 año)

*/

:- begin_tests(entrenador).

test("Alguien que es entrenador debe ser cierto", nondet):-
    entrenador(misty).

test("Alguien que no es entrenador no debe ser cierto", fail):-
    entrenador(alf).

test("tieneA es inversible por el segundo parámetro", set(Poke == [pikachu, pidgeot, charizard])):-
    tieneA(ash, Poke).

:- end_tests(entrenador).