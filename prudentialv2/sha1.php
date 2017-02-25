#!/usr/bin/env php
<?php

$a = file_get_contents("google/shattered-1.pdf");
$b = file_get_contents("google/shattered-2.pdf");
# print sha1($a)."\n";
# print sha1($b)."\n";

$a = (string)$a;
$b = (string)$b;
print sha1($a)."\n";
print sha1($b)."\n";

# $req = "wget http://54.202.82.13/index.php?name=$a&password=$b";
# print $req;
# passthru($req, $ret);
# print $ret;

?>
