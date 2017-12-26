'=============================================
'=         pong by diamondcreeper098         =
'=         email: dmnd098@gmail.com          =
'=      github:github.com/diamondcreeper098  =
'=============================================
'ball
ballW = 20
ballH = 20
ballX = 25
ballY = 1
'paddle player
padW = 20
padH = 60
padX = 1
padY = 1
'enemy paddle
pad2W = 20
pad2H = 60
pad2X = 620
pad2Y = 1
'screen
scrW = 640
scrH = 480
spd = 10 ' speed
spdY = 5 'ball upside
spdX = 5 'ball sides
plyscr = 0 'player score
cpuscr = 0 'cpu score
SCREEN 12
PRINT "Game by diamondcreeper098"
PRINT "email : dmnd098@gmail.com"
PRINT "github : github.com/diamondcreeper098"
_DELAY 2
PRINT "press Esc to escape"
PRINT "press up arrow key to make your paddle go up"
PRINT "press down arrow key to make your paddle go down"
_DELAY 2
10 ballX = 25
ballY = 1
CLS
DO 'main loop
    k$ = INKEY$ 'key input
    LOCATE 1, 1
    PRINT "CPU: " + STR$(cpuscr)
    PRINT "Player: " + STR$(plyscr)
    IF k$ = CHR$(0) + CHR$(80) THEN 'down arrow
        padY = padY + spd
    ELSEIF k$ = CHR$(0) + CHR$(72) THEN 'up arrow
        padY = padY - spd
        'END IF
    END IF
    pad2Y = ballY 'moving enemy paddle with ball

    ballX = ballX + spdX 'ball starting speed
    ballY = ballY + spdY
    IF ballX > scrW THEN 'player wins
        plyscr = plyscr + 1
        GOTO 10
    ELSEIF ballX < 1 THEN ' cpu wins
        cpuscr = cpuscr + 1
        GOTO 10
    END IF
    IF ballY > scrH - ballH THEN
        spdY = -5
    ELSEIF ballY = 1 THEN
        spdY = 5
    END IF
    IF padX < ballX + ballW AND padX + padW > ballX AND padY < ballY + ballH AND padH + padY > ballY THEN ' collision detection
        spdX = 5
    END IF
    IF pad2X < ballX + ballW AND pad2X + pad2W > ballX AND pad2Y < ballY + ballH AND pad2H + pad2Y > ballY THEN ' collision detection
        spdX = -5
    END IF
    LINE (ballX, ballY)-(ballX + ballW, ballY + ballH), 5, BF 'Drawing ball
    LINE (padX, padY)-(padX + padW, padY + padH), 6, BF 'drawing pad1
    LINE (pad2X, pad2Y)-(pad2X + pad2W, pad2Y + padH), 8, BF 'drawing pad2
    _DELAY 0.05
    CLS
LOOP UNTIL k$ = CHR$(27)
