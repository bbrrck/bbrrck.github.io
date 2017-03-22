// ---------------------------------------------
// Analyse numerique 2017
// Pagora, Grenoble INP, 1ere annee
//
// TP2 - Approximation de fonctions
//
// Exo 5 : Interpolation
// ---------------------------------------------
//
// Cours :
//   Valerie Perrier 
//   <Valerie.Perrier@univ-grenoble-alpes.fr>
//
// TD,TP :
//   Tibor Stanko
//   <tibor.stanko@inria.fr>
//

//------------------------------------------------
//
// P=LAGRANGE(X,Y)
// Calculer le polynome d’interpolation de Lagrange
// associe aux noeuds X et valeurs Y. 
//
// source: http://bit.ly/2ndAg7q
//
function[P]=lagrange(X,Y)
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
//
// Y=RUNGE(X)
// Evaluer la fonction de Runge pour X.
//
function[Y]=Runge(X)
    Y = 1./(1.+25.*X.^2);
endfunction

//------------------------------------------------

clf; set(gca(),"data_bounds",[-1,-2;1,2]);

// nombre d'echantillons
n = 5;

// points a interpoler
// abscisse uniforme
xp = linspace(-1,1,n);


// TODO :
//  1. calculer yp
//  2. calculer P, le polynome d'interpolation de Lagrange
//  3. faire un plot des points (xp,yp)
//  4. faire un plot de polynome P
