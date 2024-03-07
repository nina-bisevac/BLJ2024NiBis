# Import the required module for working with Excel
Import-Module -Name ImportExcel

# Function to hash passwords
function Hash-Password {
    param (
        [string]$Password
    )

    # You can use different hashing algorithms here, such as SHA256
    $hashedPassword = ConvertTo-SecureString -String $Password -AsPlainText -Force | ConvertFrom-SecureString
    return $hashedPassword
}

# Function to sign up
function SignUp {
    Write-Host "=== Sign Up ==="
    $username = Read-Host "Enter username"
    $password = Read-Host "Enter password" -AsSecureString
    $hashedPassword = Hash-Password -Password $password

    # Save to Excel file
    $userData = [PSCustomObject]@{
        Username = $username
        HashedPassword = $hashedPassword
    }
    $userData | Export-Excel -Path "users.xlsx" -WorksheetName "Users" -AutoSize -Append
}

# Function to log in
function LogIn {
    Write-Host "=== Log In ==="
    $username = Read-Host "Enter username"
    $password = Read-Host "Enter password" -AsSecureString
    $hashedPassword = Hash-Password -Password $password

    # Retrieve hashed password from Excel file
    $users = Import-Excel -Path "users.xlsx" -WorksheetName "Users"
    $user = $users | Where-Object { $_.Username -eq $username }

    if ($user -and $user.HashedPassword -eq $hashedPassword) {
        Write-Host "Login successful"
    } else {
        Write-Host "Invalid username or password"
    }
}

# Main menu
while ($true) {
    Write-Host "1. Sign Up"
    Write-Host "2. Log In"
    Write-Host "3. Exit"
    $choice = Read-Host "Enter your choice"

    switch ($choice) {
        '1' { SignUp }
        '2' { LogIn }
        '3' { break }
        default { Write-Host "Invalid choice" }
    }
}
