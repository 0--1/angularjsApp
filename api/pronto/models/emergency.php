<?php

class Emergency {
   function __construct($_url, $_method, $_data) {
        echo strtolower($_method);
        print_r($_data);
        print_r($_url);
   }
}

?>