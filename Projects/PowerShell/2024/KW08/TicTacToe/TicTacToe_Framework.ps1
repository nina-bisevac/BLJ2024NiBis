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
 
    $currentPlayer = $playerOneSymbol  # Setze Spieler Eins als Startspieler
    $gameOver = $false
 
    while (-not $gameOver) {
        Show-Board $board
 
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
 
        for ($i = 0; $i -lt 9; $i++) {
            if($i % 2 -eq 1)
            {
                $row = Read-Host "Player $currentPlayer, choose row (0-2)"
                $col = Read-Host "Player $currentPlayer, choose column (0-2)"
               
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
 
 
 }
function Switch-Player(){
 
       
}
 
Clear-Host
Run-Game -board $board -startingPlayer $playerOneSymbol