# ---C/Java like tasks---
# Wie erstelle ich eine neue Variable?
$var = 22

# Wie erstelle ich ein Array?
$arr1 = @(22, "Mimimi", 2, "hahaha")

# Wie erstelle ich ein Mehrdimensionales Array?
$arr2 = @("Hallo",34),("Bonjour",73),("Ciao",47)

# Wie funktionieren bekannte Kontrollstrukturen? (If/Else, Switch, While, DoWhile, For, ForEach)
#If/Else 
if(10 -eq $x -and $y -ne 10){
    Write-Host "Bedingung erfüllt!"
   }
   else{
    Write-Host "Bedingung nicht erfüllt!"
   }

#Switch
switch($x){
    1 { Write-Host "Hello World!" ;break}
    2 { Write-Host "!World Hello" ;break}
    default { Write-Host "HI!" }
    }

#While 
while($val -ne 10){
    $val++
    Write-Host $val
   }   

#DoWhile  
Do{ 
    $val++ 
     Write-Host $val
    }while($val -ne 10)

#For 
for($i=0; $i -lt 10; $i++){
    Write-Host $i
   }

#ForEach
$arr3=@(1, 2, 3, 4 ,5 ,6)
foreach($element in $arr){
 Write-Host $element
}

# Wie vergleiche ich Dinge -> Operators (AND, OR, NOT, ==, <, >, <=, >=)
#AND 
-and

#OR 
-or

#NOT 
-ne

#== 
-eq

#< 
-gt

#> 
-lt

#<= 
-ge

#>= 
-le

# ---Bash like tasks---
# Display the current date and time
Get-Date

# Display a list of all the files in the current directory
ls

# Display a list of all the files in a specific directory
ls ./OneDrive

# Display the contents of a file$
Get-Content -Path .\myfile.txt

# Create a new folder
mkdir myfolder

# Create a new file
New-Item -Name "myfile.txt" -ItemType File

# Copy a file to a different location
Copy-Item -Path .\myfile.txt -Destination .\myfolder\

# Rename a file
Rename-Item -Path .\myfile.txt -NewName "my_file.txt"

# Delete a file
Remove-Item -Path .\my_file.txt

# Create a new text file and append some text to it
echo "text" >> myfile.txt
