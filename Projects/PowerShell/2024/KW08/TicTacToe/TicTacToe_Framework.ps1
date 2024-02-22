$board = @( ('','',''),
            ('','',''),
            ('','',''))
 
 
$playerOneSymbol = 'X'
$playerTwoSymbol = 'O'
 
function Run-Game(){
    param(
        [string[][]]$board
    )
 
    $currentPlayer = $playerOneSymbol 
    $gameOver = $false
 
    while (-not $gameOver) {
        Show-Board $board
 
        for ($i = 0; $i -lt 9; $i++)
        {
            $row = Read-Host "Player $currentPlayer, choose row (0-2)"
            $col = Read-Host "Player $currentPlayer, choose column (0-2)"
        }
 
       
 
        Insert-Tile $board $row $col $currentPlayer
 
        $winner = Get-Winner $board
        if ($winner -ne $null) {
            $gameOver = $true 
            Show-Board $board
            Write-Host "Player $winner wins!"
        } elseif (($board -match '')) {
            $gameOver = $true
            Show-Board $board
            Write-Host "It's a tie!"
        } else {
            $currentPlayer = Switch-Player $currentPlayer
        }
    }
}
 
   
 
function Get-Winner(){
 
}
 
function Insert-Tile(){
Write-Host " Wecome to Tic Tac Toe"
   
}
 
function  Show-Board(){
 Write-Host "-----------"
 Write-Host "|"$board[0][0]"|"$board[0][1]"|"$board[0][2]"|"
 Write-Host "|"$board[1][0]"|"$board[1][1]"|"$board[1][2]"|"
 Write-Host "|"$board[2][0]"|"$board[2][1]"|"$board[2][2]"|"
 Write-Host "-----------"
 }
function Switch-Player(){
    for ($i = 0; $i -lt 9; $i++) {
        if($i % 2 -eq 1)
        {
            Write-Host X:
        }
        else {
            Write-Host O:
        }
        }
}
 
Clear-Host
Run-Game -board $board -startingPlayer $playerOneSymbol
 