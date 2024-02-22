function write-hallo(){
    write-host "Hallo"
    write-peter
}
function write-peter(){
    write-host "peter"
}

function write-anything(){
    param(
        $Name,
        $Name2
    )

    Write-Host "Der erste Name ist" $Name
    Write-Host "Der zweite Name ist" $Name2
}

function sqr(){
    param(
        $num
    )
    $result = $num * $num
    return $result
}


$newNum = sqr -num 5
Write-Host $newNumecho
Write-Host  = $newNum