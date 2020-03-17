#$VerbosePreference = "Continue"
$min_char = 13                    # the minimum number of characters in the password
$max_char = 18                    # the maximum number of characters in the password
$min_words = 1000                 # the minimum number of words in the dictionary
$pwd_dict_file = "dict.txt"       # the word dictionary

$rand = new-object System.Random
$conjunction = "the","my","we","our","and","but"
[string[]]$words = Get-Content -Path $pwd_dict_file 
$count = $words.Count
Write-Verbose "Words count: $count"
if ($count -le $min_words) {
    Write-Verbose "The dictionaty is too small. Will return a random password"
    $password1 = ([char[]](Get-Random -Input $(65..90) -Count 5)) -join "" 
    $password2 = ([char[]](Get-Random -Input $(35..37) ))  
    $password3 = ([char[]](Get-Random -Input $(48..57) -Count 2)) -join "" 
    $new_password = $password1+$password2+$password3
} else {
    do {
        $word1 = $words[$rand.Next(0,$words.Count)]
        $con = ($conjunction[$rand.Next(0,$conjunction.Count)])
        $word2 = $words[$rand.Next(0,$words.Count)]
        $new_password  = $word1 + $con + $word2
        $len = $new_password.Length
        Write-Verbose "$new_password ($len)" 
    } until (($len -le $max_char) -and ($len -ge $min_char))
}
return $new_password