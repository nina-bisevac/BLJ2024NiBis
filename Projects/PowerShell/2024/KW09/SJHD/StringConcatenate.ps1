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



$start_word = "Hello"
Write-Host "Start word: $start_word"

$valid_words = Get-Content -Path "C:\Users\ninab\BLJ2024NiBis\Projects\PowerShell\2024\KW09\StringConcatenate\wordlist.txt"

function Is-Valid {
    param(
        [string]$word,
        [char]$last_letter
    )
    $word = $word.Trim()
    if ($valid_words -like "*$word*" -and $word[0] -eq $last_letter) {
        return $true
    }
    return $false
}

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

String-Concatenate -start_word $start_word
