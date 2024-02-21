# number guessing game
$secret = Get-Random -Minimum 0 -Maximum 100

# ask the user repeatedly to enter a number until he gets it right.
# Tell the user if his number is too high or too low

Write-Host "Welcome to Guess The Number!"

do {
    $eingabe = Read-Host "Enter your guess"

    $guess = $eingabe
    if ($guess -eq $secret) {
        Write-Host "Congratulations, You found the number!"
    }
    elseif ($guess -gt $secret) {
        Write-Host "Incorrect! Your guess is too high."
    }
    else {
        Write-Host "Incorrect! Your guess is too low."
    }
} until ($guess -eq $secret)

