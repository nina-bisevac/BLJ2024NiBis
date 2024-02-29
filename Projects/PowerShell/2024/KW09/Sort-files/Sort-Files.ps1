# Erstellen Sie einen Ordner TestingPurpose mit 2 Unterordner SubFolder1 und SubFolder2
New-Item -ItemType Directory -Path ".\TestingPurpose\SubFolder1"
New-Item -ItemType Directory -Path ".\TestingPurpose\SubFolder2"

# Erstellen Sie einige Testdateien in diesen Ordnern:
# 	TypeATest1.txt, TypeATest2.txt ... TypeATest50.txt in SubFolder1
# 	TypeBTest51.txt, TypeBTest52.txt ... TypeBTest100 in SubFolder2 



# Verschiebe alle Dateien, die eine ungerade Zahl im Namen haben, in SubFolder2.
Get-ChildItem -Path ".\TestingPurpose\SubFolder1" | Where-Object { $_.Name -match 'TypeATest(\d+)\.txt' -and [int]::Parse($matches[1]) % 2 -eq 1 } | Move-Item -Destination ".\TestingPurpose\SubFolder2"

# Verschiebe alle Dateien, die eine gerade Zahl im Namen haben, in SubFolder1.
Get-ChildItem -Path ".\TestingPurpose\SubFolder2" | Where-Object { $_.Name -match 'TypeATest(\d+)\.txt' -and [int]::Parse($matches[1]) % 2 -eq 0 } | Move-Item -Destination ".\TestingPurpose\SubFolder1"


# Benenne den Ordner SubFolder1 in EvenFilesContainer und SubFolder2 in OddFilesContainer um.
Rename-Item -Path ".\TestingPurpose\SubFolder1" -NewName "EvenFilesContainer"
Rename-Item -Path ".\TestingPurpose\SubFolder2" -NewName "OddFilesContainer"

# Erstellen Sie eine Liste aller Dateien, die sich derzeit im Ordner TestingPurpose befinden.
Get-ChildItem -Path ".\TestingPurpose" -File
#      Beispiel: MasterFile.txt:

# 		Ab JJJJMMTT HH: MM befinden sich folgende Dateien in TestingPurpose:
# 		C:\TestingPurpose\EvenFilesContainer\TypeBTest2.txt
# 		.
# 		.
# 		C:\TestingPurpose\OddFilesContainer\TypeATest99.txt

# Löschen Sie alle Dateien, die mit TypeA beginnen
Remove-Item -Path ".\TestingPurpose\*\TypeA*" -Include "*.txt" -Force


