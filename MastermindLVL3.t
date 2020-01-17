/*
 File: mastermindLVL3.t
 Name: Yixing Qie
 Class: ICS2O1
 Date: Dec 21, 2016
 Description: The basics of mastermind plus extension 3
 */

setscreen ("graphics:max;max,nobuttonbar")

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

var len : int

const GAMESTP := "N"
const GAMESTP_LOWER := "n"

var trig : int := 0

const CLR := 0
const STAGE1_CLR := "A"
const STAGE2_CLR := "B"

var guesses_allowed : int
var wrongplace : int
var rightplace : int

var opt : int
var opt2 : string
var opt3 : string

var playagain : string
var tries : int

var font1 : int
var font2 : int
var font3 : int
var font4 : int

var numplayers : int


%Loop structure to loop the game if players type "Y"
loop
    %Welcoming user to the game

    color (66)
    font1 := Font.New ("Calibre:35")
    Font.Draw ("Welcome to the Game", 400, 650, font1, brightcyan)

    %Picture on start screen
    Pic.ScreenLoad ("Logo.jpg", 400, 700, picCopy)
    Draw.FillOval (200, 100, 150, 50, brightred)
    Draw.FillOval (maxx - 200, maxy - 100, 150, 50, brightgreen)
    Draw.FillStar (1, 925, 200, 750, brightblue)
    Draw.FillStar (maxx, 1, 1000, 200, brightblue)

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
	Font.Draw ("Game Instructions", 400, 850, font2, magenta)
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

	color (55)
	%Starts the game and clears screen
	if (opt2 >= "!" and opt2 <= "z") then
	    cls
	end if
    end if
    %Start screen end

    font3 := Font.New ("TimesNewRoman:35")
    Font.Draw ("Settings", 400, 850, font1, 100)
    locate (5, 1)
    put "Enter 1 for one player and enter 2 for two player"
    locate (6, 1)
    loop
	get numplayers
	exit when numplayers = 1 or numplayers = 2
	put "Your input is invalid"
    end loop


    %Prompts user to enter settings of game
    put "Input the length of the code to be set"..
    get len
    put "Number of times, the player can guess:  "..
    get guesses_allowed

    %Array varables to accomodate the lengths of code
    var numcode : array 1 .. len of string
    var num : array 1 .. len of int
    var tempt : array 1 .. len of string
    var input : array 1 .. len of string

    cls

    if (numplayers = 2) then

	color (brightpurple)
	%Prompt first player for number of guesses allowed
	font3 := Font.New ("TimesNewRoman:35")
	Font.Draw ("Player ONE Inputs", 400, 850, font1, brightred)

	locate (6, 1)
	color (brightcyan)
	put "You can choose colors of:"
	put "1.red"
	put "2.green"
	put "3.blue"
	put "4.yellow"
	put "5.brown"
	put "6.orange"
	put "7.black"
	put "8.white"

	color (brightgreen)
	%Prompt user one for the 4 digit code and keeps asking until all colors are validated
	put "\nPlayer one enters his/her secret 4 colour code"

	for a : 1 .. len
	    loop
		trig := CLR
		put "Input color number - ", a, " :  " ..
		get numcode (a)
		for i : 1 .. 8
		    if (numcode (a) = col (i)) then
			trig := 1
		    end if
		end for
		exit when trig = 1
		put "Invalid, Retry \n"
	    end loop
	end for
    elsif (numplayers = 1) then
	%If one player, computer makes random colours
	%Random assigning of number for each array value until len
	for g : 1 .. len
	    randint (num (g), 1, 8)
	end for

	%Converting the random assigned number to colors
	for d : 1 .. len
	    numcode (d) := col (num (d))
	end for
    else
	put "Incorrect value"
    end if

    cls

    %First player color inputs and validations ends
    %Display on game screen
    if (numplayers = 1) then
	font4 := Font.New ("Calibre:35")
	Font.Draw ("PLAYER-PLAY THE GAME!!", 300, 900, font1, brightwhite)
    else
	font4 := Font.New ("Calibre:35")
	Font.Draw ("PLAYER TWO- PLAY THE GAME!!", 300, 900, font1, brightwhite)
    end if

    %The Game :))))
    color (red)
    locate (4, 1)
    for s : 1 .. len
	put numcode (s), "  " ..
    end for

    put "You are allowed:  ", guesses_allowed, " guesses."

    for i : 1 .. guesses_allowed
	color (77)
	put "\nThis is guess number: #", i, " out of : ", guesses_allowed
	tries := i

	color (brightgreen)
	%Resets the number of colors correct/in wrong places and number in correct places
	rightplace := CLR
	wrongplace := CLR

	%Prompting user for input and re-asking if not valid
	for f : 1 .. len
	    loop
		trig := CLR
		put "Input color guess number -", f, ":  " ..
		get input (f)
		for g : 1 .. 8
		    if (input (f) = col (g)) then
			trig := 1
		    end if
		end for
		exit when trig = 1
		put "Invalid, Retry \n"
	    end loop
	end for


	%If structures to determine the number of colors that are correct or not correct
	%and if right, determining if they are in the right place
	for k : 1 .. len
	    tempt (k) := numcode (k)
	end for

	for y : 1 .. len
	    if (input (y) = tempt (y)) then
		rightplace := rightplace + 1
		tempt (y) := STAGE1_CLR
	    end if
	end for


	%Exiting for structure if all the colors are in the right place
	exit when rightplace = len


	%If not correct and in right place, using if structure to determine if color is right, but in wrong place
	for t : 1 .. len
	    if (tempt (t) not= STAGE1_CLR) then
		for n : 1 .. len
		    if (input (t) = tempt (n)) then
			wrongplace := wrongplace + 1
			tempt (n) := STAGE2_CLR
		    end if
		    exit when input (t) = tempt (n)
		end for
	    end if
	end for


	%Outputting the number of colors correct and number of colors correct but in wrong places
	colour (cyan)
	put "The number of colors that are correct and in the right places are:  ", rightplace
	put "The number of colors that are correct but are in the wrong places are:  ", wrongplace
    end for



    if (rightplace = len) then
	%Outputting that they won and number of tries it took
	color (165)
	put "\nCongratulation, you have broken the code in ", tries, " try/tries!!!"
    else
	color (white)
	put "\nYOU DID NOT BREAK THE CODE", ",  The correct answer was:  " ..
	for v : 1 .. len
	    put numcode (v), " " ..
	end for
    end if

    %Prompting user if they want to play again
    color (yellow)
    put "Do you want to play again (Y or N)"
    get playagain

    %stopping the game if they type "N", otherwise game loops again
    exit when playagain = GAMESTP or playagain = GAMESTP_LOWER
    cls
end loop

%Outputting game finished if they types "N"
put "GAME FINISHED"


