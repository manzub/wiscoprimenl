<?php


function connectDb() {
  global $db_user,$db_host,$db_pass, $database;

  $conn = mysqli_connect($db_host,$db_user,$db_pass,$database);
  if(!$conn) {
      die("Connection: ".mysqli_connect_error());
  }
  return $conn;
}

function selectQuery($query, $options=null) {
  $result = mysqli_query(connectDb(), $query);
  if(!$options) {
      return $result;
  }
}

function otherQuery($query) {
  selectQuery($query, 1);
}

function getUserInfoById($userid, $info) {
    $query = selectQuery("SELECT * FROM members WHERE id = '$userid'");
    $row = mysqli_fetch_assoc($query);
    return $row[$info];
}

function getTag($tagid, $type = 2) {
    $query = selectQuery("SELECT * FROM tags WHERE id = '$tagid' and type = $type");
    $row = mysqli_fetch_assoc($query);
    return ucfirst($row['name']);
}

function sendEmail($email, $subject, $body) {
    $to = $email;
    $message = wordwrap($body, 70, "\n");
    $message = "<body>$message</body>";

    $headers = 'Content-type: text/html; charset=iso-8859-1; charset=utf-8'."\n".
        'From: CryptoVest <admin@cryptovest.com>' . "\n" .
        'Reply-To: admin@cryptovest.com' . "\n" .
        'Return-Path: admin@cryptovest.com' . "\n" .
        'Organization: CryptoVest' . "\n" .
        'MIME-Version: 1.0' . "\n" .
        'X-Priority: 1' . "\n" .
        'X-Mailer: PHP/' . phpversion();

    mail($to, $subject, $message, $headers);
}