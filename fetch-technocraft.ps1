cls


#$root_url = 'http://www.technocraft.org/sirait/tarombo.cgi?lyr=5;wfe=Y;dgh=L;man=100273'
#$root_url = 'http://www.technocraft.org/sirait/tarombo.cgi?lyr=5;wfe=Y;dgh=L;man=100403'
$root_url = 'http://www.technocraft.org/sirait/tarombo.cgi?lyr=5;wfe=Y;dgh=L;man=100390'

#$root_url = 'http://www.technocraft.org/sirait/tarombo.cgi?lyr=5;wfe=Y;dgh=L;man=100273;act=tree'
#$family = 'http://www.technocraft.org/sirait/tarombo.cgi?lyr=5;wfe=Y;dgh=L;man=100273;act=pick_man'
<#
$r = Invoke-WebRequest -Uri $root_url
$s = $r.Content

$m = [regex]::Matches($s, '\<tr\>\<td width\=\"7\%\"\>\&nbsp\;\<\/td\>\<td colspan\=5\>\<a href\=\"(.*?)\"\>(.*?)\<\/a\>')
#$m[0].Groups[1].Value
#$m[0].Groups[2].Value

foreach ($i in $m) {
    $link = $i.Groups[1].Value.TrimEnd(';act=pick_man')
    $name = $i.Groups[2].Value
    #$link
    #$name
}
#>

# fetch family
$r2 = Invoke-WebRequest -Uri ($root_url + ';act=pick_man')

$m2 = [regex]::Matches($r2.Content, '(?ims)(.*?)Istri\:(.*?)Anak\:(.*?)Boru\:(.*)')
$husband_scrap, $wife_scrap, $son_scrap, $daughter_scrap = $m2[0].Groups[1].Value, $m2[0].Groups[2].Value, $m2[0].Groups[3].Value, $m2[0].Groups[4].Value

$husband = [regex]::Matches($husband_scrap, '(?ims)\<td width\=\"50\%\" align\=left nowrap\>\&nbsp\;(.+?)\<\/td\>\n\<td width\=\"20\%\" align\=left nowrap\>\&nbsp\;(.*?)\<\/td\>')
$husband_name = $husband[0].Groups[1].Value
$husband_location = $husband[0].Groups[2].Value
$husband_name, $husband_location

$wife = [regex]::Matches($wife_scrap, '(?ims)\<td width\=\"50\%\" align\=left nowrap\>\&nbsp\;(\d+?)\&nbsp\;\&nbsp\;(.+?)\<\/td\>')
foreach ($i in $wife) {
    $wife_number = $i.Groups[1].Value
    $wife_name = $i.Groups[2].Value
    $wife_number, $wife_name
}

$son = [regex]::Matches($son_scrap, '(?ims)\<td width\=\"50\%\" align\=left nowrap\>\&nbsp\;(\d+?)\&nbsp\;\&nbsp\;(.+?)\<\/td\>\n\<td width\=\"20\%\" align\=left nowrap\>\&nbsp\;(.*?)\<\/td\>')
foreach ($i in $son) {
    $son_number = $i.Groups[1].Value
    $son_name = $i.Groups[2].Value
    $son_location = $i.Groups[3].Value
    # fetch link
    #$son_link
    $son_number, $son_name, $son_location
}

$daughter = [regex]::Matches($daughter_scrap, '(?ims)\<td width\=\"50\%\" align\=left nowrap\>\&nbsp\;(\d+?)\&nbsp\;\&nbsp\;(.+?)\<\/td\>\n\<td width\=\"20\%\" align\=left nowrap\>\&nbsp\;(.*?)\<\/td\>')
foreach ($i in $daughter) {
    $daughter_number = $i.Groups[1].Value
    $daughter_name = $i.Groups[2].Value
    $daughter_location = $i.Groups[3].Value
    $daughter_number, $daughter_name, $daughter_location
}

