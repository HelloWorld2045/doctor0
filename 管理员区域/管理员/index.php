<?php require_once('../../Connections/localhost.php'); ?>
<?php
$currentPage = $_SERVER["PHP_SELF"];

$maxRows_Recordset1 = 50;
$pageNum_Recordset1 = 0;
if (isset($_GET['pageNum_Recordset1'])) {
  $pageNum_Recordset1 = $_GET['pageNum_Recordset1'];
}
$startRow_Recordset1 = $pageNum_Recordset1 * $maxRows_Recordset1;

mysql_select_db($database_localhost, $localhost);
$query_Recordset1 = "SELECT * FROM 管理员 WHERE 是否删除 = 0 ORDER BY id DESC";
$query_limit_Recordset1 = sprintf("%s LIMIT %d, %d", $query_Recordset1, $startRow_Recordset1, $maxRows_Recordset1);
$Recordset1 = mysql_query($query_limit_Recordset1, $localhost) or die(mysql_error());
$row_Recordset1 = mysql_fetch_assoc($Recordset1);

if (isset($_GET['totalRows_Recordset1'])) {
  $totalRows_Recordset1 = $_GET['totalRows_Recordset1'];
} else {
  $all_Recordset1 = mysql_query($query_Recordset1);
  $totalRows_Recordset1 = mysql_num_rows($all_Recordset1);
}
$totalPages_Recordset1 = ceil($totalRows_Recordset1/$maxRows_Recordset1)-1;

$queryString_Recordset1 = "";
if (!empty($_SERVER['QUERY_STRING'])) {
  $params = explode("&", $_SERVER['QUERY_STRING']);
  $newParams = array();
  foreach ($params as $param) {
    if (stristr($param, "pageNum_Recordset1") == false && 
        stristr($param, "totalRows_Recordset1") == false) {
      array_push($newParams, $param);
    }
  }
  if (count($newParams) != 0) {
    $queryString_Recordset1 = "&" . htmlentities(implode("&", $newParams));
  }
}
$queryString_Recordset1 = sprintf("&totalRows_Recordset1=%d%s", $totalRows_Recordset1, $queryString_Recordset1);
?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
<h1>搜索</h1>
<form id="搜索" name="搜索" method="get" action="">
  <table width="100%" border="1">
    <tr>
      <td>用户id</td>
      <td>&nbsp;</td>
      <td>用户名</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>角色名</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td><label>
        <input name="搜索" type="submit" id="搜索" value="搜索" />
        <input name="重置" type="reset" id="重置" value="重置" />
      </label></td>
    </tr>
  </table>
</form>
<h1>列表</h1>

<table width="100%" border="1" align="center">
  <tr>
    <td>id</td>
    <td>用户名</td>
    <td>密码</td>
    <td>角色id</td>
    <td>备注</td>
    <td>创建时间</td>
    <td>更新时间</td>
    <td>是否删除</td>
    <td>操作</td>
  </tr>
  <?php do { ?>
    <tr>
      <td><a href="更新.php?recordID=<?php echo $row_Recordset1['id']; ?>"> <?php echo $row_Recordset1['id']; ?>&nbsp; </a> </td>
      <td><?php echo $row_Recordset1['用户名']; ?>&nbsp; </td>
      <td><?php echo $row_Recordset1['密码']; ?>&nbsp; </td>
      <td><?php echo $row_Recordset1['角色id']; ?>&nbsp; </td>
      <td><?php echo $row_Recordset1['备注']; ?>&nbsp; </td>
      <td><?php echo $row_Recordset1['创建时间']; ?>&nbsp; </td>
      <td><?php echo $row_Recordset1['更新时间']; ?>&nbsp; </td>
      <td><?php echo $row_Recordset1['是否删除']; ?>&nbsp; </td>
      <td><a href="删除.php?id=<?php echo $row_Recordset1['id']; ?>">删除</a> <a href="更新.php?id=<?php echo $row_Recordset1['id']; ?>">更新</a></td>
    </tr>
    <?php } while ($row_Recordset1 = mysql_fetch_assoc($Recordset1)); ?>
</table>
<br>
<table border="0" width="50%" align="center">
  <tr>
    <td width="23%" align="center"><?php if ($pageNum_Recordset1 > 0) { // Show if not first page ?>
          <a href="<?php printf("%s?pageNum_Recordset1=%d%s", $currentPage, 0, $queryString_Recordset1); ?>">第一页</a>
          <?php } // Show if not first page ?>
    </td>
    <td width="31%" align="center"><?php if ($pageNum_Recordset1 > 0) { // Show if not first page ?>
          <a href="<?php printf("%s?pageNum_Recordset1=%d%s", $currentPage, max(0, $pageNum_Recordset1 - 1), $queryString_Recordset1); ?>">前一页</a>
          <?php } // Show if not first page ?>
    </td>
    <td width="23%" align="center"><?php if ($pageNum_Recordset1 < $totalPages_Recordset1) { // Show if not last page ?>
          <a href="<?php printf("%s?pageNum_Recordset1=%d%s", $currentPage, min($totalPages_Recordset1, $pageNum_Recordset1 + 1), $queryString_Recordset1); ?>">下一页</a>
          <?php } // Show if not last page ?>
    </td>
    <td width="23%" align="center"><?php if ($pageNum_Recordset1 < $totalPages_Recordset1) { // Show if not last page ?>
          <a href="<?php printf("%s?pageNum_Recordset1=%d%s", $currentPage, $totalPages_Recordset1, $queryString_Recordset1); ?>">最后一页</a>
          <?php } // Show if not last page ?>
    </td>
  </tr>
</table>
记录 <?php echo ($startRow_Recordset1 + 1) ?> 到 <?php echo min($startRow_Recordset1 + $maxRows_Recordset1, $totalRows_Recordset1) ?> (总共 <?php echo $totalRows_Recordset1 ?>
<p>&nbsp;</p>
<?php if ($totalRows_Recordset1 == 0) { // Show if recordset empty ?>
  <p>没有记录，欢迎添加！  </p>
  <?php } // Show if recordset empty ?></body>
</html>
