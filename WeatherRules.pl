/* 
	Assignment 4
	Katherine Le
	10188031
*/


% match takes 3 parameters which are month, day, word and return true if there is a fact for the given month and day that contains the given word 
match(Month,Day,Word):-
	weather(Month,Day,Word,_,_); weather(Month,Day,_,Word,_); weather(Month,Day,_,_,Word).


% wet takes 2 parameters which are month, day and return true if there is a fact telling us that there was either rain or snow for that day.
% wet1 check for fact that has rain day.
% wet2 check for fact that has snow day.
wet(Month,Day):-
	wet1(Month,Day);
	wet2(Month,Day).
wet1(Month,Day):-
	weather(Month,Day,rain,_,_); weather(Month,Day,_,rain,_); weather(Month,Day,_,_,rain).
wet2(Month,Day):-
	weather(Month,Day,snow,_,_); weather(Month,Day,_,snow,_); weather(Month,Day,_,_,snow).


% dessert takes 2 parameters which are month, day and return true if the weather on the given day was both hot and dry.
% dessert1 check for fact that has dry day.
% desset2 check for fact that has hot day.
dessert(Month,Day):-
	dessert1(Month,Day), dessert2(Month,Day).
dessert1(Month,Day):-
	weather(Month,Day,dry,_,_); weather(Month,Day,_,dry,_); weather(Month,Day,_,_,dry).
dessert2(Month,Day):-
	weather(Month,Day,hot,_,_); weather(Month,Day,_,hot,_); weather(Month,Day,_,_,hot).


% tropical takes 2 parameters which are month, day and return true if the day was hot and had some rain.
% tropical1 check for fact that has rain day.
% tropical2 check for fact that has hot day.
tropical(Month,Day):-
	tropical1(Month,Day), tropical2(Month,Day).
tropical1(Month,Day):-
	weather(Month,Day,rain,_,_); weather(Month,Day,_,rain,_); weather(Month,Day,_,_,rain).
tropical2(Month,Day):-
	weather(Month,Day,hot,_,_); weather(Month,Day,_,hot,_); weather(Month,Day,_,_,hot).


% impossible takes 2 parameters which are month, day and return true if the day was hot or warm but had snow.
% impossible1 check for fact that has warm day.
% impossible2 check for fact that has snow day.
impossible(Month,Day):-
	impossible1(Month,Day), impossible2(Month,Day).
impossible1(Month,Day):-
	(weather(Month,Day,warm,_,_); weather(Month,Day,_,warm,_); weather(Month,Day,_,_,warm));
	(weather(Month,Day,hot,_,_); weather(Month,Day,_,hot,_); weather(Month,Day,_,_,hot)).
impossible2(Month,Day):-
	weather(Month,Day,snow,_,_); weather(Month,Day,_,snow,_); weather(Month,Day,_,_,snow).


% summer return true if month is jun, jul, or aug.
summer(jun).
summer(jul).
summer(aug).

% winter return true if month is jan, feb, or mar.
winter(jan).
winter(feb).
winter(mar).


% unseasonable takes 2 parameters which are month, day and return true if there was unseasonable weather on that day. 
% summerDay check for fact that has warm or hot day.
% winterDay check for fact that has cold or cool day.
unseasonable(Month,Day):-
	(winter(Month), summerDay(Month,Day));(summer(Month), winterDay(Month,Day)).
summerDay(Month,Day):-
	(weather(Month,Day,warm,_,_); weather(Month,Day,_,warm,_); weather(Month,Day,_,_,warm));
	(weather(Month,Day,hot,_,_); weather(Month,Day,_,hot,_); weather(Month,Day,_,_,hot)).
winterDay(Month,Day):-
	(weather(Month,Day,cold,_,_); weather(Month,Day,_,cold,_); weather(Month,Day,_,_,cold));
	(weather(Month,Day,cool,_,_); weather(Month,Day,_,cool,_); weather(Month,Day,_,_,cool)).


% mixed takes 2 parameters which are month, day and return true if there was at least one hot day and at least one cold day in the month.
mixed(Month):-
	(weather(Month,_,cold,_,_); weather(Month,_,_,cold,_); weather(Month,_,_,_,cold)),
	(weather(Month,_,hot,_,_); weather(Month,_,_,hot,_); weather(Month,_,_,_,hot)).










