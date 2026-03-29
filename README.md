# Medical-Diagnosis-System
This Project has been created using Prolog Programming<br>
The Medical Helper Expert System is a rule-based application developed using Prolog that assists users in identifying possible diseases based on symptoms. It mimics basic decision-making of a medical expert by asking questions and applying logical rules.
This system is designed as a beginner-level Artificial Intelligence project to demonstrate how expert systems work using logic programming

## Tools used 
- Vs code
- Prolog
## Code Blocks
```bash
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
```
This block of code is used for asking temperature the following logic is based on this block
```bash
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
```
It takes input from the user and based on if else loop it displayses output as disease accquired

## outcome of the project 
-	To develop a simple AI-based diagnostic tool 
-	To understand rule-based systems in Prolog 
-	To simulate basic medical reasoning 
-	To provide: 
-	Possible disease 
-	Suggested doctor 
-	Basic advice

## Future Enhancement
-	Add more diseases and symptoms 
- Include severity levels (mild/moderate/severe) 
-	Improve accuracy using scoring system 
-	Add graphical user interface (GUI) 
-	Convert to web or mobile application
- Integrate with real medical databases 



