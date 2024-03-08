# Benutzername abfragen
$username = Read-Host "Gib den Benutzernamen ein"
 
# Passwort sicher abfragen
$securePassword = Read-Host "Gib das Passwort ein" -AsSecureString
 
# Passwort-Hash berechnen
$hashBytes = [System.Text.Encoding]::UTF8.GetBytes((ConvertFrom-SecureString $securePassword))
$hash = Get-FileHash -InputStream ([System.IO.MemoryStream]::new($hashBytes)) -Algorithm SHA256
 
# Pfad zur vorhandenen CSV-Datei
$csvFilePath = "C:\Users\naemi\BLJ2024NaRos\Project\PowerShell\2024\KW-10\Hashing\DB.csv"
 
# Vorhandene Daten importieren oder leere Liste erstellen
$existingData = @(Import-Csv -Path $csvFilePath -ErrorAction SilentlyContinue)
 
# Neuen Datensatz zum Anhängen erstellen
$newRow = [PSCustomObject]@{user=$username; hash=$hash.Hash}
 
# Neuen Datensatz zu den vorhandenen Daten hinzufügen
$existingData += $newRow
 
# Aktualisierte Daten zurück in die CSV-Datei exportieren
$existingData | Export-Csv -Path $csvFilePath -NoTypeInformation -Force