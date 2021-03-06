// ----------------------------------------------------------------
// Analyse numerique 2017
// Pagora, Grenoble INP, 1ere annee
// TP2  : Approximation de fonctions
// Exo5 : Interpolation
// ----------------------------------------------------------------
// Cours : Valerie Perrier <Valerie.Perrier@univ-grenoble-alpes.fr>
// TD,TP : Tibor Stanko <tibor.stanko@inria.fr>
// ----------------------------------------------------------------
// derniere modif : 24 mars 2017
// ----------------------------------------------------------------

// P = LAGRANGE(X,Y)
// Calculer le polynome d’interpolation de Lagrange associe a l'abscisse X et valeurs Y. 
// source: http://bit.ly/2ndAg7q
function[P]=Lagrange(X,Y)
  n = length(X);
  x = poly(0,"x");
  P = 0;    
  for i = 1:n, 
    L = 1;
    for j = [1:i-1,i+1:n],
      L = L * (x-X(j))/(X(i)-X(j));
    end
    P = P + L*Y(i); 
  end
endfunction
//------------------------------------------------

// Y = RUNGE(X)
// Evaluer la fonction de Runge pour X.
function[Y]=Runge(X)
    Y = 1+25*X.^2;
    Y = 1 ./ Y;
endfunction
//------------------------------------------------

// on efface la figure
clf;

// on definit le nombre d'echantillons
n = 5;

// points a interpoler : abscisse uniforme de l'interval [-1,1] avec n points
xp = linspace(-1,1,n);

// TODO :
//   1. calculez yp, les valeurs de fonction de Runge pour xp
//   2. calculez P(x), le polynome qui interpole (xp,yp)
//   3. plot, points (xp,yp)
//   4. plot, polynome P(x)
//   5. testez pour n=3,5,7,9,... Vous pouvez faire ca dans une boucle: for n=3:2:9, ... end
