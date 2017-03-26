// ----------------------------------------------------------------
// Analyse numerique 2017
// Pagora, Grenoble INP, 1ere annee
// TP4  : Systemes lineaires et equations differentielles
// Exo2 : Equation de la chaleur 
// ----------------------------------------------------------------
// Cours : Valerie Perrier <Valerie.Perrier@univ-grenoble-alpes.fr>
// TD,TP : Tibor Stanko <tibor.stanko@inria.fr>
// ----------------------------------------------------------------
// derniere modif : 26 mars 2017    
// ----------------------------------------------------------------

clc;show_window();f=gcf();clf();f.color_map=jetcolormap(1024);ax=gca();ax.isoview='on';

// ================================================================
// Parametres :
// ----------------------------------------------------------------
//  pas de temps    
    dt = 0.001;
//  resolution (calcul fait sur une matrice res x res)
    N = 20;
//  nombre d'iterations
    iter = 250;
// ================================================================

// ================================================================
// TODO : 
//   Construire la matrice initiale de temperature T0.
//   - interieur :   0
//   - bord      : 100
// ================================================================
//T0 = zeros(N,N);
//...
//...
//...
//...

// indices
a = 1:N-2;
b = 2:N-1;
c = 3:N;

// iterer
T1 = T0;
for i=1:iter,
    // ================================================================
    // TODO :
    // Calculer la prochaine iteration T1 avec la methode d'Euler explicite.
    // ================================================================
    //T1 = ...
    T0 = T1;
    // ================================================================
    // on visualise la temperature
    Sgrayplot( 1:N, 1:N, T0, strf="080",zminmax=[0,100]);
end
