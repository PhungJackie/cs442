/** 
 * headache.pl - Source code for a medical diagnosis program.
 * 
 * @author  Wilson Perdomo, Jackie Phung
 * @version 04-10-16
 */
diagnosis(meningitis).
diagnosis(fever).
diagnosis(extradural_hemorrhage).
diagnosis(brain_injury).
diagnosis(acute_glaucoma).
diagnosis(subarachnoid_hemorrhage).
diagnosis(migraine).
diagnosis(hangover).
diagnosis(high_blood_pressure).
diagnosis(medicine_side_effect).
diagnosis(sinusitis).
diagnosis(cold).
diagnosis(anxiety).
diagnosis(strain_neck_muscles).
diagnosis(benign_headache).
diagnosis(contact_physician).

no_decedent(injured_head, temp_above).
no_decedent(fever, pain_severe).
no_decedent(felt_nauseated, injured_head).
no_decedent(fever, painful_head).
no_decedent(brain_injury, feeling_drowsy).
no_decedent(medicine, felt_nauseated).
no_decedent(hemorrage_prompt, pain_eyes).
no_decedent(pain_preceeded, hemorrage_prompt).
no_decedent(headache_wakingup, pain_preceeded).
no_decedent(medicine, headache_wakingup).
no_decedent(high_blood_pressure, headache_alcohol).
no_decedent(runny_nose, medicine).
no_decedent(stress, runny_nose).
no_decedent(cold, tenderness_eyes).
no_decedent(close_work, stress).
no_decedent(no_concern, close_work).
no_decedent(contact_physician, no_concern).

yes_decedent(pain_severe, temp_above).
yes_decedent(painful_head, pain_severe).
yes_decedent(feeling_drowsy, injured_head).
yes_decedent(meningitis, painful_head).
yes_decedent(extradural_hemorrhage, feeling_drowsy).
yes_decedent(pain_eyes, felt_nauseated).
yes_decedent(acute_glaucoma, pain_eyes).
yes_decedent(subarachnoid_hemorrhage, hemorrage_prompt).
yes_decedent(migraine, pain_preceeded).
yes_decedent(headache_alcohol, headache_wakingup).
yes_decedent(hangover, headache_alcohol).
yes_decedent(medicine_side_effect, medicine).
yes_decedent(tenderness_eyes, runny_nose).
yes_decedent(sinusitis, tenderness_eyes).
yes_decedent(anxiety, stress).
yes_decedent(strain_neck_muscles, close_work).
yes_decedent(benign_headache, no_concern).

go :-
  write('The diagnosis will start.'), nl,
  visit(temp_above).

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

prompt(temp_above) :-
  write('Is your temperature 100°F (38°F) or above? '),
  response(Reply),
  Reply = 'y'.

prompt(pain_severe) :-
  write('Is the pain severe? '),
  response(Reply),
  Reply = 'y'.

prompt(injured_head) :-
  write('Have you injured your head within the past few days? '),
  response(Reply),
  Reply = 'y'.

prompt(painful_head) :-
  write('Is it painful to bend your head forward AND/OR does light hurt your '),
  nl, write('eyes? '),
  response(Reply),
  Reply = 'y'.

prompt(feeling_drowsy) :-
  write('Are you feeling unsually drowsy AND/OR have you felt nauseated or'),
  nl, write('been vomiting? '),
  response(Reply),
  Reply = 'y'.

prompt(felt_nauseated) :-
  write('Have you felt nauseated or been vomiting? '),
  response(Reply),
  Reply = 'y'.

prompt(pain_eyes) :-
  write('Do you have severe pain in and around one eye AND is your vision '),
  nl, write('in that eye blurred? '),
  response(Reply),
  Reply = 'y'.

prompt(hemorrage_prompt) :-
  write('Do you have one or more of the following symptoms? '), nl,
  write('* pain when you bend your head forward'), nl,
  write('* dislike of bright light'), nl,
  write('* drowsiness or confusion'),
  response(Reply),
  Reply = 'y'.

prompt(pain_preceeded) :-
  write('Was the pain preceded by disturbed vision or relieved by vomiting? '),
  response(Reply),
  Reply = 'y'.

prompt(headache_wakingup) :-
  write('Have you had a similar headache on waking several days out of the '),
  nl, write('past week or more? '),
  response(Reply),
  Reply = 'y'.

prompt(headache_alcohol) :-
  write('Do the headaches occur when you have drunk a lot of alcohol the '),
  nl, write('night before? '),
  response(Reply),
  Reply = 'y'.

prompt(medicine) :-
  write('Are you currently taking any medicines? '),
  response(Reply),
  Reply = 'y'.

prompt(runny_nose) :-
  write('Have you recently had or do you know have a runny or stuffy nose? '),
  response(Reply),
  Reply = 'y'.

prompt(tenderness_eyes) :-
  write('Do you have dull pain and tenderness around the eyes and '),
  nl, write('cheek-bones that worsens when you bend forwards? '),
  response(Reply),
  Reply = 'y'.

prompt(stress) :-
  write('Are you feeling tense or under stress AND/OR are you sleeping poorly? '),
  response(Reply),
  Reply = 'y'.

prompt(close_work) :-
  write('Did the headache occur after you had been reading or doing '),
  nl, write('close work such as sewing? '),
  response(Reply),
  Reply = 'y'.

prompt(no_concern) :-
  write('Did any of the following apply in the 12 hours before '),
  nl,write('the headache started? '), nl,
  write('* you were exposed to strong sunlight'), nl,
  write('* you were in stuffy, smoky or noisy surroundings'), nl,
  write('* you missed a meal'),
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
