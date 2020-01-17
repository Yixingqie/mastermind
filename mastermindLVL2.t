/*
 File: mastermindLVL2.t
 Name: Yixing Qie
 Class: ICS2O1
 Date: Dec 21, 2016
 Description: The basics of mastermind plus extension 2
 */

%Sets the background
colourback (black)
cls

%Start screen start
var col : array 1 .. 8 of string
col (1) := "red"
col (2) := "green"
col (3) := "blue"
col (4) := "yellow"
col (5) := "brown"
col (6) := "orange"
col (7) := "black"
col (8) := "white"

var trig : int := 0

const CLR := 0
const STAGE1_CLR := "A"
const STAGE2_CLR := "B"

var color1 : string
var color2 : string
var color3 : string
var color4 : string

var input1 : string
var input2 : string
var input3 : string
var input4 : string

var tempt1 : string
var tempt2 : string
var tempt3 : string
var tempt4 : string

var guesses_allowed : int
var wrongplace : int
var rightplace : int

const GAMESTP := "N"

var opt : int
var opt2 : string
var opt3 : string

var playagain : string
var tries : int

var font1 : int
var font2 : int
var font3 : int
var font4 : int


%Loop structure to loop the game if players type "Y"
loop
    %Welcoming user to the game

    color (66)
    font1 := Font.New ("Calibre:35")
    Font.Draw ("Welcome to the Game", 450, 2700, font1, brightcyan)

    %Picture on start screen
    Pic.ScreenLoad ("Logo.jpg", 450, 2800, picCopy)

    locate (11, 35)

    %Loop strucuture to keep asking which option until they enter the correct option
    loop
	color (46)
	%Prompting user on whether they want to play or look at instructions
	put "\n1. Type one to go to the instructions"
	put "2. Type two to go to start the game"
	put "Enter..." ..
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

	font2 := Font.New ("Calibre:50")
	Font.Draw ("Game Instructions", 450, 2900, font2, magenta)
	locate (5, 20)
	put "\nThe instructions are:"
	put "1. The computer will generate a random 4 colour code - of 8 colors of red, green,\n blue, brown, white, orange, yellow, black\n"
	put "2. You must guess the 4 colors in the proper order(one complete guess is \n the guess of all 4 colors)\n"
	put "3. After each guess the computer gives feedback on the number of colors correct, \n but in the right places and the numbers of colors correct, but in wrong places\n"
	put "4. You will use the hints to help you guess the code\n"
	put "5. Once you guess the code, you win\n"

	%Prompt user to click any key
	color (brightred)
	put "Press a key to continue to the game.."
	get opt2

	color(55)
	%Starts the game and clears screen
	if (opt2 >= "!" and opt2 <= "z") then
	    cls
	end if
    end if
    %Start screen end

    color (brightpurple)
    %Prompt first player for number of guesses allowed
    font3 := Font.New ("TimesNewRoman:35")
    Font.Draw ("Player ONE Inputs", 450, 2900, font1, brightred)

    locate (6, 1)
    put "Player one, enter the amount of times player 2 can guess:  " ..
    get guesses_allowed
    put "\n\n"

    %Prompt user one for the 4 digit code and keeps asking until all colors are validated
    put "Player one enters his/her secret 4 colour code"

    trig := CLR
    loop
	put "Input first color(1-8):  " ..
	get color1
	for i : 1 .. 8
	    if (color1 = col (i)) then
		trig := 1
	    end if
	end for
	exit when trig = 1
	put "Invalid, Retry \n"
    end loop


    trig := CLR
    loop
	put "Input second color(1-8):  " ..
	get color2
	for i : 1 .. 8
	    if (color2 = col (i)) then
		trig := 1
	    end if
	end for
	exit when trig = 1
	put "Invalid, Retry \n"
    end loop


    trig := CLR
    loop
	put "Input third color(1-8):  " ..
	get color3
	for i : 1 .. 8
	    if (color3 = col (i)) then
		trig := 1
	    end if
	end for
	exit when trig = 1
	put "Invalid, Retry \n"
    end loop


    trig := CLR
    loop
	put "Input fourth color(1-8):  " ..
	get color4
	for i : 1 .. 8
	    if (color4 = col (i)) then
		trig := 1
	    end if
	end for
	exit when trig = 1
	put "Invalid, Retry \n"
    end loop
    cls
    %First player color inputs and validations ends


    %The Game :))))
    font4 := Font.New ("Calibre:35")
    Font.Draw ("PLAYER TWO- PLAY THE GAME!!", 350, 2950, font1, brightwhite)

    locate (4, 1)
    put color1, " ", color2, " ", color3, " ", color4
    put "You are allowed:  ", guesses_allowed, " guesses."



    for i : 1 .. guesses_allowed
	put "\nThis is guess number: #", i
	tries := i


	%Resets the number of colors correct/in wrong places and number in correct places
	rightplace := CLR
	wrongplace := CLR

	%Prompting user for input and re-asking if not valid
	color (brightgreen)


	trig := CLR
	loop
	    put "Input guess of first color(1-8):  " ..
	    get input1
	    for j : 1 .. 8
		if (input1 = col (j)) then
		    trig := 1
		end if
	    end for
	    exit when trig = 1
	    put "Invalid, Retry \n"
	end loop


	trig := CLR
	loop
	    put "Input guess of second color(1-8):  " ..
	    get input2
	    for j : 1 .. 8
		if (input2 = col (j)) then
		    trig := 1
		end if
	    end for
	    exit when trig = 1
	    put "Invalid, Retry \n"
	end loop


	trig := CLR
	loop
	    put "Input guess of third color(1-8):  " ..
	    get input3
	    for j : 1 .. 8
		if (input3 = col (j)) then
		    trig := 1
		end if
	    end for
	    exit when trig = 1
	    put "Invalid, Retry \n"
	end loop


	trig := CLR
	loop
	    put "Input guess of fourth color(1-8):  " ..
	    get input4
	    for j : 1 .. 8
		if (input4 = col (j)) then
		    trig := 1
		end if
	    end for
	    exit when trig = 1
	    put "Invalid, Retry \n"
	end loop
	trig := CLR


	%Exiting for structure if all the colorbers are in the right place
	exit when input1 = color1 and input2 = color2 and input3 = color3 and input4 = color4

	%If structures to determine the number of colors that are correct or not correct
	%and if right, determining if they are in the right place
	tempt1 := color1
	tempt2 := color2
	tempt3 := color3
	tempt4 := color4

	if (input1 = tempt1) then
	    rightplace := rightplace + 1
	    tempt1 := STAGE1_CLR
	end if

	if (input2 = tempt2) then
	    rightplace := rightplace + 1
	    tempt2 := STAGE1_CLR
	end if

	if (input3 = tempt3) then
	    rightplace := rightplace + 1
	    tempt3 := STAGE1_CLR
	end if

	if (input4 = tempt4) then
	    rightplace := rightplace + 1
	    tempt4 := STAGE1_CLR
	end if


	%If not correct and in right place, using if structure to determine if color is right, but in wrong place

	if (tempt1 not= STAGE1_CLR) then
	    if (input1 = tempt2) then
		wrongplace := wrongplace + 1
		tempt2 := STAGE2_CLR
	    elsif (input1 = tempt3) then
		wrongplace := wrongplace + 1
		tempt3 := STAGE2_CLR
	    elsif (input1 = tempt4) then
		wrongplace := wrongplace + 1
		tempt4 := STAGE2_CLR
	    else
	    end if
	end if


	if (tempt2 not= STAGE1_CLR) then
	    if (input2 = tempt1) then
		wrongplace := wrongplace + 1
		tempt1 := STAGE2_CLR
	    elsif (input2 = tempt3) then
		wrongplace := wrongplace + 1
		tempt3 := STAGE2_CLR
	    elsif (input2 = tempt4) then
		wrongplace := wrongplace + 1
		tempt4 := STAGE2_CLR
	    else
	    end if
	end if


	if (tempt3 not= STAGE1_CLR) then
	    if (input3 = tempt1) then
		wrongplace := wrongplace + 1
		tempt1 := STAGE2_CLR
	    elsif (input3 = tempt2) then
		wrongplace := wrongplace + 1
		tempt2 := STAGE2_CLR
	    elsif (input3 = tempt4) then
		wrongplace := wrongplace + 1
		tempt4 := STAGE2_CLR
	    else
	    end if
	end if


	if (tempt4 not= STAGE1_CLR) then
	    if (input4 = tempt1) then
		wrongplace := wrongplace + 1
		tempt1 := STAGE2_CLR
	    elsif (input4 = tempt2) then
		wrongplace := wrongplace + 1
		tempt2 := STAGE2_CLR
	    elsif (input4 = tempt3) then
		wrongplace := wrongplace + 1
		tempt3 := STAGE2_CLR
	    else
	    end if
	end if


	%Outputting the number of colors correct and number of colors correct but in wrong places
	colour (cyan)
	put "The number of colors that are correct and in the right places are:  ", rightplace
	put "The number of colors that are correct but are in the wrong places are:  ", wrongplace
    end for



    if (input1 = color1 and input2 = color2 and input3 = color3 and input4 = color4) then
	%Outputting that they won and number of tries it took
	color (165)
	put "\nCongratulation, you have broken the code in ", tries, " try/tries!!!"
    else
	color (white)
	put "\nYOU DID NOT BREAK THE CODE", ",  The correct answer was:  ", color1, " ", color2, " ", color3, " ", color4
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


