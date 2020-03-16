$rand = new-object System.Random
$conjunction = "the","my","we","our","and","but"
[string[]]$words = Get-Content -Path dict.txt
$count = $words.Count
Write-Host "Words count: "$count
if ($count -le 1000) {
    Write-Host "The dictionaty is too small will return a random password"
    $password1 = ([char[]](Get-Random -Input $(65..90) -Count 5)) -join "" 
    $password2 = ([char[]](Get-Random -Input $(35..37) ))  
    $password3 = ([char[]](Get-Random -Input $(48..57) -Count 2)) -join "" 
    $new_password = $password1+$password2+$password3
} else {
    $word1 = $words[$rand.Next(0,$words.Count)]
    $con = ($conjunction[$rand.Next(0,$conjunction.Count)])
    $word2 = $words[$rand.Next(0,$words.Count)]
    $new_password  = $word1 + " " + $con + " " + $word2
}
return $new_password