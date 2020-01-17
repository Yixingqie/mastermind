/*
 File: mastermindLVL1.t
 Name: Yixing Qie
 Class: ICS2O1
 Date: Dec 21, 2016
 Description: The basics of mastermind plus extension number 1
 */

%Sets the background
colourback (255)
cls

%Loop structure to loop the game if players type "Y"
loop

    %Start screen start
const C1:= "red"
const C2:= "green"
const C3:= "blue"
const C4:= "yellow"
const C5:= "brown"
const C6:= "orange"
const C7:= "black"
const C8:= "white"
const CLR := 0
const STAGE1_CLR:= "A"
const STAGE2_CLR:= "B"

var num1 : string
var num2 : string
var num3 : string
var num4 : string

var input1 : string
var input2 : string
var input3 : string
var input4 : string

var tempt1 : string
var tempt2 : string
var tempt3 : string
var tempt4 : string

var guesses_allowed : int
var rightwrong : int
var rightright : int

const GAMESTP := "N"

var opt : int
var opt2 : string
var opt3 : string

var playagain : string
var tries : int

var font1: int 
var font2: int
var font3: int
var font4: int

    %Welcoming user to the game

color (66)
font1 := Font.New("Calibre:35") 
Font.Draw("Welcome to the Game", 450, 2700, font1, brightcyan)

%Picture on start screen
Pic.ScreenLoad ("Logo.jpg", 450, 2800, picCopy)

locate (11, 35)

%Loop strucuture to keep asking which option until they enter the correct option
loop
color (46)
 %Prompting user on whether they want to play or look at instructions
    put "\n1. Type one to go to the instructions"
    put "2. Type two to go to start the game"
    put "Enter..."..
	get opt
exit when (opt = 1 or opt = 2)
    put "\nInvalid input, Try again"
end loop


%If structure to determine whether to go to instructions are start
if (opt = 2) then
%Clear screen and go to game
  cls
else
  cls
%Outputting the instructions of mastermind

font2 := Font.New("Calibre:50") 
Font.Draw("Game Instructions", 450, 2900, font2, magenta) 
locate (6, 20)
    put "\nThe instructions are:"
    put "1. The computer will generate a random 4 digit code- each digit it from 1-8"
    put "2. You must guess the 4 numbers in the proper order(one complete guess is \n the guess of all 4 numbers)"
    put "3. After each guess the computer gives feedback on the numbers of number correct \n but in wrong places and the numbers of number correct but in wrong places"
    put "4. You will use the hints to help you guess the code"
    put "5. Once you guess the code, you win\n\n\n"

%Prompt user to click any key
    put "Press a key to continue to the game.."
    get opt2

%Starts the game and clears screen
    if (opt2 >= "!" and opt2 <= "z") then
	cls
    end if
end if
%Start screen end

color (brightpurple)
%Prompt first player for number guess allowed
font3 := Font.New("TimesNewRoman:35") 
Font.Draw("Player ONE Inputs", 450, 2900, font1, brightred)

locate (6, 1)
put "Player one, enter the amount of times player 2 can guess:  " ..
get guesses_allowed
put "\n\n"

%Prompt user one for the 4 digit code and keeps asking until all numbers are validated
put "Player one enters his/her secret 4 digit code"
loop
    put "Input first number (1-8):  " ..
    get num1
    exit when num1 = C1 or num1 = C2 or num1 = C3 or num1 = C4 or num1 = C5 or num1 = C6 or num1 = C7 or num1 = C8 
    put "Invalid, Retry \n"
end loop

loop
     put "Input second number (1-8):  " ..
     get num2
     exit when num2 = C1 or num2 = C2 or num2 = C3 or num2 = C4 or num2 = C5 or num2 = C6 or num2 = C7 or num2 = C8 
     put "Invalid, Retry \n"
end loop

loop
     put "Input third number (1-8):  " ..
     get num3
     exit when num3 = C1 or num3 = C2 or num3 = C3 or num3 = C4 or num3 = C5 or num3 = C6 or num3 = C7 or num3 = C8 
     put "Invalid, Retry \n"
end loop

loop
     put "Input fourth number (1-8):  " ..
     get num4
     exit when num4 = C1 or num4 = C2 or num4 = C3 or num4 = C4 or num4 = C5 or num4 = C6 or num4 = C7 or num4 = C8 
      put "Invalid, Retry \n"
end loop
    cls
%First player number input and validations ends


%The Game :))))
   font4 := Font.New("Calibre:35") 
   Font.Draw("PLAYER TWO- PLAY THE GAME!!", 350, 2950, font1, brightwhite)

   locate (4, 1)
put num1, " ", num2, " ",  num3, " ", num4
put "You are allowed:  ", guesses_allowed, " guesses."

for i : 1 .. guesses_allowed
    put "\nThis is guess number: #", i
    tries := i


%Resets the number of numbers correct or in correct places
rightright := CLR
rightwrong := CLR

%Prompting user for input and re-asking if not valid
     color (brightgreen)
	loop
	    put "Input guess of first number (1-8):  " ..
	    get input1
	    exit when input1 = C1 or input1 = C2 or input1 = C3 or input1 = C4 or input1 = C5 or input1 = C6 or input1 = C7 or input1 = C8 
	    put "Invalid, Retry \n"
	end loop

	loop
	    put "Input guess of second number (1-8):  " ..
	    get input2
	    exit when input2 = C1 or input2 = C2 or input2 = C3 or input2 = C4 or input2 = C5 or input2 = C6 or input2 = C7 or input2 = C8 
	    put "Invalid, Retry \n"
	end loop

	loop
	    put "Input guess of third number (1-8):  " ..
	    get input3
	    exit when input3 = C1 or input3 = C2 or input3 = C3 or input3 = C4 or input3 = C5 or input3 = C6 or input3 = C7 or input3 = C8 
	    put "Invalid, Retry \n"
	end loop

	loop
	    put "Input guess of fourth number (1-8):  " ..
	    get input4
	    exit when input4 = C1 or input4 = C2 or input4 = C3 or input4 = C4 or input4 = C5 or input4 = C6 or input4 = C7 or input4 = C8 
	    put "Invalid, Retry \n"
	end loop

	%Exiting for structure if all the numbers are in the right place
	exit when input1 = num1 and input2 = num2 and input3 = num3 and input4 = num4


	%If structures to determine the number of numbers that are correct or not correct
	%and if right, determining if they are in the right place
	tempt1 := num1
	tempt2 := num2
	tempt3 := num3
	tempt4 := num4

	if (input1 = tempt1) then
	    rightright := rightright + 1
	    tempt1 := STAGE1_CLR
	end if

	if (input2 = tempt2) then
	    rightright := rightright + 1
	    tempt2 := STAGE1_CLR
	end if

	if (input3 = tempt3) then
	    rightright := rightright + 1
	    tempt3 := STAGE1_CLR
	end if

	if (input4 = tempt4) then
	 rightright := rightright + 1
	    tempt4 := STAGE1_CLR
	end if


%If not correct and in right place, using if structure to determine is number is right, but in wrong place

	if (tempt1 not = STAGE1_CLR)then 
	     if (input1 = tempt2) then
		     rightwrong:= rightwrong + 1
		     tempt2:= STAGE2_CLR
	     elsif (input1 = tempt3) then
		     rightwrong := rightwrong + 1
		     tempt3:=STAGE2_CLR
	     elsif  (input1 = tempt4) then
		     rightwrong := rightwrong + 1
		     tempt4:= STAGE2_CLR
	     else
	     end if
	end if
	
	if (tempt2 not = STAGE1_CLR)then 
	     if (input2 = tempt1) then
		     rightwrong:= rightwrong + 1
		     tempt1:= STAGE2_CLR
	     elsif (input2 = tempt3) then
		     rightwrong := rightwrong + 1
		     tempt3:= STAGE2_CLR
	     elsif (input2 = tempt4) then
		     rightwrong := rightwrong + 1
		     tempt4:= STAGE2_CLR
	     else
	     end if
	end if

	  if (tempt3 not = STAGE1_CLR)then 
	     if (input3 = tempt1) then
		     rightwrong:= rightwrong + 1
		     tempt1:= STAGE2_CLR
	     elsif (input3 = tempt2) then
		     rightwrong := rightwrong + 1
		     tempt2:= STAGE2_CLR
	     elsif (input3 = tempt4) then
		     rightwrong := rightwrong + 1
		     tempt4:= STAGE2_CLR
	     else
	     end if
	end if

	  if (tempt4 not = STAGE1_CLR)then 
	     if (input4 = tempt1) then
		     rightwrong:= rightwrong + 1
		     tempt1:= STAGE2_CLR
	     elsif (input4 = tempt2) then
		     rightwrong := rightwrong + 1
		     tempt2:= STAGE2_CLR
	     elsif (input4 = tempt3) then
		     rightwrong := rightwrong + 1
		     tempt3:= STAGE2_CLR
	     else
	     end if
	end if
    

	%Outputting the number of numbers correct and number of numbers correct but in wrong places
	colour (cyan)
	put "The number of numbers that are correct and in the right places are:  ", rightright
	put "The number of numbers that are correct but are in the wrong places are:  ", rightwrong
end for



    if (input1 = num1 and input2 = num2 and input3 = num3 and input4 = num4) then
	%Outputting that they won and number tries it took
	color (165)
	put "\nCongratulation, you have broken the code in ", tries, " try/tries!!!"

    else
	color (white)
	put "\nYOU DID NOT BREAK THE CODE", ",  The correct answer was:  ", num1, " ", num2, " ",  num3, " ", num4

    end if



    %Prompting user if they want to play again
    color (yellow)
    put "Do you want to play again (Y or N)"
    get playagain

    %stopping the game if they type "N", otherwise game loops again
    exit when playagain = GAMESTP

    cls
end loop

%Outputting game finished if they types "N"
put "GAME FINISHED"


