# Laden der Windows Forms-Assembly für die GUI-Erstellung
Add-Type -AssemblyName System.Windows.Forms

# Erstellen des Hauptfensters
$window = New-Object System.Windows.Forms.Form
$window.Text = "AD User Creation"     # Titel des Fensters
$window.Width = 500                    # Breite des Fensters
$window.Height = 450                   # Höhe des Fensters
$window.FormBorderStyle = "FixedSingle"   # Festlegen des Fensterrahmens
$window.StartPosition = "CenterScreen"    # Position des Fensters auf dem Bildschirm

# Erstellen von Labels für Benutzereingaben
#$labels = @{} Initialisieren eines leeren Hash-Arrays für Labels
# Label für den Vornamen
$labels["Firstname"] = New-Object System.Windows.Forms.Label
$labels["Firstname"].Text = "Firstname:"    # Beschriftung für Vorname
$labels["Firstname"].Location = New-Object System.Drawing.Point(20, 20)  # Positionierung
$labels["Firstname"].AutoSize = $true     # Automatische Größenanpassung
$window.Controls.Add($labels["Firstname"])  # Hinzufügen zum Fenster

$labels["Lastname"] = New-Object System.Windows.Forms.Label
$labels["Lastname"].Text = "Lastname:"
$labels["Lastname"].Location = New-Object System.Drawing.Point(20, 60)
$labels["Lastname"].AutoSize = $true
$window.Controls.Add($labels["Lastname"])

$labels["Description"] = New-Object System.Windows.Forms.Label
$labels["Description"].Text = "Description:"
$labels["Description"].Location = New-Object System.Drawing.Point(20, 100)
$labels["Description"].AutoSize = $true
$window.Controls.Add($labels["Description"])

$labels["Office"] = New-Object System.Windows.Forms.Label
$labels["Office"].Text = "Office:"
$labels["Office"].Location = New-Object System.Drawing.Point(20, 140)
$labels["Office"].AutoSize = $true
$window.Controls.Add($labels["Office"])

$labels["Phone"] = New-Object System.Windows.Forms.Label
$labels["Phone"].Text = "Phone:"
$labels["Phone"].Location = New-Object System.Drawing.Point(20, 180)
$labels["Phone"].AutoSize = $true
$window.Controls.Add($labels["Phone"])

$labels["JobTitle"] = New-Object System.Windows.Forms.Label
$labels["JobTitle"].Text = "Job Title:"
$labels["JobTitle"].Location = New-Object System.Drawing.Point(20, 220)
$labels["JobTitle"].AutoSize = $true
$window.Controls.Add($labels["JobTitle"])

$labels["Address"] = New-Object System.Windows.Forms.Label
$labels["Address"].Text = "Address:"
$labels["Address"].Location = New-Object System.Drawing.Point(20, 260)
$labels["Address"].AutoSize = $true
$window.Controls.Add($labels["Address"])

$labels["Email"] = New-Object System.Windows.Forms.Label
$labels["Email"].Text = "Email:"
$labels["Email"].Location = New-Object System.Drawing.Point(20, 300)
$labels["Email"].AutoSize = $true
$window.Controls.Add($labels["Email"])

# Erstellen von Textboxen für Benutzereingaben
#$textboxes = @{} Initialisieren eines leeren Hash-Arrays für Textboxen
# Textbox für den Vornamen
$textboxes["Firstname"] = New-Object System.Windows.Forms.TextBox
$textboxes["Firstname"].Location = New-Object System.Drawing.Point(150, 20)   # Positionierung
$textboxes["Firstname"].Size = New-Object System.Drawing.Size(300, 20)        # Größe der Textbox
$window.Controls.Add($textboxes["Firstname"])  # Hinzufügen zum Fenster


$textboxes["Lastname"] = New-Object System.Windows.Forms.TextBox
$textboxes["Lastname"].Location = New-Object System.Drawing.Point(150, 60)
$textboxes["Lastname"].Size = New-Object System.Drawing.Size(300, 20)
$window.Controls.Add($textboxes["Lastname"])

$textboxes["Description"] = New-Object System.Windows.Forms.TextBox
$textboxes["Description"].Location = New-Object System.Drawing.Point(150, 100)
$textboxes["Description"].Size = New-Object System.Drawing.Size(300, 20)
$window.Controls.Add($textboxes["Description"])

$textboxes["Office"] = New-Object System.Windows.Forms.TextBox
$textboxes["Office"].Location = New-Object System.Drawing.Point(150, 140)
$textboxes["Office"].Size = New-Object System.Drawing.Size(300, 20)
$window.Controls.Add($textboxes["Office"])

$textboxes["Phone"] = New-Object System.Windows.Forms.TextBox
$textboxes["Phone"].Location = New-Object System.Drawing.Point(150, 180)
$textboxes["Phone"].Size = New-Object System.Drawing.Size(300, 20)
$window.Controls.Add($textboxes["Phone"])

$textboxes["JobTitle"] = New-Object System.Windows.Forms.TextBox
$textboxes["JobTitle"].Location = New-Object System.Drawing.Point(150, 220)
$textboxes["JobTitle"].Size = New-Object System.Drawing.Size(300, 20)
$window.Controls.Add($textboxes["JobTitle"])

$textboxes["Address"] = New-Object System.Windows.Forms.TextBox
$textboxes["Address"].Location = New-Object System.Drawing.Point(150, 260)
$textboxes["Address"].Size = New-Object System.Drawing.Size(300, 20)
$window.Controls.Add($textboxes["Address"])

$textboxes["Email"] = New-Object System.Windows.Forms.TextBox
$textboxes["Email"].Location = New-Object System.Drawing.Point(150, 300)
$textboxes["Email"].Size = New-Object System.Drawing.Size(300, 20)
$window.Controls.Add($textboxes["Email"])


# Ereignishandler für Textboxen, um die automatisch generierte E-Mail anzuzeigen
# Hinzufügen eines Ereignishandlers für den Textänderungs-Event der Textbox "Firstname"
$textboxes["Firstname"].Add_TextChanged({
    Update-EmailTextBox   # Ruft die Funktion Update-EmailTextBox auf
})

# Hinzufügen eines Ereignishandlers für den Textänderungs-Event der Textbox "Lastname"
$textboxes["Lastname"].Add_TextChanged({
    Update-EmailTextBox   # Ruft die Funktion Update-EmailTextBox auf
})

# Definition der Funktion Update-EmailTextBox
function Update-EmailTextBox {
    # Lesen des Vornamens und des Nachnamens aus den Textboxen
    $firstname = $textboxes["Firstname"].Text
    $lastname = $textboxes["Lastname"].Text
    # Generierung der E-Mail-Adresse durch Zusammenfügen von Vorname, Nachname und einer festen Domäne
    $email = "$firstname.$lastname@noseryoung.ch"
    # Aktualisierung der Textbox "Email" mit der generierten E-Mail-Adresse
    $textboxes["Email"].Text = " $email"
}



# Erstellen von Buttons
$button_CreateUser = New-Object System.Windows.Forms.Button   # Erstellen eines Buttons für Benutzererstellung
$button_CreateUser.Location = New-Object System.Drawing.Point(20, 350)   # Positionierung des Buttons
$button_CreateUser.Size = New-Object System.Drawing.Size(120, 30)         # Größe des Buttons
$button_CreateUser.Text = "Create User"   # Text auf dem Button
$window.Controls.Add($button_CreateUser)   # Hinzufügen des Buttons zum Fenster

$button_Close = New-Object System.Windows.Forms.Button   # Erstellen eines Buttons zum Schließen
$button_Close.Location = New-Object System.Drawing.Point(150, 350)  # Positionierung des Buttons
$button_Close.Size = New-Object System.Drawing.Size(120, 30)        # Größe des Buttons
$button_Close.Text = "Close"    # Text auf dem Button
$window.Controls.Add($button_Close)   # Hinzufügen des Buttons zum Fenster

# Ereignishandler für Buttons
$button_CreateUser.Add_Click({   # Ereignishandler für den Button "Create User"
    # Lesen der Benutzereingaben aus den Textboxen
    $firstname = $textboxes["Firstname"].Text
    $lastname = $textboxes["Lastname"].Text
    $description = $textboxes["Description"].Text
    $office = $textboxes["Office"].Text
    $phone = $textboxes["Phone"].Text
    $jobtitle = $textboxes["JobTitle"].Text
    $address = $textboxes["Address"].Text
    
    # Automatische Generierung von E-Mail und Benutzername
    $email = "$firstname.$lastname@noseryoung.ch"
    $username = "$firstname.$lastname"
    
    # Hier sollte der Code zur Erstellung des AD-Benutzers eingefügt werden
    # New-ADUser -Name "$firstname $lastname" -GivenName $firstname -Surname $lastname -Description $description -Office $office -OfficePhone $phone -Title $jobtitle -StreetAddress $address -EmailAddress $email -SamAccountName $username
    
    # Anzeige der automatisch generierten E-Mail auf dem GUI
    $labels["Email"].Text = "Email: $email"   # Aktualisierung des E-Mail-Labels auf dem GUI
    
    Write-Host "Benutzer erstellt mit E-Mail: $email und Benutzername: $username"  # Ausgabe in der Konsole
})

$button_Close.Add_Click({   # Ereignishandler für den Button "Close"
    $window.Close()   # Schließen des Hauptfensters
})

# Anzeigen des Fensters
$window.ShowDialog()   # Anzeigen des Hauptfensters
