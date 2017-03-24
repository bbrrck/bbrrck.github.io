// ----------------------------------------------------------------
// Analyse numerique 2017
// Pagora, Grenoble INP, 1ere annee
// TP2  : Approximation de fonctions
// Exo4 : Méthode des moindres carres
// ----------------------------------------------------------------
// Cours : Valerie Perrier <Valerie.Perrier@univ-grenoble-alpes.fr>
// TD,TP : Tibor Stanko <tibor.stanko@inria.fr>
// ----------------------------------------------------------------

// TODO : variez le degre de polynome P
n = 1;

// TODO : testez avec l'Ensemble 1, puis avec l'Ensemble 2 (il faut decommenter le code)


// ---------------------------------------------------------
// Ensemble 1 : Global Land-Ocean Temperature Index
// https://data.giss.nasa.gov/gistemp/graphs_v3/Fig.A2.txt
// ---------------------------------------------------------
// x = annees 1880-2016, vecteur colonne
x = (1880:2016)';
// y = temperature, vecteur colonne
y = [-0.2, -0.11, -0.09, -0.2, -0.27, -0.31, -0.3, -0.33, -0.2, -0.11, -0.36, -0.24, -0.26, -0.3, -0.3, -0.21, -0.14, -0.1, -0.28, -0.15, -0.08, -0.14, -0.28, -0.36, -0.44, -0.28, -0.22, -0.39, -0.43, -0.47, -0.42, -0.44, -0.34, -0.34, -0.16, -0.1, -0.33, -0.39, -0.25, -0.21, -0.25, -0.2, -0.27, -0.23, -0.27, -0.19, -0.09, -0.2, -0.21, -0.36, -0.14, -0.09, -0.16, -0.29, -0.14, -0.19, -0.15, -0.02, -0.03, -0.03, 0.08, 0.13, 0.1, 0.13, 0.26, 0.12, -0.03, -0.05, -0.09, -0.09, -0.18, -0.06, 0.01, 0.08, -0.12, -0.15, -0.2, 0.04, 0.07, 0.03, -0.02, 0.05, 0.03, 0.06, -0.2, -0.1, -0.05, -0.02, -0.07, 0.07, 0.03, -0.09, 0.01, 0.15, -0.08, -0.02, -0.12, 0.18, 0.07, 0.17, 0.27, 0.32, 0.13, 0.3, 0.15, 0.11, 0.19, 0.33, 0.4, 0.28, 0.44, 0.42, 0.23, 0.24, 0.31, 0.45, 0.35, 0.48, 0.63, 0.41, 0.42, 0.54, 0.63, 0.62, 0.54, 0.69, 0.63, 0.66, 0.54, 0.64, 0.71, 0.6, 0.63, 0.65, 0.74, 0.86, 0.98]';
// ---------------------------------------------------------


// ---------------------------------------------------------
// Ensemble 2 : Fonctions analytiques bruites
// ---------------------------------------------------------
//// option 1 : exp, interval [0,2]
//x = linspace(0,2,100)';
//y = exp(x);

//// option 2 : sin, interval [0,2pi]
//x = linspace(0,2*%pi,100)';
//y = sin(x);

//// ajouter du bruit aleatoire dans la direction y
//y = y + 0.5*rand(size(y,1),size(y,2));
// ---------------------------------------------------------


// nombre d'echantillons
N = length(x);

// on initialise la matrice de systeme
J = ones(N,n+1);

//
// TODO : remplir la colonne i+1 de matrice J avec x.^i, pour i entre 1 et n
//

// on resout le systeme de moindres carres
// pour obtenir les coefficients de polynome
c = (J'*J) \ (J'*y);

// on cree le polynome
P = poly(c,'x','coeff');

// on efface la figure
clf;

// plot : donnees
plot(x,y,'k.','MarkerSize',4);

// plot : polynome
plot(x,horner(P,x),'r-','LineWidth',3);
