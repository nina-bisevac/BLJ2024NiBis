# Ein Startwort ist gegeben. (z.B Hallo)
# Anschliessend wird der Benutzer aufgefordert ein weiteres Wort einzugeben.
# Falls dieses mit dem Buchstaben beginnt, mit welchem das letzte endet,
# wird es dem String angehängt und dieser wird ausgegeben.
# z.B: "Hallo Olger"
# Falls das Wort nicht passt wird eine Meldung ausgegeben, dass dies nicht geht.
# Das Spiel geht unendlich weiter bis der Benutzer das Programm abbricht (CTRL + C)

# Ergänzungsmöglichkeiten
# Das Startwort sowie die gültigen Worte sollen anhand einer Wortliste gewählt werden
# i.E. https://www.ef.com/wwen/english-resources/english-vocabulary/top-3000-words/

# Jedes Wort darf nur einmal vorkommen


# Start word
$start_word = "Hello"
Write-Host "Start word: $start_word"

# List of valid words
$valid_words =  Get-Content -Path "C:\Users\Anna\Downloads\wordlist.txt"

# Function to check if the new word is valid and starts with the correct letter
function Is-Valid {
    param(
        [string]$word,
        [char]$last_letter
    )
    if ($valid_words -contains $word -and $word[0] -eq $last_letter) {
        return $true
    }
    return $false
}

# Main function
function String-Concatenate {
    param(
        [string]$start_word
    )
    $last_letter = $start_word[-1]
    Write-Host "Last letter of the start word: $last_letter"

    while ($true) {
        $new_word = Read-Host "Enter another word (or end with CTRL+C)"
        if (Is-Valid -word $new_word -last_letter $last_letter) {
            Write-Host "Valid word: $new_word"
            $start_word += " $new_word"
            Write-Host "Current string: $start_word"
            $last_letter = $new_word[-1]
        }
        else {
            Write-Host "The word doesn't fit or has already been used."
        }
    }
}

# Start the game
String-Concatenate -start_word $start_word

