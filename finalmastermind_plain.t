/*
 File: finalmastermind.t
 Name: Yixing Qie
 Class: ICS2O1
 Date: Dec 21, 2016
 Description: The basics of mastermind plus extensions 1, 2 and part of 3

 LVL1
 -Allow user to set the number of guesses allowed
 -Has a two-player version in which the secret code is entered by a player
 -Has a one player version which the computer randomly generates colors
 -Restarts the game without restarting the program
 -Has graphics on the welcome and outcome screens

 LVL2
 -Strings (representing colours) are used instead of numbers for code and guesses and colors are validated

 LVL3
 -User can set the length of the code
 */

%setting the screen size and to graphics mode
setscreen ("graphics:1280;950,nobuttonbar")

%Setting the background color
colourback (200)
cls

%Variables and constants
%An array to store the different colors allowed in the game
var col : array 1 .. 8 of string
col (1) := "red"
col (2) := "green"
col (3) := "blue"
col (4) := "yellow"
col (5) := "brown"
col (6) := "orange"
col (7) := "black"
col (8) := "white"

%Variable for the code length that can be set by the players
var code_len : int

%Constants of characters that will end the game in the concluding screen
const GAMESTP := "N"
const GAMESTP_LOW := "n"
const GAMECONT := "Y"
const GAMECONT_LOW := "y"

%variable used to store value if color inputted is valid
var trig : int := 0

%second variable used to store value if color inputted is valid
var trig2 : int := 0

%Constant used to clear stored values
const CLR := 0

%Constants used to eliminate codes that have been guessed
const STAGE1_CLR := "A"
const STAGE2_CLR := "B"

%Variable to store guesses allowed
var guesses_allowed : int
%Variable to store number of colors in wrong place but right color
var wrongplace : int
%Variable used to store number of colors in the right place and are the right color
var rightplace : int

%Variable to store a copied number
var copynum_b : int


%Variable to store number to either go to instruction or game
var welcome_input : int
%Variable to store value to continue to game from instructions
var instruct_continue : string

%Variable to store input to close window if any key is entered
var closewin : string

%Variable to store input of if they want to play again
var playagain : string
%Storing the number of guesses they took to solve the game
var tries : int

%Variables of different fonts
var font1 : int
var font2 : int
var font3 : int
var font4 : int

%Variable to store number of players playing
var numplayers : int

%Variable to store a new window
var winID : int



%--------------------------------------------------------------------------Entire game starts-----------------------------------------------------------


%--------------------------------------------------------------Game loop begins----------------------------------------------------------------------------
%Loop structure to loop the game if players type "Y"
loop
    %-----------------------------------------------------------------------Welcome screen begins------------------------------------------------
    %Title displayed on the welcome screen
    color (66)
    font1 := Font.New ("Calibre:35:italic")
    Font.Draw ("Welcome to the Game", 400, 650, font1, brightcyan)

    %Picture on start screen
    Pic.ScreenLoad ("Logo.jpg", 400, 700, picCopy)

    %Shapes/graphics on the game
    Draw.FillOval (200, 100, 150, 50, brightred)
    Draw.FillOval (1080, 850, 150, 50, brightgreen)
    Draw.FillStar (1, 925, 200, 750, brightblue)
    Draw.FillStar (maxx, 1, 1000, 200, 43)
    Draw.ThickLine (0, 400, maxx, 400, 10, brightgreen)
    Draw.ThickLine (0, 300, maxx, 300, 10, brightmagenta)

    locate (11, 35)

    %Loop strucuture to keep asking which option until they enter the correct option
    loop
	color (46)
	%Prompting user on whether they want to play or look at instructions
	put "\n1. Type 1 to go to start the game"
	put "\n2. Type 2 to go to the instructions"
	put "Enter..." ..
	get welcome_input
	exit when (welcome_input = 1 or welcome_input = 2)
	put "\nInvalid input, Try again"
    end loop

    %If structure to determine whether to go to instructions are start
    if (welcome_input = 1) then
	%if they inputed one
	%Clear screen and go to game
	cls
    else
	%if they inputted 2
	%clears screen
	%displays the instructions of the game
	cls
	%Outputting the instructions of mastermind

	font2 := Font.New ("Calibre:40")
	Font.Draw ("Game Instructions", 400, 890, font2, magenta)
	locate (3, 20)
	%Beginning instructions
	put "\n-You will be directed to the settings page to choose either \none or two player mode"
	put "-After choose the length of the code \nand the number of guesses allowed"
	color (brightmagenta)
	%One player mode instructions
	put "In player one mode:"
	put "-The computer will generate a random colour code depending \non the code length set(the colors available are displayed)"
	color (yellow)
	%two player mode instructions
	put "In player two mode:"
	put "-One player will enter the different secret color code."
	color (white)
	%Overall instructions
	put "In either scenarios, you are then directed to the game"
	put "1. You (the player) must guess the colors (number of colors the code contains) \n in the proper order"
	put "2. After each guess the computer gives feedback on the number of colors correct,"
	put "and in the right places and the numbers of colors correct, but in wrong places"
	put "3. You will use the hints to help you guess the code"
	put "4. Once you guess the code, you win"

	%Prompt user to click any key
	color (brightred)
	put "Press a key and enter to continue to the game.."
	get instruct_continue

	color (55)
	%Starts the game and clears screen when any key is entered
	if (instruct_continue >= "!") then
	    cls
	    locate (5, 1)
	end if
    end if
    %---------------------------------------------------------------Welcome screen ends------------------------------------------------------------



    %-------------------------------------------------------------Setting screen begins-------------------------------------------------------------
    %Prompts user to enter settings of game

    %Title of the settings page
    font3 := Font.New ("Serif:60")
    Font.Draw ("Settings", 500, 850, font3, 100)
    locate (6, 1)

    Draw.FillOval (1100, 850, 150, 50, brightgreen)
    %Prompting user for number of players playing
    color (63)
    put "A. Number of players, either 1 or 2:  " ..
    loop
	get numplayers
	exit when numplayers = 1 or numplayers = 2
	put "Your input is invalid"
    end loop

    %Prompting user for the number of colors in the code
    color (13)
    put "\nB. Input the number of colors that the code will contain:  " ..
    Draw.FillBox (maxx, 300, 1000, 400, brightred)
    get code_len

    %Prompting the user for number of guesses allowed
    color (43)
    put "\nC. Number of times, the player can guess:  " ..
    Draw.FillStar (maxx, 500, 1000, 700, 43)
    get guesses_allowed

    %Arrays to accomodate the lengths of code and store the multiple values
    var numcode : array 1 .. code_len of string
    var num : array 1 .. code_len of int
    var tempt : array 1 .. code_len of string
    var input : array 1 .. code_len of string

    cls

    if (numplayers = 1) then
	%If one player, computer makes random colours
	%Random assigning of number for each array value until len
	for ran : 1 .. code_len
	    randint (num (ran), 1, 8)
	end for

	%Converting the random assigned number to colors
	for assign : 1 .. code_len
	    numcode (assign) := col (num (assign))
	end for

    else
	%If numplayers is 2 then it goes to 2 player mode
	color (brightpurple)
	%Prompt first player for number of guesses allowed
	font3 := Font.New ("Serif:35")
	Font.Draw ("Player One Inputs", 450, 880, font3, brightred)

	locate (4, 1)
	color (brightgreen)
	%Prompt user one for the 4 digit code and keeps asking until all colors are validated
	put "\nPlayer one enters his/her secret ", code_len, " colour code"

	%Different colours that can be inputted to create the code
	color (brightcyan)
	put "You can choose colors of:"
	put "1.red"
	put "2.green"
	put "3.blue"
	put "4.yellow"
	put "5.brown"
	put "6.orange"
	put "7.black"
	put "8.white\n"

	color (brightmagenta)
	%Prompts user to enter each color for the code and storing them in an array
	%Also verifies the color inputted is allowed-if not then asks again
	for store1 : 1 .. code_len
	    loop
		trig := CLR
		put "Input (in lowercase) color of code number #", store1, " of ", code_len, " :  " ..
		get numcode (store1)
		for check : 1 .. 8
		    if (numcode (store1) = col (check)) then
			trig := 1
		    end if
		end for
		exit when trig = 1
		put "Invalid, Retry \n"
	    end loop
	end for
    end if
    cls
    %--------------------------------------------------------------------------Setting screen ends-------------------------------------------------------------



    %----------------------------------------------------------------------------Game screen begins----------------------------------------------------------------

    %Setting screen to text mode so that scrolling is allowed
    setscreen ("Text")


    %First player color inputs and validations ends
    %Display on game screen
    if (numplayers = 1) then
	%If only one player, output the title for one player game
	put "\t\t\t   >>PLAYER-PLAY THE GAME!!<<"
    else
	%If only two players, output the title prompting second player to play the game
	put "\t\t\t   >>PLAYER TWO- PLAY THE GAME!!<<"
    end if


    %Outputting the actual code to be guessed- to check- close when game is used

    for e : 1 .. code_len
	put numcode (e), "  " ..
    end for


    %Displaying the number of guesses allowed in total
    put "\nYou are allowed:  ", guesses_allowed, " guess/ guesses."
    %Displaying how many colours make up the code
    put "\nNumber of colors in the code is:  ", code_len

    %Different colours that can be guessed
    put "\nYou can choose colors of:"
    put "1.red"
    put "2.green"
    put "3.blue"
    put "4.yellow"
    put "5.brown"
    put "6.orange"
    put "7.black"
    put "8.white"

    %For structure to run the times they can guess depending on the inputted guesses allowed
    for guessnum : 1 .. guesses_allowed
	put "\nThis is guess number: #", guessnum, " out of : ", guesses_allowed
	tries := guessnum

	%Resets the number of colors correct/in wrong places and number in correct places
	rightplace := CLR
	wrongplace := CLR

	%Prompting user for their guess and storing each guess in an array
	%Checks if the color guess is allowed- if not then it re-asks
	for storeguess : 1 .. code_len

	    loop
		trig := CLR
		put "Input (in lowercase) guess of color number #", storeguess, " of ", code_len, " :  " ..
		get input (storeguess)
		for check2 : 1 .. 8
		    if (input (storeguess) = col (check2)) then
			trig := 1
		    end if
		end for
		exit when trig = 1
		put "Invalid, Retry \n"
	    end loop
	end for


	%Making a duplicate set of the code- assigning the colors of the numcode array to the tempt array
	for dup : 1 .. code_len
	    tempt (dup) := numcode (dup)
	end for

	%Checking color guess is matching with the color of the corresponding spot of the code
	%if matches, then add one to the rightplace and sets that duplicate of the code to a different value
	for checkplace : 1 .. code_len
	    if (input (checkplace) = tempt (checkplace)) then
		rightplace := rightplace + 1
		tempt (checkplace) := STAGE1_CLR
	    end if
	end for

	%If not correct and in right place, using if structure to determine if color is right, but in wrong place
	%If so then it adds one to the wrongplace and sets that sets that duplicate of the code to a different value
	for num_a : 1 .. code_len
	    trig2 := CLR
	    if (tempt (num_a) not= STAGE1_CLR) then
		for num_b : 1 .. code_len
		    if (num_a not= num_b) then
			if (input (num_a) = tempt (num_b)) then
			    wrongplace := wrongplace + 1
			    copynum_b := num_b
			    trig2 := trig2 + 1
			end if
		    end if
		    exit when input (num_a) = tempt (num_b)
		end for
		if (trig2 = 1) then
		    tempt (copynum_b) := STAGE2_CLR
		end if
	    end if
	end for


	%Outputting the number of colors correct and number of colors correct but in wrong places
	put "The number of colors that are correct and in the right places are:  ", rightplace
	put "The number of colors that are correct but are in the wrong places are:  ", wrongplace


	%Exiting for structure if all the colors are in the right place
	exit when rightplace = code_len
    end for
    %---------------------------------------------------------------------------Game screen ends--------------------------------------------------------------



    %------------------------------------------------------------------------Concluding screen begins---------------------------------------------------------
    %Opening a new window for the concluding screen

    winID := Window.Open ("position:top;center,graphics:1000;300")
    colorback (black)
    cls

    %if structure to determine what to display on the concluding screen

    if (rightplace = code_len) then
	%They have broken the code
	%Outputting that they won and number of tries it took
	color (yellow)
	locate (1, 35)
	put "\nCongratulation, you have broken the code in ", tries, " try/tries!!!"
	color (white)
	put "You had guessed the code:  " ..
	color (66)
	for i : 1 .. code_len
	    put numcode (i), " " ..
	end for
	%Graphics on the concluding screen
	Draw.ThickLine (0, 100, maxx, 100, 8, brightgreen)
	Draw.ThickLine (0, 50, maxx, 50, 8, brightmagenta)
	Draw.FillStar (0, 0, 200, 150, brightgreen)
	Draw.FillStar (300, 0, 500, 150, white)
	Draw.FillStar (700, 0, 500, 150, yellow)
	Draw.FillStar (800, 0, maxx, 150, white)

    else
	%Ran out of guesses
	%Outputting that they did not break the code
	%Outputting the correct answers
	Draw.FillBox (maxx, 0, 0, 100, brightred)

	locate (1, 35)
	color (white)
	put "\nYOU DID NOT BREAK THE CODE"
	put "The correct answer was:  " ..
	color (66)
	for i : 1 .. code_len
	    put numcode (i), " " ..
	end for
    end if



    %Prompting user if they want to play again
    color (yellow)
    put "\nDo you want to play again (Y or N)"

    %To put an a big x on the concluding screen if you did not solve the code
    if (rightplace not= code_len) then
	Draw.ThickLine (700, maxy, maxx, 0, 10, 44)
	Draw.ThickLine (maxx, maxy, 700, 0, 10, 44)
    end if

    %Checking if input inputted is valid and then exits, else it keeps re-asking
    loop
	get playagain
	exit when playagain = GAMESTP or playagain = GAMESTP_LOW or playagain = GAMECONT or playagain = GAMECONT_LOW
	put "Invalid, try again"
    end loop
    cls


    %stopping the game if they typed "N or n", otherwise they had typed a "Y or y" and the game loops again
    exit when playagain = GAMESTP or playagain = GAMESTP_LOW
    %--------------------------------------------------------------------Concluding screen ends-----------------------------------------------------------------



    %Sets screen to graphics mode and background before loops again
    setscreen ("graphics:1280;950,nobuttonbar")
    colourback (200)
    cls
end loop
%-------------------------------------------------------------Game loop ends--------------------------------------------------------------------------------------



%--------------------------------------------------------------------Game over screen begins----------------------------------------------------------------------
%Outputting game finished if they types "N"
cls
font4 := Font.New ("TimesNewRoman:80")
Font.Draw ("GAME FINISHED", 90, 200, font4, brightred)
locate (5, 15)

%Prompting user to input any key to close window
put "Enter any key to close all windows!!"

%Drawing lines on the gameover screen
Draw.ThickLine (0, 100, maxx, 100, 10, brightgreen)
Draw.ThickLine (0, 50, maxx, 50, 10, brightmagenta)

%Getting user input
get closewin

%If structure to check if any key is entered
%if so, then the windows are closed
if (closewin >= "!") then
    Window.Close (winID)
    delay (200)
    Window.Close (defWinID)
end if

%-------------------------------------------------------------------Game over screen ends--------------------------------------------------------------------------


%-------------------------------------------------------------------Entire game ends--------------------------------------------------------------------------------------
