<?php
$world = "World";
echo "Hello" . $world; # put a breakpoint here
echo "<br/>";
echo (extension_loaded('xdebug') ? '' : 'non '), 'exists';
echo "<br/>";
xdebug_get_code_coverage();


$txt = "Hello world!";
$x = 5;
$y = 10.5;

echo $txt;
echo "<br>";
echo $x;
echo "<br>";
echo $y;
