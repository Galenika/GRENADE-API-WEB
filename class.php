<?php

include_once "config.php";

session_start();

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ERROR);

class Panel
{
    var $mysqli, $user;
    var $pagination_map, $pagination_grenade, $paginationStart, $paginationLimit, $paginationHTML;

    public function connectMySQLi()
    {
        $connection = new mysqli(db_host, db_username, db_password, db_database);

        if ($connection->connect_error)
            die("Невозможно подключиться к БД!");

        $this->mysqli = $connection;
    }

    /**
     * @param $string
     * @param int $mysql
     * @return string
     */
    function formChars($string, $mysql = 0)
    {
        if ($mysql)
            return mysqli_real_escape_string($this->mysqli, $string);
        else
            return nl2br(htmlspecialchars(trim($string), ENT_QUOTES), false);
    }

    /**
     * @param $name
     * @param null $params
     */
    function drawTemplate($name, $params = null)
    {
        include_once "templates/$name.php";
    }

    /**
     * @param $type
     * @param $string
     * @param bool $center
     * @param bool $refresh
     * @return string
     */
    public function showAlert($type, $string, $center = false, $refresh = false)
    {
        if ($refresh > 0)
            $refresh = "<script>setTimeout(function() { window.location.reload(); }, $refresh)</script>";

        if ($center)
            $center = "text-center";

        return "<div class=\"alert alert-$type $center\">$string</div>$refresh";
    }

    /**
     * @param $array
     * @param $selected
     * @return null|string
     */
    public function arrayToSelect($array, $selected)
    {
        if (!is_array($array))
            return null;

        $html = null;

        foreach ($array as $key => $value) {
            $value_html = null;
            $selected_html = null;

            if ($selected == $key || $selected == $value)
                $selected_html = "selected";

            $html .= "<option value=\"$key\" $selected_html>$value</option>";
        }

        return $html;
    }
	
	/**
     * @param $array
     * @param $selected
     * @return null|string
     */
    public function arrayToSelect2($array, $selected)
    {
        if (!is_array($array))
            return null;

        $html = null;

        foreach ($array as $key => $value) {
            $value_html = null;
            $selected_html = null;

            if (in_array($key, $selected))
                $selected_html = "selected";

            $html .= "<option value=\"$key\" $selected_html>$value</option>";
        }

        return $html;
    }

    /**
     * @param $bool
     * @param $path
     */
    public function userRedirect($bool, $path)
    {
        if ($this->user == $bool)
            header("Location: $path");
    }

    /**
     * @param $username
     * @param $password
     * @return string
     */
    public function auth($username, $password)
    {
        GLOBAL $_SESSION;
        $username = $this->formChars($username, 1);
        $password = md5(md5("MIDNIGHT") . md5($this->formChars($password, 1)));
        $success = false;

        if ($username == "") {
            $message = "Пожалуйста, введите ваш логин и пароль!";
        } else {
            $query = $this->mysqli->query("SELECT * FROM users WHERE username='$username' and password='$password'");
            $data = $query->fetch_object();
            if (mysqli_num_rows($query)) {
                $_SESSION["user"] = $data->id . "|" . $data->password;
                $success = true;
                $message = "Успешная авторизация!";
            } else {
                $message = "Неверный логин или пароль!";
            }
        }

        return $this->showAlert($success ? "success" : "danger", $message, true, $success);
    }

    public function getCurrentUser()
    {
        GLOBAL $_SESSION;

        if (!isset($_SESSION["user"]))
            return;

        $parts = explode('|', $_SESSION["user"]);
        $id = $parts[0];
        $password = $parts[1];

        $query = $this->mysqli->query("SELECT id FROM users WHERE id=$id and password='$password'");

        if (mysqli_num_rows($query))
            $this->user = (int)$query->fetch_object()->id;

        return;
    }

    /**
     * @param $id
     * @param $row
     * @return null
     */
    public function getUserData($id, $row)
    {
        if (!is_int($id))
            return null;

        $query = $this->mysqli->query("SELECT $row FROM users WHERE id=$id");

        if (mysqli_num_rows($query))
            return $query->fetch_object()->$row;

        return null;
    }

    /**
     * @param $type
     */
    function pagination($type)
    {
        GLOBAL $_GET;

        $this->pagination_map = $this->formChars($_GET["map"], 1);
        $this->pagination_grenade = $this->formChars($_GET["grenade"], 1);
        $page = $_GET["page"];

        if ($type == "moderating") {
            $targetPage = "../grenade/moderating";
            $searchQuery = "SELECT COUNT(*) as num FROM moderating WHERE map LIKE '%$this->pagination_map%' AND grenade LIKE '%$this->pagination_grenade%'";
        } else if ($type == "approved") {
            $targetPage = "../grenade/approved";
            $searchQuery = "SELECT COUNT(*) as num FROM approved WHERE map LIKE '%$this->pagination_map%' AND grenade LIKE '%$this->pagination_grenade%'";
        }

        if ($this->pagination_map == null && $this->pagination_grenade == null) {
            $query = "SELECT COUNT(*) as num FROM $type";
            $pageUrl = "$targetPage?page=";
        } else {
            $query = $searchQuery;
            $pageUrl = "$targetPage?map=$this->pagination_map&grenade=$this->pagination_grenade&page=";
        }

        $totalPages = mysqli_fetch_array($this->mysqli->query($query));
        $totalPages = $totalPages[num];

        $this->paginationLimit = 15;
        $adjacent = 3;

        if ($page) {
            $this->paginationStart = ($page - 1) * $this->paginationLimit;
        } else {
            $this->paginationStart = 0;
        }

        if ($page == 0) $page = 1;
        $prev = $page - 1;
        $next = $page + 1;
        $lastPage = ceil($totalPages / $this->paginationLimit);
        $lpm1 = $lastPage - 1;

        $this->paginationHTML = "";
        if ($lastPage > 1) {
            $this->paginationHTML .= "<div class=\"panel-footer pagination-footer\"><ul class=\"pagination\">";

            if ($page > 1) {
                $this->paginationHTML .= "<li><a href=\"$pageUrl$prev\"><span>«</span></a></li>";
            } else {
                $this->paginationHTML .= "<li class=\"disabled\"><span>«</span></li>";
            }

            if ($lastPage < 7 + ($adjacent * 2)) {
                for ($counter = 1; $counter <= $lastPage; $counter++) {
                    if ($counter == $page) {
                        $this->paginationHTML .= "<li class=\"active\"><span>$counter</span></li>";
                    } else {
                        $this->paginationHTML .= "<li><a href=\"$pageUrl$counter\">$counter</a></li>";
                    }
                }
            } elseif ($lastPage > 5 + ($adjacent * 2)) {
                if ($page < 1 + ($adjacent * 2)) {
                    for ($counter = 1; $counter < 4 + ($adjacent * 2); $counter++) {
                        if ($counter == $page) {
                            $this->paginationHTML .= "<li class=\"active\"><span>$counter</span></li>";
                        } else {
                            $this->paginationHTML .= "<li><a href=\"$pageUrl$counter\">$counter</a></li>";
                        }
                    }
                    $this->paginationHTML .= "<li class=\"disabled\"><span>...</span></li>";
                    $this->paginationHTML .= "<li><a href=\"$pageUrl$lpm1\">$lpm1</a></li>";
                    $this->paginationHTML .= "<li><a href=\"$pageUrl$lastPage\">$lastPage</a></li>";
                } elseif ($lastPage - ($adjacent * 2) > $page && $page > ($adjacent * 2)) {
                    $this->paginationHTML .= "<li><a href=\"" . $pageUrl . "1\">1</a></li>";
                    $this->paginationHTML .= "<li><a href=\"" . $pageUrl . "2\">2</a></li>";
                    $this->paginationHTML .= "<li class=\"disabled\"><span>...</span></li>";
                    for ($counter = $page - $adjacent; $counter <= $page + $adjacent; $counter++) {
                        if ($counter == $page) {
                            $this->paginationHTML .= "<li class=\"active\"><span>$counter</span></li>";
                        } else {
                            $this->paginationHTML .= "<li><a href=\"$pageUrl$counter\">$counter</a></li>";
                        }
                    }
                    $this->paginationHTML .= "<li class=\"disabled\"><span>...</span></li>";
                    $this->paginationHTML .= "<li><a href=\"$pageUrl$lpm1\">$lpm1</a></li>";
                    $this->paginationHTML .= "<li><a href=\"$pageUrl$lastPage\">$lastPage</a></li>";
                } else {
                    $this->paginationHTML .= "<li><a href=\"" . $pageUrl . "1\">1</a></li>";
                    $this->paginationHTML .= "<li><a href=\"" . $pageUrl . "2\">2</a></li>";
                    $this->paginationHTML .= "<li class=\"disabled\"><span>...</span></li>";
                    for ($counter = $lastPage - (2 + ($adjacent * 2)); $counter <= $lastPage; $counter++) {
                        if ($counter == $page) {
                            $this->paginationHTML .= "<li class=\"active\"><span>$counter</span></li>";
                        } else {
                            $this->paginationHTML .= "<li><a href=\"$pageUrl$counter\">$counter</a></li>";
                        }
                    }
                }
            }

            if ($page < $counter - 1) {
                $this->paginationHTML .= "<li><a href=\"$pageUrl$next\"><span>»</span></a></li>";
            } else {
                $this->paginationHTML .= "<li class=\"disabled\"><span>»</span></li>";
                $this->paginationHTML .= "</ul></div>\n";
            }
        }
    }
}

$panel = new Panel();
$panel->connectMySQLi();
$panel->getCurrentUser();