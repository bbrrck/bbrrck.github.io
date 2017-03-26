// ----------------------------------------------------------------
// Analyse numerique 2017
// Pagora, Grenoble INP, 1ere annee
// TP4  : Systemes lineaires et equations differentielles
// Exo1 : Splines cubiques
// ----------------------------------------------------------------
// Cours : Valerie Perrier <Valerie.Perrier@univ-grenoble-alpes.fr>
// TD,TP : Tibor Stanko <tibor.stanko@inria.fr>
// ----------------------------------------------------------------
// derniere modif : 26 mars 2017
// ----------------------------------------------------------------

clc;show_window();f=gcf();clf();f.color_map=jetcolormap(64);ax=gca();ax.isoview='on'; 

// ================================================================
//   Choisir l'indice d'un ensemble
//     1 : 'cercle'
//     2 : 'infini'
//     3 : 'somme'
//     4 : 'bunny'
//
ensemble = 1;
// ================================================================

switch ensemble,
   case 1 // cercle
        P=[1 0;0 1;-1 0;0 -1];
        
    case 2 // infini
        P=[0 0;-1 1;-1.4 0;-1 -1;0 0;1 1;1.4 0;1 -1];
        
    case 3 // somme
        P=[0 0;-2 2;2 2;2 1;3 1;3 3;-4 3;-1 0;-4 -3;3 -3;3 -1;2 -1;2 -2;-2 -2];
        
    case 4 // bunny
        P=[0.479235 0.734823;0.197138 1.238313;-0.305166 1.254277;-0.462664 1.291683;-0.498101 1.429494;-0.112431 1.650821;-0.190980 1.858676;-0.620162 1.549586;-0.707196 1.806660;-0.779934 1.558888;-0.894476 1.507099;-0.908886 1.358889;-0.947103 1.212127;-0.865382 1.091771;-0.844096 0.769094;-0.571152 0.588759;-0.571152 0.481030;-0.718098 0.372514;-0.055188 0.333612;0.575382 0.528936];
        
    otherwise
        error('ensemble doit etre entre 1 et 4.')
end

// ================================================================
// TODO : 
//   Varier n = nombre de points par morceau
n = 10;
// ================================================================

// p = nombre de contraintes
p = size(P,1)
// N = nombre de points total
N = p*n;

// ================================================================
// TODO :
//   Definir les variables 'indices' et 'coeffs' 
//   pour calculer les differences finies
//
//   https://en.wikipedia.org/wiki/Finite_difference_coefficient
// ================================================================
//indices =...
//coeffs  =...

// initialiser A = matrice de systeme
A = zeros(N,N);

// initialiser B = matrice des valeurs
B = zeros(N,2);

// remplir A
for i=1:N,
    j = modulo(indices+i+N,N);
    j(j==0) = N;
    A(i,j) = coeffs;
end

// ajouter des contraintes dans A et B
for i=1:p,
    A(n*i,:) = 0;
    A(n*i,n*i) = 1;
    B(n*i,:) = P(i,:);
end

// ================================================================
// TODO :
//   Resoudre le systeme A*X=B en utilisant la factorisation LU
//   (aide fonction lu de scilab) » help lu
// ================================================================
//...
//...
//...

// ================================================================
// TODO : decommenter la ligne suivante pour tracer la courbe
//xpoly(X(:,1),X(:,2),"lines",1);h=get("hdl");h.thickness=3;h.foreground=16;
// ================================================================
// TODO : decommenter la ligne suivante pour afficher tous les points
//plot2d(X(:,1),X(:,2),-1,strf='080');
// ================================================================

// visualiser les donnees
plot2d(P(:,1),P(:,2),-9,strf='080');
