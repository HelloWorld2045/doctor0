<?php
# FileName="Connection_php_mysql.htm"
# Type="MYSQL"
# HTTP="true"
$hostname_localhost = "";
$database_localhost = "";
$username_localhost = "";
$password_localhost = "";
global $localhost ;
$localhost = mysqli_connect($hostname_localhost, $username_localhost, $password_localhost) or trigger_error(mysql_error(),E_USER_ERROR); 

// 检查mysql函数是否存在
if(!function_exists('mysql_query')){
    function mysql_query($SQL, $localhost_conn=null){
        if(is_null($localhost_conn)){
            global $localhost;
            return mysqli_query($localhost,$SQL);
        } 
        return mysqli_query($localhost_conn,$SQL);
    }
}

// 兼容之前的函数
if(!function_exists('mysql_select_db')){
    function mysql_select_db($database_localhost, $localhost){
        return mysqli_select_db($localhost,$database_localhost);
    }
}

// 兼容之前的函数
if(!function_exists('get_magic_quotes_gpc')){
    function get_magic_quotes_gpc(){
        return false;
    }
}
// 兼容之前的函数
if(!function_exists('mysql_fetch_assoc')){
    function mysql_fetch_assoc($localhost){
        return mysqli_fetch_assoc($localhost);
    }
}
// 兼容之前的函数
if(!function_exists('mysql_num_rows')){
    function mysql_num_rows($localhost){
        return mysqli_num_rows($localhost);
    }
}
// 兼容之前的函数
if(!function_exists('mysql_error')){
    function mysql_error(){
        global $localhost;
        return mysqli_error($localhost);
    }
}




?>
