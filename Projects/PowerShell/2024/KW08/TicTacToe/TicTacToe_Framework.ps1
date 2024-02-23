$board = @( ('','',''),
            ('','',''),
            ('','',''))
 
 
$playerOneSymbol = 'X'
$playerTwoSymbol = 'O'
 
function Run-Game(){
    param(
        [string[][]]$board
    )
    Insert-Tile $board $row $col $currentPlayer
 
    $currentPlayer = $playerOneSymbol  
    $gameOver = $false
 
    while (-not $gameOver) {
 
        $winner = Get-Winner $board
        if ($winner -ne $null) {
            $gameOver = $true
            Show-Board $board
            Write-Host "Player $winner wins!"
        } elseif (($board -match '')) {
            $gameOver = $true
            Show-Board $board
        } else {
            $currentPlayer = Switch-Player $currentPlayer
        }$board = @( ('','',''),
        ('','',''),
        ('','',''))


$playerOneSymbol = 'X'
$playerTwoSymbol = 'O'
$x = 1
$y = 2

function Run-Game(){
param(
    [string[][]]$board
)
Insert-Tile $board $row $col $currentPlayer

$currentPlayer = $playerOneSymbol  
$gameOver = $false

while (-not $gameOver) {

    $winner = Get-Winner $board
    if ($winner -ne $null) {
        $gameOver = $true
        Show-Board $board
        Write-Host "Player $winner wins!"
    } elseif (-not($board -match '')) {
        $gameOver = $true
        Show-Board $board
        Write-Host "It's a tie!"
    } else {
        $currentPlayer = Switch-Player $currentPlayer
    }
    for ($i = 0; $i -lt 9; $i++) {
        if($i % 2 -eq 1)
        {
            $row = Read-Host "Player $currentPlayer, choose row (0-2)"
            $col = Read-Host "Player $currentPlayer, choose column (0-2)"
            Show-Board
        }
        else {
            $row = Read-Host "Player $playerTwoSymbol, choose row (0-2)"
            $col = Read-Host "Player $playerTwoSymbol, choose column (0-2)"
            Show-Board
        }
    }
   
}
}



function Get-Winner(){

}

function Insert-Tile(){
Write-Host " Wecome to Tic Tac Toe, let' play!"

}

function  Show-Board(){
Write-Host "-----------"
Write-Host "|"$board[0][0]"|"$board[0][1]"|"$board[0][2]"|"
Write-Host "|"$board[1][0]"|"$board[1][1]"|"$board[1][2]"|"
Write-Host "|"$board[2][0]"|"$board[2][1]"|"$board[2][2]"|"
Write-Host "-----------"

for($i = 0; $i -lt 9; $i++) {
$row = $i / 3
$col = $i % 3
if ($i % 2 -eq 1) {
 $board[$row][$col] =  $playerOneSymbol

}
else {
    $board[$row][$col] = $playerTwoSymbol
   
}
}
for ($h = 0; $h -lt 3; $h++) {
for ($c = 0; $c -lt 3; $c++) {
    Write-Host -NoNewline $board[$h][$c]
}
Write-Host
}
}
function Switch-Player(){
for ($i = 0; $i -lt 9; $i++) {
    if($i % 2 -eq 1)
    {
        $row = Read-Host "Player $currentPlayer, choose row (0-2)"
        $col = Read-Host "Player $currentPlayer, choose column (0-2)"
        Show-Board
    }
    else {
        $row = Read-Host "Player $playerTwoSymbol, choose row (0-2)"
        $col = Read-Host "Player $playerTwoSymbol, choose column (0-2)"
        Show-Board
    }
}
   
}

Clear-Host
Run-Game -board $board -startingPlayer $playerOneSymbol
 
        for ($i = 0; $i -lt 9; $i++) {
            if($i % 2 -eq 1)
            {
                $row = Read-Host "Player $currentPlayer, choose row (0-2)"
                $col = Read-Host "Player $currentPlayer, choose column (0-2)"
                Show-Board

              
            }
            else {
                $row = Read-Host "Player $playerTwoSymbol, choose row (0-2)"
                $col = Read-Host "Player $playerTwoSymbol, choose column (0-2)"
                Show-Board
            }
        }
    }
}

❤︎
 
function Get-Winner(){
   
}
 
function Insert-Tile(){
Write-Host " Wecome to Tic Tac Toe, let's play!"
   
}
 
function  Show-Board(){
 Write-Host "-----------"
 Write-Host "|"$board[0][0]"|"$board[0][1]"|"$board[0][2]"|"
 Write-Host "|"$board[1][0]"|"$board[1][1]"|"$board[1][2]"|"
 Write-Host "|"$board[2][0]"|"$board[2][1]"|"$board[2][2]"|"
 Write-Host "-----------"
 
 
 }
function Switch-Player(){
 
       
}
 
Clear-Host
Run-Game -board $board -startingPlayer $playerOneSymbol