
% SIMPLE MEDICAL HELPER (Beginner Project)
% asks symptoms → checks fever → suggests
% disease + doctor + basic medicine advice


:- dynamic yes/1,no/1.

%  START PROGRAM 

start :-
    clear_old_answers,
    nl,
    write('*** Welcome to Medical Helper ***'), nl,
    write('Answer with yes. or no.'), nl, nl,
    check_fever,        % ask temperature first
    diagnose.

%  ASK FEVER TEMPERATURE

check_fever :-
    write('Enter your body temperature in Celsius (example 101.): '),
    read(Temp),
    assert(yes(temperature(Temp))), nl.

high_fever :-
    yes(temperature(T)),
    T >= 100.

mild_fever :-
    yes(temperature(T)),
    T < 100.

%  DISEASE RULES

% Flu (high fever + cough + body pain)
disease(flu) :-
    high_fever,
    symptom(cough),
    symptom(body_pain).

% Common Cold (mild fever + sneezing)
disease(common_cold) :-
    mild_fever,
    symptom(sneezing),
    symptom(sore_throat).

% Migraine
disease(migraine) :-
    symptom(headache),
    symptom(nausea).

% Food Poisoning
disease(food_poisoning) :-
    symptom(stomach_pain),
    symptom(nausea),
    high_fever.

% Heart Problem
disease(heart_problem) :-
    symptom(chest_pain),
    symptom(breathing_problem).

%  DOCTOR SUGGESTION 

doctor(flu, general_physician).
doctor(common_cold, general_physician).
doctor(migraine, neurologist).
doctor(food_poisoning, gastroenterologist).
doctor(heart_problem, cardiologist).

%  MEDICINE SUGGESTION 

medicine(flu, 'Paracetamol, rest, drink warm fluids').
medicine(common_cold, 'Cough syrup, steam inhalation').
medicine(migraine, 'Pain reliever and proper sleep').
medicine(food_poisoning, 'ORS, hydration, light food').
medicine(heart_problem, 'Immediate medical attention').

%  ASK SYMPTOMS 

symptom(S) :-
   (yes(S) -> true ;
    (no(S) -> fail ;
     ask(S))).

ask(S) :-
    write('Do you have '), write(S), write('? : '),
    read(Ans),
    nl,
    ( (Ans == yes)
      -> assert(yes(S)) ;
         assert(no(S)), fail).

%  FINAL DIAGNOSIS

diagnose :-
    disease(D),
    doctor(D,Doc),
    medicine(D,Med),
    nl,
    write(' '), nl,
    write('Possible Disease : '), write(D), nl,
    write('Consult Doctor   : '), write(Doc), nl,
    write('Basic Advice     : '), write(Med), nl,
    write(' '), nl.

diagnose :-
    write('Sorry, I cannot identify the problem clearly.'), nl,
    write('Please visit a doctor.'), nl.

%  RESET MEMORY

clear_old_answers :-
    retract(yes(_)), fail.
clear_old_answers :-
    retract(no(_)), fail.
clear_old_answers.

