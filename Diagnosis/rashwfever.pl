/** 
 * rashwfever.pl - Source code for a medical diagnosis program.
 * 
 * @author  Wilson Perdomo, Jackie Phung
 * @version 04-10-16
 */
diagnosis(measles).
diagnosis(german_measles).
diagnosis(chickenpox).
diagnosis(meningitis).
diagnosis(allergic_purpura).
diagnosis(consult_physician).

no_decedent(d, a).
no_decedent(c, b).
no_decedent(d, c).
no_decedent(e, d).
no_decedent(consult_physician, e).
no_decedent(allergic_purpura, f).

yes_decedent(b, a).
yes_decedent(measles, b).
yes_decedent(german_measles, c).
yes_decedent(chickenpox, d).
yes_decedent(f, e).
yes_decedent(meningitis, f).

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
  write('Do you have any red spots or blotches? '),
  response(Reply),
  Reply = 'y'.

prompt(b) :-
  write('Do you have two or more of the following symptoms? '), nl,
  write('* runny nose'), nl,
  write('* sore red eyes'), nl,
  write('* dry cough '),
  response(Reply),
  Reply = 'y'.

prompt(c) :-
  write('Is there any abnormal swelling down the sides of your neck or at '), 
  nl, write('the base of your skull? '),
  response(Reply),
  Reply = 'y'.

prompt(d) :-
  write('Do you have raised red and itchy spots that turn into blisters? '),
  response(Reply),
  Reply = 'y'.

prompt(e) :-
  write('Do you have a rash of purple spots? '),
  response(Reply),
  Reply = 'y'.

prompt(f) :-
  write('Do you have two or more of the following symptoms? '), nl,
  write('* vomiting'), nl,
  write('* headache'), nl,
  write('* dislike of strong light'), nl,
  write('* pain when trying to bend your head forward '),
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
