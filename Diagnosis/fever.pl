/** 
 * fever.pl - Source code for a medical diagnosis program.
 * 
 * @author  Wilson Perdomo, Jackie Phung
 * @version 04-10-16
 */
diagnosis(pneumonia).
diagnosis(acute_bronchitis).
diagnosis(influenza).
diagnosis(meningitis).
diagnosis(gastroenteritis).
diagnosis(rash_with_fever).
diagnosis(throat_infection).
diagnosis(kidney_infection).
diagnosis(urinary_tract_infection).
diagnosis(heat_sunstroke).
diagnosis(consult_physician).

no_decedent(c, a).
no_decedent(d, b).
no_decedent(h, c).
no_decedent(f, d).
no_decedent(g, e).
no_decedent(c, f).
no_decedent(h, g).
no_decedent(i, h).
no_decedent(j, i).
no_decedent(k, j).
no_decedent(l, k).
no_decedent(n, l).
no_decedent(consult_physician, n).

yes_decedent(b, a).
yes_decedent(pneumonia, b).
yes_decedent(e, c).
yes_decedent(acute_bronchitis, d).
yes_decedent(meningitis, e).
yes_decedent(influenza, f).
yes_decedent(gastroenteritis, g).
yes_decedent(influenza, h).
yes_decedent(rash_with_fever, i).
yes_decedent(throat_infection, j).
yes_decedent(kidney_infection, k).
yes_decedent(urinary_tract_infection, l).
yes_decedent(heat_sunstroke, n).

go :-
  write('The diagnosis will start.'), nl,
  visit(a).

visit(X) :-
  not(diagnosis(X)),
  prompt(X),
  yes_decedent(Y, X),
  visit(Y).

visit(X) :-
  not(diagnosis(X)),
  no_decedent(Y, X),
  visit(Y).

visit(X) :-
  cwrite(['The diagnosis is ', X, '.']), nl.

prompt(a) :-
  write('Do you have a cough? '),
  response(Reply),
  Reply = 'y'.

prompt(b) :-
  write('Are you short of breath even when resting? '),
  response(Reply),
  Reply = 'y'.

prompt(c) :-
  write('Do you have a headache? '),
  response(Reply),
  Reply = 'y'.

prompt(d) :-
  write('Have you been coughing up grayish-yellow phlegm, AND/OR have you been'),
  nl, write('wheezing? '),
  response(Reply),
  Reply = 'y'.

prompt(e) :-
  write('Do you have one or more of the following symptoms?'), nl,
  write('* pain when bending the head forward'), nl,
  write('* nausea or vomiting'), nl,
  write('* dislike of brigh light'), nl,
  write('* drowsiness or confusion'),
  response(Reply),
  Reply = 'y'.

prompt(f) :-
  write('Do you have a headache AND/OR aching joints or bones? '),
  response(Reply),
  Reply = 'y'.

prompt(g) :-
  write('Have you vomited or had diarrhea? '),
  response(Reply),
  Reply = 'y'.

prompt(h) :-
  write('Do you have aching joints or bones? '),
  response(Reply),
  Reply = 'y'.

prompt(i) :-
  write('Do you have a rash? '),
  response(Reply),
  Reply = 'y'.

prompt(j) :-
  write('Do you have a sore throat? '),
  response(Reply),
  Reply = 'y'.

prompt(k) :-
  write('Do you have pain in the small of your back on one side just above'), 
  nl, write('the waist? '),
  response(Reply),
  Reply = 'y'.

prompt(l) :-
  write('Do you have pain when you urinate AND/OR are you urinating '),
  nl, write('more frequently than usual? '),
  response(Reply),
  Reply = 'y'.

prompt(m) :-
  write('Have you spent most of the day in strong sunlight or in very '),
  nl, write('hot conditions? '),
  response(Reply),
  Reply = 'y'.

cwrite([]).

cwrite([Arg | Args]) :-
  write(Arg),
  cwrite(Args).

response(Reply) :-
  get_single_char(Code),
  put_code(Code), nl,
  char_code(Reply, Code).  
