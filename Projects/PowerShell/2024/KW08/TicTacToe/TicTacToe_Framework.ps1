$board = @( ('.','.','.'),
            ('.','.','.'),
            ('.','.','.'))
 
 
$global:playerOneSymbol = 'X'
$global:playerTwoSymbol = 'O'
$global:count = 1
 
 
 
 
 
 
   
 
function Get-Winner($board){
    for($a = 0; $a -lt 2; $a++){    
        $i = $a  
        if($i -eq 0){$i = 'X'}
        else{$i = 'O'}
        for ($row = 0; $row -lt 3; $row++){
            if ($board[$row][0] -ne '.' -and $board[$row][0] -eq $board[$row][1] -and $board[$row][1] -eq $board[$row][2] -and $board[$row][2] -eq $i)
            {
            return Write-Host "The winner is $i"
            break
            }
           
        }
        if($i -eq $null){
                return
            }        
           
 
        for($col = 0; $col -lt 3; $col++){  
            if ($board[0][$col] -ne '.' -and $board[0][$col] -eq $board[1][$col] -and $board[1][$col] -eq $board[2][$col] -and $board[2][$col] -eq $i)
            {
                return Write-Host "The winner is $i"
                break
            }
        }
 
        if($i -eq $null){
                return
            }
           
            if ($board[0][0] -ne '.' -and $board[0][0] -eq $board[1][1] -and $board[1][1] -eq $board[2][2] -and $board[2][2] -eq $i)
            {
                return Write-Host "The winner is $i"
                break
            }
        if($i -eq $null){
                    return
                }        
       
       
            if ($board[0][2] -ne '.' -and $board[0][2] -eq $board[1][1] -and $board[1][1] -eq $board[2][0] -and $board[2][2] -eq $i)
            {
                return Write-Host "The winner is $i"
                break
            }
        if($i -eq $null){
                    return
                }      
           
    }
}          
       
 
 
function Insert-Tile($row, $col){
 
$board[$row][$col] = $currentPlayer
}
 
function  Show-Board(){
   
 Write-Host "-----------"
 Write-Host "|"$board[0][0]"|"$board[0][1]"|"$board[0][2]"|"
 Write-Host "|"$board[1][0]"|"$board[1][1]"|"$board[1][2]"|"
 Write-Host "|"$board[2][0]"|"$board[2][1]"|"$board[2][2]"|"
 Write-Host "-----------"
 
 
}
 
function Switch-Player(){
    if ($global:currentPlayer -eq $global:playerOneSymbol) {
        $global:currentPlayer = $global:playerTwoSymbol
 
    }      
    else {
        $global:currentPlayer = $global:playerOneSymbol
   
    }
}
 
function Run-Game(){
   
    Write-Host " Wecome to Tic Tac Toe, let' play!"
    $gameOver = $false
    while (-not $gameOver) {
        $row = Read-Host "Player $currentPlayer, choose row (0-2)"
        $col = Read-Host "Player $currentPlayer, choose column (0-2)"
        Insert-Tile $row $col
        Show-Board
        Switch-Player
        Get-Winner $board
        $count++
        if($count -eq 9){
            Write-Host "It's a tie"
        }
 
    }
}
     
 
 
Clear-Host
Run-Game -board $board -startingPlayer $playerOneSymbol